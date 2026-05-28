---
name: Budget Rombhot
description: Tableau de bord budgétaire familial — saisie rapide, bilan clair, usage mobile quotidien.
colors:
  primary: "#2563eb"
  primary-light: "#dbeafe"
  cash: "#7c3aed"
  cash-light: "#ede9fe"
  dhouha: "#db2777"
  dhouha-light: "#fce7f3"
  danger: "#ef4444"
  danger-light: "#fee2e2"
  success: "#16a34a"
  success-light: "#dcfce7"
  warning: "#d97706"
  text: "#1e293b"
  muted: "#64748b"
  border: "#e2e8f0"
  surface: "#f0f4f8"
  card: "#ffffff"
typography:
  display:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif"
    fontSize: "36px"
    fontWeight: 800
    lineHeight: 1.1
  headline:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif"
    fontSize: "18px"
    fontWeight: 800
    lineHeight: 1.2
  title:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif"
    fontSize: "15px"
    fontWeight: 600
    lineHeight: 1.4
  body:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif"
    fontSize: "15px"
    fontWeight: 400
    lineHeight: 1.5
  label:
    fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif"
    fontSize: "12px"
    fontWeight: 700
    letterSpacing: "0.5px"
rounded:
  pill: "99px"
  xl: "20px"
  lg: "16px"
  md: "12px"
  sm: "8px"
spacing:
  page: "16px"
  card: "16px"
  card-hero: "20px"
  form-input: "14px 16px"
  btn-primary: "16px"
components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.card}"
    rounded: "14px"
    padding: "16px"
  button-ghost:
    backgroundColor: "transparent"
    textColor: "{colors.muted}"
    rounded: "{rounded.md}"
    padding: "12px 16px"
  card:
    backgroundColor: "{colors.card}"
    rounded: "{rounded.lg}"
    padding: "{spacing.card}"
  card-hero:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.card}"
    rounded: "{rounded.xl}"
    padding: "{spacing.card-hero}"
  input:
    backgroundColor: "{colors.card}"
    rounded: "{rounded.md}"
    padding: "{spacing.form-input}"
---

# Design System: Budget Rombhot

## 1. Overview

**Creative North Star: "Le Tableau de Bord Intime"**

Budget Rombhot est une app qui traite l'argent comme quelque chose de personnel, pas de corporate. La densité est fonctionnelle : chaque pixel sert la rapidité de saisie ou la lisibilité du bilan. Le design ne cherche pas à impressionner un utilisateur inconnu — il cherche à servir Edhem et Dhouha, deux personnes réelles qui ouvrent cette app plusieurs fois par jour, souvent debout, une main occupée.

L'interface accepte sa nature d'outil quotidien. Les grandes cartes de bilan (bleu, violet) portent l'information critique d'un coup d'œil. Le reste — transactions, catégories, réglages — est sobre, structuré, sans ornement. La chaleur vient des couleurs sémantiques (chaque type de transaction a sa teinte) et des identités par utilisateur (bleu pour Edhem, rose pour Dhouha), pas de la décoration.

Ce que ce système rejette explicitement : les interfaces bancaires froides (BNP, dashboards de credit scoring), les apps de comptabilité surchargées (menus à dix niveaux, jargon, tableaux), le SaaS générique gris-bleu où tout se ressemble.

**Key Characteristics:**
- Mobile-natif : touch targets généreux, navigation par le pouce, modal slide-up
- Sémantique par couleur : chaque couleur a un rôle fonctionnel strict, jamais décoratif
- Hiérarchie par contraste : les chiffres importants sont gros et gras, le reste recule
- Identités distinctes : bleu = Edhem, rose = Dhouha, violet = espèces
- Ombres présentes mais discrètes : la profondeur vient de la séparation fond/carte

## 2. Colors: La Palette Sémantique

Chaque couleur a un rôle fonctionnel précis. Il n'y a pas de couleur "de décoration" dans ce système.

