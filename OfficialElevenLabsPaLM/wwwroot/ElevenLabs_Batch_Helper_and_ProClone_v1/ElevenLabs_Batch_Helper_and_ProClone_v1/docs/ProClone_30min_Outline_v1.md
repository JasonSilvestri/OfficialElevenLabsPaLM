# Pro Clone — 30-Minute Recording Outline (v1)

**Goal:** Build a studio-grade clone with wide emotional coverage using clean, consistent source audio.
**Total duration:** ~30 minutes (target range: 28–34 min)
**Takes:** 12 segments × ~2.5 minutes each (use a timer; stop at natural sentence ends).

## Emotions & Segments
1. Neutral Baseline (2.5 min) — Conversational explainer; mid-pace, clear diction; no dramatics.
2. Warm / Friendly (2.5 min) — Smile-in-voice; supportive coaching language; gentle pace.
3. Excited / Hype (2.5 min) — Upward energy; clean crescendos; avoid shouting.
4. Urgent / Concerned (2.5 min) — Crisp commands; short sentences; calm authority.
5. Empathy / Reassurance (2.5 min) — Soft edges; permission language; warmth.
6. Deadpan / Sarcastic (2.5 min) — Dry delivery; flat prosody; subtle eyebrow raise.
7. Whisper / Aside (2.5 min) — Close-mic; low amplitude; short lines; keep clarity.
8. Cinematic / Inspirational (2.5 min) — Measured cadence; long arcs; purposeful pauses.
9. Fast Promo Read (2.5 min) — Breath control; high information density; bright tone.
10. Edge / Grit (2.5 min) — Lower register; weight; steady pace.
11. Numbers / Dictation (2.5 min) — Dates, URLs, model versions; crisp numerals and letters.
12. North‑East Proper Nouns (2.5 min) — Massachusetts cities; regional names; stress patterns.

## Script Sources
- Use the Emotion-Encoded Clean script as a base and expand each theme.
- Mix in domain language: JSopX™, .NET, Node, Blazor, MAUI, Bigfoot Vlog references.
- Avoid background noise/music and post‑processing.

## Recording Notes
- Same mic, distance, posture, and room for all takes.
- Aim for mono, 44.1 kHz, 16‑bit PCM WAV (convert later with Normalize-Audio.ps1).
- Keep a glass of water nearby; stop if mouth clicks increase.

## Folder Structure (created by Start-VoiceSession.ps1)
SessionRoot/
  00_raw/<Emotion>/takeN.wav
  01_processed/<Emotion>/takeN_norm.wav
  manifests/manifest.csv

## Quality Checklist (per take)
- Peaks below −1.5 dBTP (Normalize-Audio uses loudnorm to target −16 LUFS integrated).
- No clipping, no gate chatter, no limiter pumping.
- Pacing matches the emotion description (don’t force it).

## Delivery
- Export manifest, zip SessionRoot, and archive alongside presets and scripts for reproducibility.
