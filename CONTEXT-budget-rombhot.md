# Budget Rombhot — Contexte projet

## Résumé

Application web de suivi budgétaire mensuel, conçue pour un usage mobile (PWA-ready). Fichier unique auto-contenu (`budget-rombhot.html`), sans dépendance externe, sans backend. Toutes les données sont stockées en `localStorage` sur l'appareil de l'utilisateur.

**Problème résolu** : l'utilisateur avait un tableau Excel familial mais manquait de discipline pour le remplir. L'app remplace ce tableau par une interface mobile à saisie rapide, avec gestion spécifique des retraits DAB (espèces).

---

## Stack technique

- **HTML/CSS/JS vanilla** — pas de framework
- **localStorage** — persistance côté client uniquement
- **Aucune dépendance CDN** — fonctionne hors connexion
- **Mobile-first** — viewport fixe, touch-action optimisé, installable en PWA (Add to Home Screen)

---

## Structure du fichier

```
budget-rombhot.html
├── <style>        — CSS complet intégré (variables CSS, mobile-first)
├── <body>
│   ├── .header         — barre de navigation mois (← Avr 2026 →)
│   ├── #page-resume    — page Résumé (bilan, enveloppe espèces, répartition)
│   ├── #page-historique— page Historique (liste des transactions)
│   ├── #page-params    — page Réglages (salaire, dépenses fixes)
│   ├── .bottom-nav     — navigation bas (Résumé | Ajouter | Historique | Réglages)
│   └── #addModal       — modal de saisie (slide-up)
└── <script>       — JS complet intégré
```

---

## Modèle de données

### `localStorage['rombhot_tx']`
Objet JSON indexé par clé mensuelle `"YYYY-M"` (ex: `"2026-3"` pour avril 2026).

```js
{
  "2026-3": [
    {
      id:     1714500000000,   // Date.now() — identifiant unique
      type:   "depense",       // "depense" | "revenu" | "retrait_dab"
      cash:   true,            // true = payé en espèces (seulement si type=depense)
      amount: 115,
      cat:    "courses",       // id de catégorie (voir CATEGORIES_DEP/REV)
      note:   "Lidl du soir", // texte libre, optionnel
      date:   "2026-04-03"    // ISO date string
    }
  ]
}
```

### `localStorage['rombhot_params']`
```js
{
  salaire:     4000,  // revenu mensuel fixe
  loyer:       831,   // dépenses fixes mensuelles
  viager:      695,
  taxe_fonc:   147,
  mutuelle:    294,
  electricite: 47,
  eau:         4,
  gaz:         7
}
```

---

## Logique métier clé

### Calcul du bilan mensuel

```
totalRev  = params.salaire + sum(transactions type=revenu)
totalDep  = sum(params fixes) + sum(type=depense, cash=false) + sum(type=retrait_dab)
solde     = totalRev - totalDep
tauxEpargne = solde / totalRev * 100
```

**Pourquoi `retrait_dab` et non les dépenses espèces individuelles ?**
Les dépenses `cash=true` et les retraits DAB ne sont PAS additionnés ensemble pour éviter le double comptage. Le retrait DAB est le "budget espèces" global. Les dépenses `cash=true` en sont le détail. Seul le retrait DAB entre dans le bilan total.

### Enveloppe espèces (carte violette)
```
totalDAB      = sum(type=retrait_dab)
cashTrace     = sum(type=depense, cash=true)
cashNonTrace  = max(0, totalDAB - cashTrace)
pct           = cashTrace / totalDAB * 100
```
Si `cashNonTrace > 0`, cette somme apparaît dans la répartition comme "Espèces non tracées" (barre grise).

---

## Catégories

### Dépenses (`CATEGORIES_DEP`)
`courses`, `restaurant`, `transport`, `sante`, `enfants`, `electricite`, `eau`, `gaz`, `internet`, `telephone`, `sport`, `coiffeur`, `vetements`, `mutuelle`, `taxe`, `loyer`, `viager`, `autres`

### Revenus (`CATEGORIES_REV`)
`salaire`, `cours`, `allocation`, `autres_rev`

### Spéciale
`dab` — catégorie interne utilisée pour les `retrait_dab` (icône 🏧)

---

## Fonctions JS principales

| Fonction | Rôle |
|---|---|
| `init()` | Chargement initial : localStorage → rendu |
| `loadData()` / `saveData()` | Lecture / écriture localStorage |
| `saveParams()` | Sauvegarde réglages + re-render résumé |
| `changeMonth(dir)` | Navigation mois (±1) |
| `openModal()` / `closeModal()` | Affichage modal saisie |
| `setType(t)` | Change le type de transaction dans le modal |
| `toggleCash()` | Active/désactive le flag espèces |
| `syncModalUI()` | Met à jour le modal selon le type courant |
| `addTransaction()` | Valide et persiste une nouvelle transaction |
| `renderResumePage()` | Calcule et affiche bilan, enveloppe, répartition |
| `renderHistPage()` | Affiche la liste des transactions triées par date |
| `renderParamsPage()` | Affiche les champs de réglages |
| `deleteTx(id)` | Supprime une transaction par id |
| `showToast(msg)` | Notification temporaire (2,4s) |

---

## Contexte utilisateur

- **Famille** : Edhem Rombhot + épouse Dhouha, revenus ~4000€/mois
- **Dépenses fixes réelles** : Loyer 831€, Viager 695€, Mutuelle 294€, Taxe foncière 147€
- **Usage typique** : retraits DAB de 2000–3000€/mois pour les courses et dépenses courantes
- **Enfants** : Lyne, Isaac (catégorie "Enfants" pour argent de poche, transport, etc.)
- **Revenu annexe** : cours d'anglais (catégorie "Cours")
- **Multi-utilisateurs** : app partagée entre Edhem et Dhouha, chaque transaction est taguée au nom de son auteur

---

## Ce qui n'est pas encore fait (pistes d'évolution)

- Export CSV / Excel des transactions
- Graphique mensuel (revenus vs dépenses sur 12 mois)
- Objectif d'épargne mensuel configurable avec alerte
- Multi-comptes (ex: compte courant vs compte épargne)
- Import automatique depuis relevé bancaire (OFX/CSV banque)
- Notification push hebdomadaire (rappel de saisie)
- Partage du budget entre membres de la famille
