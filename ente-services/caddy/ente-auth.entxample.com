# Auth Service (ente-auth.entxample.com → :3003)
ente-auth.entxample.com {
    reverse_proxy http://{enteIP}:3003 {
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-Proto {scheme}
    }
}