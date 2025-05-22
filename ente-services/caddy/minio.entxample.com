minio.entxample.com {
    header {
        # CSP Inline-Skripte 
        Content-Security-Policy "default-src 'self' 'unsafe-inline' 'unsafe-eval'"
    }

    # Handle API (z. B. /api/v1/login)
    handle /api/* {
        reverse_proxy http://{enteIP}:3200 {
            header_up Host {host}
            header_up X-Forwarded-Proto {scheme}
            header_up X-Forwarded-For {remote}
        }
    }

    # Handle direct bucket access ( /b2-eu-cen/...)
    handle /b2-eu-cen/* {
        reverse_proxy http://{enteIP}:3200 {
            header_up Host {host}
            header_up X-Forwarded-Proto {scheme}
            header_up X-Forwarded-For {remote}
            header_down Access-Control-Allow-Origin "*"
            header_down Access-Control-Allow-Methods "GET, POST, PUT, DELETE, OPTIONS"
            header_down Access-Control-Allow-Headers "*"
            header_down Access-Control-Allow-Credentials "true"
        }
    }

    # Fallback
    reverse_proxy http://{enteIP}:3200 {
        header_up Host {host}
        header_up X-Forwarded-Proto {scheme}
        header_up X-Forwarded-For {remote}
    }
}