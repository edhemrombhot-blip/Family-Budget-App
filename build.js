const fs   = require('fs');
const path = require('path');

// Charge .env si présent (développement local)
const envFile = path.join(__dirname, '.env');
if (fs.existsSync(envFile)) {
  fs.readFileSync(envFile, 'utf-8').split('\n').forEach(line => {
    const trimmed = line.trim();
    if (!trimmed || trimmed.startsWith('#')) return;
    const idx = trimmed.indexOf('=');
    if (idx === -1) return;
    const key = trimmed.slice(0, idx).trim();
    const val = trimmed.slice(idx + 1).trim();
    if (key && !process.env[key]) process.env[key] = val;
  });
}

const SUPABASE_URL  = process.env.SUPABASE_URL  || '';
const SUPABASE_ANON = process.env.SUPABASE_ANON || '';
const APP_PASSWORD  = process.env.APP_PASSWORD  || '';

if (!SUPABASE_URL || SUPABASE_URL === 'VOTRE_URL_SUPABASE') {
  console.error('ERREUR : SUPABASE_URL non défini dans .env ou variables Vercel');
  process.exit(1);
}

if (!APP_PASSWORD || APP_PASSWORD === 'VOTRE_MOT_DE_PASSE') {
  console.error('ERREUR : APP_PASSWORD non défini dans .env ou variables Vercel');
  process.exit(1);
}

// Crée le dossier dist/
const dist = path.join(__dirname, 'dist');
if (!fs.existsSync(dist)) fs.mkdirSync(dist);

// Injecte les clés dans index.html
let html = fs.readFileSync(path.join(__dirname, 'index.html'), 'utf-8');
html = html.replace("'VOTRE_URL_SUPABASE'",  `'${SUPABASE_URL}'`);
html = html.replace("'VOTRE_CLE_ANON'",       `'${SUPABASE_ANON}'`);
html = html.replace("'VOTRE_MOT_DE_PASSE'",   `'${APP_PASSWORD}'`);
fs.writeFileSync(path.join(dist, 'index.html'), html);

// Copie les fichiers statiques
['manifest.json', 'sw.js', 'icon.svg'].forEach(f => {
  const src = path.join(__dirname, f);
  if (fs.existsSync(src)) fs.copyFileSync(src, path.join(dist, f));
});

console.log('Build OK → dist/');
