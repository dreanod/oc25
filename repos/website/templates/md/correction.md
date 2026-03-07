---
title: "Titre de la feuille"
subtitle: "Correction — Numéro et thème"
author: "Denis Dréano"
date: "Mars 2026"
institution: "Gymnase du Bugnon"
classe: "3M02"
matiere: "math"          # math | info
type: "correction"
lang: fr
---

<!-- ============================================================
     TEMPLATE — FEUILLE DE CORRECTION
     ============================================================

     RENDU :
       GitHub      → visualisation directe (math ✓, tableaux ✓)
       HTML        → convert.sh html
       DOCX        → convert.sh docx
       PDF/LaTeX   → convert.sh pdf

     SYNTAXE DE LA CORRECTION :
       • Reprendre la même numérotation que la feuille d'exercices.
       • L'énoncé de chaque sous-question est rappelé en italique.
       • La correction suit dans une boîte > **Correction**.

       Modèle pour une sous-question :

         #### a) *Énoncé de la sous-question.*

         > **Correction**
         >
         > Développement de la correction, formules, etc.
         > $$f'(x) = \ldots$$

     MATH :
       Inline  → $f(x) = x^2$
       Display → $$\int_a^b f(x)\,\mathrm{d}x = F(b) - F(a)$$

     ============================================================ -->


> **Attention** — *Document à usage pédagogique interne.*
>
> Ne pas diffuser avant la restitution des copies.

---

## Exercice 1 — Calcul de dérivées  *(6 pts)*

#### a) *$f(x) = 3x^4 - 2x^2 + 5x - 1$*  *(1 pt)*

> **Correction**
>
> $f$ est un polynôme, donc dérivable sur $\mathbb{R}$.
>
> $$f'(x) = 12x^3 - 4x + 5.$$

#### b) *$g(x) = \dfrac{x+1}{x-2}$*  *(2 pts)*

> **Correction**
>
> $g$ est dérivable sur $\mathbb{R} \setminus \{2\}$.
> Par la règle du quotient $\left(\dfrac{u}{v}\right)' = \dfrac{u'v - uv'}{v^2}$ :
>
> $$g'(x) = \frac{1 \cdot (x-2) - (x+1) \cdot 1}{(x-2)^2}
>          = \frac{x - 2 - x - 1}{(x-2)^2}
>          = \frac{-3}{(x-2)^2}.$$

#### c) *$h(x) = \sqrt{2x^2 + 1}$*  *(3 pts)*

> **Correction**
>
> On pose $u(x) = 2x^2 + 1 > 0$ pour tout $x \in \mathbb{R}$.
> Donc $h = \sqrt{u}$ est dérivable sur $\mathbb{R}$ et
>
> $$h'(x) = \frac{u'(x)}{2\sqrt{u(x)}} = \frac{4x}{2\sqrt{2x^2+1}} = \frac{2x}{\sqrt{2x^2+1}}.$$

---

## Exercice 2 — Étude de fonction  *(8 pts)*

*On rappelle : $f(x) = x^3 - 3x$.*

#### a) *Calculer $f'(x)$ et déterminer le signe de $f'$.*  *(2 pts)*

> **Correction**
>
> $f'(x) = 3x^2 - 3 = 3(x^2 - 1) = 3(x-1)(x+1)$.
>
> | Signe de $f'$ | $-\infty$ | $-1$ | $+1$ | $+\infty$ |
> |:-------------|:---------:|:----:|:----:|:---------:|
> | $f'(x)$      | $+$       | $0$  | $-$  | $0$ $+$   |

#### b) *Tableau de variations.*  *(2 pts)*

> **Correction**
>
> | $x$    | $-\infty$ |  | $-1$ |  | $1$  |  | $+\infty$ |
> |:------:|:---------:|:--:|:----:|:--:|:----:|:--:|:---------:|
> | $f'(x)$|           | $+$| $0$  | $-$| $0$  | $+$|           |
> | $f(x)$ | $-\infty$ | ↗  | $2$  | ↘  | $-2$ | ↗  | $+\infty$ |

#### c) *Extrema locaux.*  *(2 pts)*

> **Correction**
>
> - Maximum local en $x = -1$ : $f(-1) = -1 + 3 = 2$.
> - Minimum local en $x = 1$ : $f(1) = 1 - 3 = -2$.

#### d) *Esquisse du graphe.*  *(2 pts)*

> **Correction**
>
> Points remarquables : $(-1, 2)$, $(0, 0)$, $(1, -2)$.
> Symétrie centrale : $f$ est impaire ($f(-x) = -f(x)$), donc le graphe est
> symétrique par rapport à l'origine.

---

## Exercice 3 — Tableaux de valeurs  *(4 pts)*

> **Correction**
>
> | $x$    | $-2$            | $-1$   | $-\tfrac{1}{2}$ | $\tfrac{1}{2}$ | $1$ | $2$            |
> |:------:|:---------------:|:------:|:---------------:|:--------------:|:---:|:--------------:|
> | $f(x)$ | $-\tfrac{1}{2}$ | $-1$   | $-2$            | $2$            | $1$ | $\tfrac{1}{2}$ |
>
> On constate que $f(-x) = -f(x)$ pour tout $x \neq 0$ : la fonction
> $x \mapsto \dfrac{1}{x}$ est **impaire** ; son graphe est symétrique
> par rapport à l'origine.

---

## Exercice 4 — Problème ouvert  *(7 pts)*

#### a) *Chiffre d'affaires et marge.*  *(2 pts)*

> **Correction**
>
> $$R(x) = x \cdot p(x) = x(80 - 0{,}5x) = 80x - 0{,}5x^2.$$
>
> $$M(x) = R(x) - C(x)
>        = (80x - 0{,}5x^2) - (0{,}5x^2 + 20x + 100)
>        = -x^2 + 60x - 100.$$

#### b) *Maximisation de la marge.*  *(3 pts)*

> **Correction**
>
> $M(x) = -x^2 + 60x - 100$ est un trinôme de coefficient directeur négatif.
> Il est maximisé en
>
> $$x^* = -\frac{60}{2 \times (-1)} = 30.$$
>
> Donc l'entreprise doit produire **30 articles par jour**.

#### c) *Bénéfice maximal.*  *(2 pts)*

> **Correction**
>
> $$M(30) = -(30)^2 + 60 \times 30 - 100 = -900 + 1800 - 100 = 800.$$
>
> Le bénéfice maximal est **800 CHF**.

---

## Exercice 5 — Code  *(5 pts)*

#### a) *Solution naïve en $O(\sqrt{n})$.*  *(2 pts)*

> **Correction**
>
> ```python
> def est_premier(n):
>     """Retourne True si n est premier, False sinon."""
>     if n < 2:
>         return False
>     for i in range(2, int(n**0.5) + 1):
>         if n % i == 0:
>             return False
>     return True
> ```

#### b) *Tests.*  *(1 pt)*

> **Correction**
>
> ```python
> for n in [2, 3, 4, 17, 100, 101]:
>     print(n, est_premier(n))
> # 2 True | 3 True | 4 False | 17 True | 100 False | 101 True
> ```

#### c) *Complexité du crible d'Ératosthène.*  *(2 pts)*

> **Correction**
>
> Le crible d'Ératosthène pour trouver tous les premiers jusqu'à $N$ a une
> complexité temporelle de $O(N \log \log N)$.

---

*Fin de la correction.*