### Primary
- **Bleu Direct** (#2563eb): Couleur d'action principale. Header, boutons primaires, états actifs de navigation, bordures de focus. Signifie "agir" ou "Edhem".
- **Bleu Clair** (#dbeafe): Fond des états sélectionnés (catégorie active, pill Edhem). Jamais utilisé comme fond de page.

### Secondary
- **Violet Espèces** (#7c3aed): Couleur exclusive aux transactions en espèces et aux retraits DAB. Identifier visuellement immédiatement le cash dans l'interface.
- **Violet Clair** (#ede9fe): Fond des éléments liés aux espèces (icônes, toggles, infobulles).

### Tertiary
- **Rose Dhouha** (#db2777): Couleur d'identité de Dhouha. Utilisée uniquement pour les pastilles utilisateur et les éléments qui lui sont propres.
- **Rose Clair** (#fce7f3): Fond des pastilles Dhouha.

### Neutral
- **Ardoise Profonde** (#1e293b): Texte principal. Jamais noir pur.
- **Ardoise Douce** (#64748b): Texte secondaire, labels, placeholders, icônes inactives.
- **Contour** (#e2e8f0): Bordures des inputs, séparateurs, fond des barres de progression.
- **Fond de Surface** (#f0f4f8): Fond de page. Légèrement bleuté — pas gris neutre.
- **Carte** (#ffffff): Fond des cartes et modals.

### Sémantique d'état
- **Danger** (#ef4444) / **Fond Danger** (#fee2e2): Dépenses, montants négatifs, alertes.
- **Succès** (#16a34a) / **Fond Succès** (#dcfce7): Revenus, montants positifs.
- **Avertissement** (#d97706): Bannière hors-ligne uniquement.

### Named Rules
**La Règle du Sens Unique.** Chaque couleur a un rôle sémantique exclusif. Le bleu signifie "action" ou "Edhem". Le violet signifie "espèces". Le rose signifie "Dhouha". Utiliser le violet comme couleur décorative est interdit — il signalera des espèces qui n'en sont pas.

## 3. Typography

**Font principale:** -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif (stack système)

**Caractère:** L'app ne choisit pas de typographie — elle hérite du système de l'utilisateur. Ce choix est intentionnel : c'est l'app qui s'adapte à l'appareil, pas l'inverse. La hiérarchie est construite entièrement par le poids et la taille, pas par des fontes différentes.

### Hierarchy
- **Display** (800, 36px, lh 1.1): Solde mensuel dans la carte bilan. Un seul usage dans l'app — il doit dominer la vue.
- **Headline** (800, 18px, lh 1.2): Titre du header (nom de l'app), valeurs importantes dans les cartes héros.
- **Title** (600, 15px, lh 1.4): Noms de transactions, labels de paramètres, valeurs de montants secondaires.
- **Body** (400, 15px, lh 1.5): Texte courant, notes, descriptions. Maximum 60ch de large sur mobile.
- **Label** (700, 12px, ls 0.5px, uppercase): Section headers ("DÉPENSES", "REVENUS"), card-titles. Toujours en majuscules, jamais en minuscules pour ce rôle.

### Named Rules
**La Règle du Poids Seul.** La hiérarchie se crée par le poids (400 → 600 → 700 → 800) et la taille. Pas par des familles de fontes différentes. L'app n'a qu'une fonte — la fonte système.

## 4. Elevation

Le système est "touché" : les ombres existent, elles contribuent à la lisibilité, mais elles ne sont jamais décoratives. La profondeur principale vient de la séparation chromatique fond (#f0f4f8) / carte (#ffffff).

### Shadow Vocabulary
- **Carte standard** (`box-shadow: 0 2px 8px rgba(0,0,0,0.06)`): Toutes les cartes de contenu. Ombre très diffuse, presque imperceptible — marque la séparation sans la dramatiser.
- **Navigation basse** (`box-shadow: 0 -4px 20px rgba(0,0,0,0.08)`): Barre de navigation fixe en bas. Directionnelle vers le haut pour séparer la nav du contenu scrollable.

### Named Rules
**La Règle du Flat-par-Défaut.** Seuls les éléments flottants (cartes, nav fixe) ont une ombre. Les boutons, inputs, et éléments inline sont plats au repos. Une ombre sur un bouton inactif est une erreur.

## 5. Components

### Boutons
Design direct et généreux — les boutons sont larges, plein-écran, conçus pour les pouces.

- **Forme:** Bords arrondis généreux (14px radius), jamais pill
- **Primaire:** Bleu plein (#2563eb), texte blanc, padding 16px, pleine largeur. Transition `opacity 0.2s` à l'état actif (0.85).
- **Variante DAB:** Même structure, fond violet (#7c3aed) — signale une action liée aux espèces.
- **Ghost:** Fond transparent, bordure 1.5px solid #e2e8f0, texte muted (#64748b), radius 12px. Pour les actions secondaires comme "changer d'utilisateur".

### Chips / Pastilles
- **Pastille utilisateur:** Pill (99px radius), 11px 700, padding 1px 7px. Bleu clair + bleu pour Edhem, rose clair + rose pour Dhouha.
- **Pastille "cash":** Même structure, violet clair + violet. Marque les dépenses payées en espèces dans l'historique.
- **Chip de navigation header:** Fond blanc à 18% d'opacité sur bleu, pill, 12px 600. Tapotement : fond blanc à 30%.

### Cartes / Conteneurs
- **Carte standard:** Blanc, radius 16px, padding 16px, ombre `0 2px 8px rgba(0,0,0,0.06)`. Fond de page #f0f4f8 assure le contraste.
- **Carte héros (bilan, cash):** Gradient linéaire (135deg), radius 20px, padding 20px, texte blanc. Trois états : bleu (neutre), vert (#15803d → #16a34a, positif), rouge (#b91c1c → #ef4444, négatif).
- **Rangée paramètre:** Blanc, radius 12px, padding 14px 16px, bordure 1px solid #e2e8f0. Pas d'ombre — dans un contexte de liste, l'ombre serait du bruit.

### Inputs / Champs
- **Style:** Bordure 2px solid #e2e8f0, fond blanc, radius 12px, padding 14px 16px, font-size 16px (évite le zoom iOS).
- **Focus:** Bordure passe à #2563eb, pas d'ombre ni de glow.
- **Montant:** Variante géante — font-size 28px, 700, centré, padding 20px. Conçu pour une saisie numérique rapide.
- **Inline (paramètres):** 110px de large, texte aligné à droite, radius 8px, padding 6px 10px.

### Navigation
- **Header:** Fond bleu (#2563eb), sticky top. Contient titre (800/18px blanc), navigation mois, chip utilisateur.
- **Bottom nav:** Fond blanc, bordure top 1px #e2e8f0, ombre montante. 4 items, icônes 24px + label 11px/500. Inactif : muted. Actif : bleu primaire, pas de fond teinté.

### Modal de saisie (composant signature)
Sheet qui slide depuis le bas — le geste d'entrée le plus naturel sur mobile. Radius 24px en haut uniquement. Handle visuel 40×4px. Max-height 92vh avec scroll interne. Overlay noir à 50%. Transition : `transform 0.3s ease` + `opacity 0.25s`.

### Toast
Pill sombre (#1e293b) centré en bas, au-dessus de la nav (bottom: 90px). `border-radius: 99px`, `opacity` animée. Feedback non-intrusif.

### Icônes de transaction
42×42px, radius 12px, fond teinté sémantique (danger-light, success-light, cash-light). Emoji ou icône SVG, font-size 20px. La couleur du fond suffit à identifier le type.

## 6. Do's and Don'ts

### Do:
- **Do** utiliser le plein-écran pour les boutons d'action primaires sur mobile — `width: 100%`, pas de bouton centré flottant.
- **Do** respecter le code couleur sémantique strict : rouge = dépense, vert = revenu, violet = espèces, bleu = action/Edhem, rose = Dhouha.
- **Do** tinter les fonds des icônes de transaction avec la couleur-light correspondante (danger-light, success-light, cash-light) — jamais de fond neutre gris.
- **Do** utiliser font-size ≥ 16px sur tous les inputs pour éviter le zoom automatique iOS.
- **Do** dimensionner tous les touch targets à ≥ 44px (hauteur ou padding inclusif).
- **Do** utiliser la fonte système (-apple-system stack) — elle est plus rapide à charger et plus familière sur mobile.
- **Do** faire primer la lisibilité des chiffres : solde en display 36px/800, montants des transactions en 16px/700.

### Don't:
- **Don't** utiliser les couleurs à des fins décoratives. Si quelque chose est violet, c'est qu'il s'agit d'espèces. Si quelque chose est rose, c'est Dhouha. Violer ce code rompt la lisibilité immédiate.
- **Don't** ajouter des ombres sur les boutons, inputs, ou éléments inline. Les ombres sont réservées aux surfaces flottantes (cartes, nav, modal).
- **Don't** créer des menus à plusieurs niveaux ou des écrans de configuration complexes. L'anti-référence explicite de PRODUCT.md est l'app de comptabilité complexe.
- **Don't** utiliser un ton visuel froid ou institutionnel : pas de bleu marine #003, pas de Slate-900 en fond, pas de tableaux avec de nombreuses colonnes.
- **Don't** mettre du texte blanc sur un fond bleu-clair (#dbeafe) — le contraste est insuffisant. Blanc sur bleu plein seulement.
- **Don't** utiliser `border-left` coloré comme accent de liste. Les transactions sont distinguées par leur icône tintée et le montant coloré.
- **Don't** utiliser `#000` ou `#fff` pur. Le texte le plus sombre est #1e293b, le blanc de carte est #ffffff (acceptable), le fond n'est jamais blanc pur.
- **Don't** ajouter des animations décoratives (bounce, spring, parallax). Les transitions existantes sont courtes (0.15s–0.5s) et strictement fonctionnelles.
