# Debian Installer Container (`devdibster/yolks:installer_debian`)

A lightweight, root-privileged Debian (Trixie-slim) installer image tailored for Pterodactyl Panel egg installation scripts (`scripts.installation.container`).

---

## Pre-installed Packages

- **Networking & Fetching**: `ca-certificates`, `curl`, `wget`, `git`
- **Archiving & Extraction**: `tar`, `unzip`
- **Steam & Game Compatibility**: `lib32gcc-s1`, `libsdl2-2.0-0:i386`

---

## Build & Push

```bash
# Build local image
docker build -t devdibster/yolks:installer_debian .

# Push tag to Docker Hub
docker push devdibster/yolks:installer_debian
```

---

## Pterodactyl Egg Usage

In your egg's JSON configuration:

```json
"scripts": {
    "installation": {
        "script": "#!/bin/bash\n...",
        "container": "devdibster/yolks:installer_debian",
        "entrypoint": "bash"
    }
}
```
