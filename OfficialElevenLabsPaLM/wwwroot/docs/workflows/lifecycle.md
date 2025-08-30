# ElevenLabs Lifecycle (PaLM) — v1

## Phase 1 — Planning & Role Palette
- Extract roles from storyboard (narrator, hero, guide, etc.).
- Define **emotion palette** per role (e.g., Warm, Urgent, Hype, Edge, Empathy).
- Select **Track A** (Short Clone v2) or **Track B** (Pro Clone v3) per role.
**Gate A — Palette Freeze:** roles + target emotions approved.

## Phase 2 — Clone Creation
### Track A — Short Clone
- Record ~30–60s per emotion (ten scripts provided in starter pack).
- Create one clone per emotion (e.g., `Jason–Warm v2`, `Jason–Hype v2`).

### Track B — Pro Clone (30 min)
- Record 30-minute set (12 segments × ~2.5 min) per outline.
- Create single expressive clone (e.g., `Jason–Expressive v3`).

**Gate B — Identity Check:** sample lines rendered; identity + basic emotion pass confirmed.

## Phase 3 — Script Prep
- Convert storyboard dialogue into **Narration Blocks (NB####)** with 1–2 sentences each.
- Encode emotion via wording + punctuation; avoid bracketed stage directions in TTS text.
- Map each NB to (clone, preset) using the **voice palette**.
**Gate C — Script Lock:** NB text & mappings frozen.

## Phase 4 — Render
- Render per NB with chosen clone + preset.
- Keep Speed/StyleExag nudges small; if identity drifts, increase Similarity; if wobbly, increase Stability.
- Export WAV mono 44.1kHz (or normalize later).
**Gate D — Audio QC:** loudness, clicks, breaths, sibilance; accept/re-render list produced.

## Phase 5 — Package & Manifest
- Name files: `NB####_<Role>_<Emotion>_<Clone>_v1.wav` (see naming guide).
- Generate `voice-manifest.json` with NB→file path, clone, preset, text, duration.
- Store alongside project media (`/audio/voice/`), commit to repo.
**Gate E — Sync Ready:** manifest validated against schema.

## Phase 6 — Sync with Veo Prompts
- Each NB maps to a Veo prompt segment (often ≤8s).
- If a scene is longer, split into NB001A, NB001B, … and cross-fade or hard cut on beats.
- Keep emotion continuity across adjacent NBs.
**Gate F — AV Lock:** timing approved; assets handed off for video gen.
