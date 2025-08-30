# Official ElevenLabs PaLM{} — v1

Purpose
-------
A lightweight PaLM for managing voice clones, emotion presets, and render workflows in ElevenLabs.
This repo defines phases, gates, manifests, and naming so your TTS pipeline stays predictable—and syncs cleanly with storyboard → Veo prompts.

Tracks
------
- Track A — Short Clone (v2 / Multilingual v2): quick 30–60s emotion-specific clones, inline emotion via wording + sliders.
- Track B — Pro Clone (v3 alpha): 30-minute expressive clone; broader emotional range; used where precise delivery is critical.

Key Files
---------
- docs/workflows/lifecycle.md — phases & gates for both tracks
- docs/workflows/storyboard-to-voiceover.md — mapping SB scenes → narration blocks → audio files → Veo prompts
- docs/workflows/naming-conventions.md — canonical file and folder names
- data/presets.json — slider starting points
- data/voice-palette.sample.json — roles → preferred clones → emotions/presets
- data/voice-manifest.sample.json — per-project manifest: which lines render with which clone/preset, and their outputs
- schemas/voice-manifest.schema.json — JSON schema for validation (basic draft)

Quick Start
-----------
1. Copy data/voice-palette.sample.json → data/voice-palette.json and set your clone names.
2. Copy data/voice-manifest.sample.json → data/voice-manifest.json and map scenes/lines to clones + presets.
3. Follow docs/workflows/lifecycle.md to record clones, render takes, QC, and export a manifest.
4. Keep audio chunks short (1–2 sentences). Use quotes, dashes, ellipses to shape prosody.

License & Notes
---------------
- Content © Jason Silvestri. JSopX™ conventions apply.
- This is a narrow PaLM focused on ElevenLabs TTS; integrate with Bigfoot Vlog RCL when ready.
