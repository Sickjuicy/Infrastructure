# Photos Web App (ente-photos.entxample.com → :3000)
ente-photos.entxample.com {
    reverse_proxy http://{enteIP}:3000 {
        header_up Host {host}
        header_up X-Real-IP {remote}
        header_up X-Forwarded-Proto {scheme}
    }
}