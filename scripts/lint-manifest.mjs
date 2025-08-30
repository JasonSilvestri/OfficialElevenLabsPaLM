// scripts/lint-manifest.mjs
import fs from 'node:fs';
import path from 'node:path';

const manifestPath = path.resolve('data/voice-manifest.json');
if (!fs.existsSync(manifestPath)) {
  console.log('No data/voice-manifest.json found; nothing to lint.');
  process.exit(0);
}

const schemaPresetsPath = path.resolve('data/presets.json');
let presetNames = null;
if (fs.existsSync(schemaPresetsPath)) {
  try {
    const presets = JSON.parse(fs.readFileSync(schemaPresetsPath, 'utf8'));
    presetNames = new Set((presets.presets || []).map(p => p.name));
  } catch { /* ignore */ }
}

const mf = JSON.parse(fs.readFileSync(manifestPath, 'utf8'));
const rows = mf.narrationBlocks || [];
let errors = 0;

function fail(msg) {
  console.error('LintError:', msg);
  errors++;
}

const NB_RE = /^NB\d{4}$/;
const FILE_RE = /^NB\d{4}_[A-Za-z0-9\-]+_[A-Za-z0-9\-]+_.+?_v\d+\.(wav|flac|mp3)$/i;

rows.forEach((row, i) => {
  const where = `narrationBlocks[${i}]`;
  if (!row.id || !NB_RE.test(row.id)) {
    fail(`${where}: id must match NB####, got "${row.id}"`);
  }
  if (!row.role) {
    fail(`${where}: role missing`);
  }
  if (!row.preset) {
    fail(`${where}: preset missing`);
  } else if (presetNames && !presetNames.has(row.preset)) {
    fail(`${where}: preset "${row.preset}" not found in data/presets.json`);
  }
  if (!row.output || !row.output.file) {
    fail(`${where}: output.file missing`);
  } else {
    const file = path.basename(row.output.file);
    if (!FILE_RE.test(file)) {
      fail(`${where}: output.file "${file}" does not match NB####_Role_Emotion_Clone_vN.<ext>`);
    }
  }
});

if (errors > 0) {
  console.error(`\n${errors} issue(s) found.`);
  process.exit(1);
} else {
  console.log('Manifest looks good.');
}
