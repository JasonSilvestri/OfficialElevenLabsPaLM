# Naming Conventions

## Narration Blocks
- ID: NB#### (zero-padded), e.g., NB0001, NB0123.
- File: NB####_<Role>_<Emotion>_<Clone>_v1.wav
  - Example: NB0007_Narrator_Warm_Jason-Warm-v2_v1.wav

## Folders
- /audio/voice/raw/<Role>/<Emotion>/
- /audio/voice/final/<Role>/<Emotion>/
- Manifests in /audio/voice/

## Presets
- Keep a repo copy of slider starting points in data/presets.json.
- If a scene needs overrides, store them inline in voice-manifest.json under the NB entry.
