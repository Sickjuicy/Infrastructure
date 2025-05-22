## Overview

The NetBird setup here is modular and designed to work alongside other infrastructure components. The current configuration uses separate servers for each major service:

- **Caddy Server** (reverse proxy)
- **NetBird Server**
- **Authentik Server** (authentication provider)

## Folder Structure

- All NetBird-related files and configuration are contained in this folder.
- Authentik integration details and files are located in the `authentik/` folder with its own README.

## Usage

1. Review the configuration files in this directory for NetBird setup.
2. Follow the inline comments and instructions in each file.
3. For Authentik integration, see `../authentik/README.md` (work in progress).

## Notes

- This setup is a work in progress and may change as the infrastructure evolves.
- Contributions and suggestions are welcome.

---

**Related Documentation:**
- [NetBird Documentation](https://docs.netbird.io/)
- [Authentik Documentation](https://goauthentik.io/docs/)
- [Caddy Documentation](https://caddyserver.com/docs/)
