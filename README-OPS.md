# CI Add-on (Voice CI)

This add-on provides:
- `.github/workflows/voice-ci.yml` — validates `data/voice-manifest.json` against `schemas/voice-manifest.schema.json` (if present) using `npx ajv-cli`; then lints naming via `scripts/lint-manifest.mjs`.
- `scripts/lint-manifest.mjs` — checks NB id shape, preset presence (vs `data/presets.json` if available), and output filename pattern.
- `.gitignore` — excludes audio artifacts and local manifests from version control.

## Install
1. Copy the contents of this folder to the **root** of your repo.  
2. Commit and push: the action runs on every push/PR.

## Notes
- If `data/voice-manifest.json` is absent, CI prints "skipping" and succeeds.
- To add more checks, extend `scripts/lint-manifest.mjs`.
