---
title: "Titre de la feuille"
subtitle: "Numéro et thème de la feuille"
author: "Denis Dréano"
date: "Mars 2026"
institution: "Gymnase du Bugnon"
classe: "3M02"
matiere: "math"          # math | info
type: "exercices"
lang: fr
---

<!-- ============================================================
     TEMPLATE — FEUILLE D'EXERCICES
     ============================================================

     RENDU :
       GitHub      → visualisation directe (math ✓, tableaux ✓)
       HTML        → convert.sh html
       DOCX        → convert.sh docx
       PDF/LaTeX   → convert.sh pdf
       PPTX        → convert.sh pptx  (chaque ## = une diapo)

     SYNTAXE DES EXERCICES :
       Chaque exercice commence par un titre ## ou ###.
       Les sous-questions sont des items de liste ordonnée.
       Les points sont notés entre parenthèses en fin de ligne.

       Pour un exercice avec sous-questions :
         ## Exercice N — Titre  *(X pts)*

         a) Première sous-question.  *(2 pts)*
         b) Deuxième sous-question.  *(3 pts)*

       Pour une question directe sans sous-questions :
         ## Exercice N — Titre  *(X pts)*

         Énoncé de l'exercice.

     MATH :
       Inline  → $f(x) = x^2$
       Display → $$\int_a^b f(x)\,\mathrm{d}x = F(b) - F(a)$$

     ============================================================ -->


## Exercice 1 — Calcul de dérivées  *(6 pts)*

Dériver les fonctions suivantes. On précisera le domaine de dérivabilité.

a) $f(x) = 3x^4 - 2x^2 + 5x - 1$  *(1 pt)*

b) $g(x) = \dfrac{x+1}{x-2}$  *(2 pts)*

c) $h(x) = \sqrt{2x^2 + 1}$  *(3 pts)*

---

## Exercice 2 — Étude de fonction  *(8 pts)*

Soit $f : \mathbb{R} \to \mathbb{R}$ définie par $f(x) = x^3 - 3x$.

a) Calculer $f'(x)$ et déterminer le signe de $f'$.  *(2 pts)*

b) Dresser le tableau de variations de $f$.  *(2 pts)*

c) Déterminer les extrema locaux de $f$.  *(2 pts)*

d) Tracer une esquisse du graphe de $f$ sur $[-3, 3]$.  *(2 pts)*

---

## Exercice 3 — Tableaux de valeurs  *(4 pts)*

Compléter le tableau suivant pour $f(x) = \dfrac{1}{x}$ :

| $x$    | $-2$ | $-1$ | $-\tfrac{1}{2}$ | $\tfrac{1}{2}$ | $1$ | $2$ |
|:------:|:----:|:----:|:---------------:|:--------------:|:---:|:---:|
| $f(x)$ |      |      |                 |                |     |     |

Déduire une propriété de symétrie de $f$.  *(1 pt)*

---

## Exercice 4 — Problème ouvert  *(7 pts)*

Une entreprise produit $x$ articles par jour ($x \in \mathbb{N}^*$).
Le coût total de production est $C(x) = 0{,}5x^2 + 20x + 100$ (en francs).
Le prix de vente par article est $p(x) = 80 - 0{,}5x$ francs.

a) Exprimer le chiffre d'affaires $R(x)$ et la marge $M(x) = R(x) - C(x)$.  *(2 pts)*

b) Déterminer le nombre d'articles à produire pour maximiser la marge.  *(3 pts)*

c) Quel est le bénéfice maximal ?  *(2 pts)*

---

## Exercice 5 — Code (informatique)  *(5 pts)*

> **Remarque** — *Cet exercice est réservé aux cours d'informatique.*
>
> Supprimer cette section si non pertinente.

Écrire une fonction Python `est_premier(n)` qui retourne `True` si $n$ est
premier, `False` sinon.

a) Proposer une solution naïve en $O(\sqrt{n})$.  *(2 pts)*

b) Tester votre fonction pour $n \in \{2, 3, 4, 17, 100, 101\}$.  *(1 pt)*

c) Quelle est la complexité temporelle de l'algorithme du crible d'Ératosthène ?  *(2 pts)*

---

*Total : 30 pts*
