# Official ElevenLabs PaLM\{\} — v1

The Official ElevenLabs PaLM\{\} is a structured framework designed to streamline the process of creating and managing voice clones, emotion presets, and rendering workflows using ElevenLabs' text-to-speech technology.

---

[`Home`](./README.md) » [`Official ElevenLabs PaLM`](./README.md) 

---

## Table of Contents

- [Purpose](#purpose)
- [Tracks](#tracks)
- [Key Files](#key-files)
- [Quick Start](#quick-start)
- [ElevenLabs Batch Helper & Pro Clone Outline — v1](#elevenlabs-batch-helper--pro-clone-outline--v1)
  - [Contents](#contents)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Notes](#notes)
- [License & Notes](#license--notes)

---

[`Home`](./README.md) » [`Official ElevenLabs PaLM`](./README.md) 

---

## Purpose

A lightweight PaLM for managing voice clones, emotion presets, and render workflows in ElevenLabs.
This repo defines phases, gates, manifests, and naming so your TTS pipeline stays predictable—and syncs cleanly with storyboard → Veo prompts.

[`⇧ Back to Top`](#table-of-contents)

---

## Tracks

- **Track A — Short Clone (v2 / Multilingual v2)**: quick 30–60s emotion-specific clones, inline emotion via wording + sliders.
- **Track B — Pro Clone (v3 alpha)**: 30-minute expressive clone; broader emotional range; used where precise delivery is critical.

[`⇧ Back to Top`](#table-of-contents)

---

## Key Files

- `docs/workflows/lifecycle.md` — phases & gates for both tracks
- `docs/workflows/storyboard-to-voiceover.md` — mapping SB scenes → narration blocks → audio files → Veo prompts
- `docs/workflows/naming-conventions.md` — canonical file and folder names
- `data/presets.json` — slider starting points (Speed, Stability, Similarity, StyleExaggeration, SpeakerBoost)
- `data/voice-palette.sample.json` — roles → preferred clones → emotions/presets
- `data/voice-manifest.sample.json` — per-project manifest: which lines render with which clone/preset, and their outputs
- `schemas/voice-manifest.schema.json` — JSON schema for validation (basic draft)

[`⇧ Back to Top`](#table-of-contents)

---

## Quick Start

1. Copy `data/voice-palette.sample.json` → `data/voice-palette.json` and set your clone names.
2. Copy `data/voice-manifest.sample.json` → `data/voice-manifest.json` and map scenes/lines to clones + presets.
3. Follow `docs/workflows/lifecycle.md` to record clones, render takes, QC, and export a manifest.
4. Keep audio chunks short (1–2 sentences). Use quotes, dashes, ellipses to shape prosody.

[`⇧ Back to Top`](#table-of-contents)

---

## ElevenLabs Batch Helper & Pro Clone Outline — v1

### Contents

tools/ps/Start-VoiceSession.ps1   → Creates a dated session folder with emotion subfolders
tools/ps/Rename-Takes.ps1         → Renames raw recordings to a consistent scheme
tools/ps/Normalize-Audio.ps1      → (Optional) Uses ffmpeg to convert to WAV mono 44.1kHz and loudness-normalize
tools/ps/Export-Manifest.ps1      → Creates a CSV/JSON manifest of takes; uses ffprobe if available

docs/ProClone_30min_Outline_v1.md → 30-minute "pro clone" plan (chaptered by emotion and intent)
docs/Session_Naming_Guide.md      → File/folder naming do’s and don’ts

[`⇧ Back to Top`](#table-of-contents)

---

### Requirements

- Windows 10+, PowerShell 7.x+
- Optional: ffmpeg/ffprobe on PATH for normalization + metadata
  Download: https://ffmpeg.org/ (static builds are fine)
  
[`⇧ Back to Top`](#table-of-contents)

---  

### Quickstart

1) Start-VoiceSession.ps1 -Root "D:\Audio\JasonClone" -SessionName "2025-08-29_ProClone_v1"
2) Record one emotion per subfolder under 00_raw (see outline for durations).
3) Rename-Takes.ps1 -SessionPath "D:\Audio\JasonClone\2025-08-29_ProClone_v1" -VoiceName "Jason"
4) Normalize-Audio.ps1 -SessionPath ... (requires ffmpeg)
5) Export-Manifest.ps1 -SessionPath ...

[`⇧ Back to Top`](#table-of-contents)

---
 
### Notes

- Scripts fail gracefully if ffmpeg/ffprobe aren't installed.
- All outputs are UTF-8, CRLF. Keep mic, distance, and room consistent.
- This is a narrow PaLM focused on ElevenLabs TTS; integrate with Bigfoot Vlog RCL when ready.

---

[`Home`](./README.md) » [`Official ElevenLabs PaLM`](./README.md) · · [`⇧ Back to Top`](#table-of-contents)

---

###### Copyright © 2025 - All Rights Reserved by Jason Silvestri
