ElevenLabs Batch Helper & Pro Clone Outline — v1

Contents
--------
tools/ps/Start-VoiceSession.ps1   → Creates a dated session folder with emotion subfolders
tools/ps/Rename-Takes.ps1         → Renames raw recordings to a consistent scheme
tools/ps/Normalize-Audio.ps1      → (Optional) Uses ffmpeg to convert to WAV mono 44.1kHz and loudness-normalize
tools/ps/Export-Manifest.ps1      → Creates a CSV/JSON manifest of takes; uses ffprobe if available

docs/ProClone_30min_Outline_v1.md → 30-minute "pro clone" plan (chaptered by emotion and intent)
docs/Session_Naming_Guide.md      → File/folder naming do’s and don’ts

Requirements
------------
- Windows 10+, PowerShell 7.x+
- Optional: ffmpeg/ffprobe on PATH for normalization + metadata
  Download: https://ffmpeg.org/ (static builds are fine)

Quickstart
----------
1) Start-VoiceSession.ps1 -Root "D:\Audio\JasonClone" -SessionName "2025-08-29_ProClone_v1"
2) Record one emotion per subfolder under 00_raw (see outline for durations).
3) Rename-Takes.ps1 -SessionPath "D:\Audio\JasonClone\2025-08-29_ProClone_v1" -VoiceName "Jason"
4) Normalize-Audio.ps1 -SessionPath ... (requires ffmpeg)
5) Export-Manifest.ps1 -SessionPath ...

Notes
-----
- Scripts fail gracefully if ffmpeg/ffprobe aren't installed.
- All outputs are UTF-8, CRLF. Keep mic, distance, and room consistent.
