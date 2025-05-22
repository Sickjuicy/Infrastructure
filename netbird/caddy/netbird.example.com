https://netbird.example.com {
    # Dashboard (Web UI)
    reverse_proxy /* {NETBIRDIP}:80

    # gRPC-Web API (für Browser-UI)
    reverse_proxy /api/* {NETBIRDIP}:33073

    # gRPC für internen Netbird-Client
    reverse_proxy /management.ManagementService/* h2c://{NETBIRDIP}:33073

    # gRPC für Signal-Server
    reverse_proxy /signalexchange.SignalExchange/* h2c://{NETBIRDIP}:8082

    header /api/* {
        Access-Control-Allow-Origin https://netbird.example.com https://authentik.example.com
        Access-Control-Allow-Methods "GET, POST, OPTIONS"
        Access-Control-Allow-Headers "Content-Type, Authorization"
        Access-Control-Allow-Credentials true
    }

    header * {
        Strict-Transport-Security "max-age=3600; includeSubDomains; preload"
        X-Content-Type-Options "nosniff"
        X-Frame-Options "DENY"
        X-XSS-Protection "1; mode=block"
        -Server
        Referrer-Policy strict-origin-when-cross-origin
    }

#    log {
#        output file /var/log/caddy/netbird.access.log
#        level INFO
#    }
}