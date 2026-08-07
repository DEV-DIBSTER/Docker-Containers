# Pterodactyl Rust Yolks

This directory contains Docker build manifests for running Rust environments on Pterodactyl Panel.

## Available Versions

| Version | Status | Docker Hub Link | Image Tag | Original? | |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **latest** | Published | [devdibster/yolks:rust_latest](https://hub.docker.com/r/devdibster/yolks/tags) | `devdibster/yolks:rust_latest` | Modified |
| **1.97** | Unpublished | - | `devdibster/yolks:rust_1.97` | Original |
| **1.60** | Unpublished | - | `devdibster/yolks:rust_1.60` | Modified |
| **1.56** | Unpublished | - | `devdibster/yolks:rust_1.56` | Modified |

---

## Build & Publish Commands

Run these commands from this directory (`Pterodactyl/rust`):

### 1. Build Image

```bash
docker build -f latest/Dockerfile -t devdibster/yolks:rust_latest .
```

### 2. Push to Docker Hub

```bash
docker push devdibster/yolks:rust_latest
```

---

## Credits

Many of these `docker-images` contain modification from the original, or original `docker-image`. Credits to `[DEV-DIBSTER](https://github.com/DEV-DIBSTER)` on GitHub, and `[devdibster](https://hub.docker.com/r/devdibster)` on Docker Hub.

Derived originals from [Ptero-Eggs/yolks](https://github.com/Ptero-Eggs/yolks) under the MIT License.
