# Templates Markdown — Cours & Exercices

Templates sources pour les documents pédagogiques (cours, exercices, corrections)
de Denis Dréano — Gymnase du Bugnon, Lausanne.

---

## Fichiers disponibles

| Fichier | Usage |
|:--------|:------|
| `cours.md` | Cours de mathématiques ou d'informatique |
| `exercices.md` | Feuille d'exercices avec points |
| `correction.md` | Correction d'une feuille d'exercices |

---

## Prérequis

- **[Pandoc](https://pandoc.org/installing.html)** ≥ 3.0
- Pour la sortie PDF : **xelatex** (MacTeX sur macOS, `texlive-xetex` sur Linux)

---

## Conversion rapide

Depuis le répertoire `templates/` :

```bash
# HTML
./convert.sh html  md/cours.md

# Word
./convert.sh docx  md/exercices.md

# PowerPoint (chaque ## = une diapo)
./convert.sh pptx  md/cours.md

# PDF via LaTeX
./convert.sh pdf   md/correction.md

# LaTeX brut (débogage)
./convert.sh tex   md/cours.md
```

Le fichier de sortie est créé dans le même répertoire que la source.

---

## En-tête YAML

Chaque fichier commence par un bloc de métadonnées :

```yaml
---
title: "Titre du document"
subtitle: "Numéro et thème"
author: "Denis Dréano"
date: "Mars 2026"
institution: "Gymnase du Bugnon"
classe: "3M02"
matiere: "math"          # math | info
type: "cours"            # cours | exercices | correction
lang: fr
---
```

Ces métadonnées alimentent l'en-tête du document dans tous les formats de sortie.

---

## Syntaxe des boîtes pédagogiques

Les boîtes sont écrites comme des **blockquotes** avec un label gras en première ligne.
Elles s'affichent proprement sur GitHub *et* sont converties en divs stylés (HTML)
ou en environnements LaTeX (PDF) par le filtre `pandoc/charte.lua`.

### Labels reconnus

| Blockquote source | Rendu HTML | Rendu LaTeX |
|:------------------|:-----------|:------------|
| `> **Définition**` | `div.box.definition` | `\begin{definition}` |
| `> **Théorème**` | `div.box.theorem` | `\begin{theorem}` |
| `> **Proposition**` | `div.box.proposition` | `\begin{proposition}` |
| `> **Méthode**` | `div.box.method` | `\begin{methode}` |
| `> **Exemple**` | `div.box.example` | `\begin{exemple}` |
| `> **Remarque**` | `div.box.remark` | `\begin{remarque}` |
| `> **Attention**` | `div.box.warning` | `\begin{attention}` |
| `> **Correction**` | `div.box.correction` | `\begin{correction}` |

### Exemples

**Définition avec numéro et nom :**

```markdown
> **Définition 1.1** — *Continuité en un point*
>
> Soit $f : \mathbb{R} \to \mathbb{R}$ et $a \in \mathbb{R}$.
> On dit que $f$ est **continue en $a$** si
> $$\lim_{x \to a} f(x) = f(a).$$
```

**Théorème :**

```markdown
> **Théorème 2.3** — *Rolle*
>
> Si $f$ est continue sur $[a, b]$, dérivable sur $]a, b[$
> et $f(a) = f(b)$, alors il existe $c \in ]a, b[$ tel que $f'(c) = 0$.
```

**Remarque (blockquote ordinaire sur GitHub) :**

```markdown
> **Remarque**
>
> La réciproque est fausse : $|x|$ est continue mais non dérivable en $0$.
```

---

## Mathématiques

- **Inline** : `$f(x) = x^2$`
- **Display** : `$$\int_a^b f(x)\,\mathrm{d}x = F(b) - F(a)$$`

Les formules sont rendues par MathJax dans la sortie HTML et par LaTeX dans la sortie PDF.
Sur GitHub, les formules `$...$` et `$$...$$` sont rendues nativement depuis 2022.

### Macros LaTeX fréquentes

| Macro | Résultat |
|:------|:---------|
| `\mathbb{R}` | ℝ |
| `\mathbb{N}` | ℕ |
| `\mathbb{Z}` | ℤ |
| `\mathbb{Q}` | ℚ |
| `\dfrac{a}{b}` | Fraction en display |
| `\overrightarrow{AB}` | Vecteur |
| `\sqrt{x}` | Racine carrée |

---

## Tableaux

Syntaxe GitHub Flavored Markdown (GFM) :

```markdown
| Fonction | Dérivée         | Domaine      |
|:---------|:----------------|:-------------|
| $x^n$    | $n x^{n-1}$     | $\mathbb{R}$ |
| $\ln x$  | $\frac{1}{x}$   | $]0,+\infty[$ |
| $e^x$    | $e^x$           | $\mathbb{R}$ |
```

---

## Structure des sections

```
## § 1 — Titre principal         (h2 → section)
### § 1.1 — Sous-section         (h3 → sous-section)
#### a) Sous-sous-question        (h4 → question, pour corrections)
```

Dans la sortie PPTX, chaque `##` génère une nouvelle diapositive.

---

## Fichiers de l'infrastructure Pandoc

```
templates/
├── convert.sh                  ← Script de conversion (point d'entrée)
├── md/
│   ├── cours.md
│   ├── exercices.md
│   ├── correction.md
│   └── README.md               ← Ce fichier
└── pandoc/
    ├── charte.lua              ← Filtre Lua (boîtes pédagogiques)
    ├── charte-html.css         ← CSS pour la sortie HTML standalone
    └── custom-reference.docx  ← (optionnel) Référence DOCX stylée
```

---

## Rendu GitHub

Les fichiers `.md` sont lisibles directement sur GitHub :

- Les blockquotes `> **Label**` s'affichent comme des citations standard
- Les formules `$...$` et `$$...$$` sont rendues par GitHub depuis 2022
- Les tableaux GFM sont rendus nativement
- Les blocs de code avec langage sont colorés

---

*Gymnase du Bugnon — Denis Dréano — Mars 2026*
