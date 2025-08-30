# Session Naming Guide

## Folders
- Session folder: `YYYY-MM-DD_HHmmss_ProClone_v1`
- Emotions: `Neutral`, `Warm`, `Hype`, `Urgent`, `Empathy`, `Deadpan`, `Whisper`, `Cinematic`, `Promo`, `Edge`

## Files
Raw takes after rename:
- `Jason_<Emotion>_<YYYYMMDD>_t01.wav`
- `Jason_Warm_20250829_t03.wav`

Processed (Normalize-Audio):
- `Jason_<Emotion>_<YYYYMMDD>_t01_norm.wav`

## Tips
- One emotion per folder to prevent cross-contamination.
- Keep takes incremental; don’t reuse numbers.
- Use `manifest.csv` as the single source of truth when sharing.
