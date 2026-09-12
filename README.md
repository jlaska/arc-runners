# arc-runners

Custom [Actions Runner Controller (ARC)](https://github.com/actions/actions-runner-controller) runner images for homelab CI/CD.

## Images

| Image | Base | Adds | Use case |
|-------|------|------|----------|
| `homelab-core` | `ghcr.io/actions/actions-runner` | `python3-pip` | CI lint and pre-commit jobs |
| `homelab-pr-impact` | `ghcr.io/actions/actions-runner` | gh, helm, crane, uv, kubectl, node, claude-code | PR impact assessment |

Images are published to `ghcr.io/jlaska/arc-runners/<image>:<tag>`.

## Build locally

```bash
make build    # build both images
make test     # run smoke tests
```

## CI/CD

GitHub Actions builds and pushes images on every push to `main` that touches a Dockerfile, plus a weekly rebuild for security patches.

Dependabot tracks base image updates and GitHub Actions versions.
Renovate tracks tool versions in `homelab-pr-impact/Dockerfile`.

## Tags

Each image is tagged with:

- `<runner-version>` (e.g. `2.337.0`)
- `<runner-version>-<YYYYMMDD>` (e.g. `2.337.0-20260912`)
- `latest`
