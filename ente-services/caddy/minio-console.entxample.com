minio-console.entxample.com {
    reverse_proxy {enteIP}:3201 {
        header_up Host {host}
        header_up X-Forwarded-Proto {scheme}
        header_up X-Forwarded-For {remote}
        header_down -Content-Security-Policy
    }
}