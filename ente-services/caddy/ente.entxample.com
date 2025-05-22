# API Domain (ente.entxample.com → :8080)
ente.entxample.com {
    reverse_proxy http://{enteIP}:8080 {
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-Proto {scheme}
    }
}