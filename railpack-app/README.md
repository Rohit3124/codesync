# Code-Sync Railpack

This folder contains a minimal Railpack to make deploying the Code-Sync monorepo to Railway easier.

What’s included

- `railway.toml` — lightweight reference describing `server` and `client` build contexts and ports.
- `.dockerignore` — common ignores for Docker builds.
- `deploy.ps1` — PowerShell helper that runs basic Railway CLI commands.

Quick start (Railway CLI)

1. Install the Railway CLI if you don't have it: `npm i -g @railway/cli` or see https://railway.app
2. From the repo root, login and deploy:

```powershell
railway login
cd .\railpack-app
# Run the helper from inside the `railpack-app` folder
.\deploy.ps1
```

The `deploy.ps1` script runs `railway init` (once) and `railway up --build` which will build Docker images from the `server` and `client` folders.

Docker Compose fallback
If you prefer to test locally with Docker Compose:

```powershell
# from repo root
docker compose up --build
```

Notes & next steps

- Railway's platform evolves; after the initial `railway init` you may want to use the Railway dashboard to fine-tune service environment variables, volumes, and domains.
- If you use Railway environments, connect them via the Railway UI and optionally commit generated `railway` config files to this folder.
