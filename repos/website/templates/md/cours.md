---
title: "Titre du chapitre"
subtitle: "Numéro et thème du chapitre"
author: "Denis Dréano"
date: "Mars 2026"
institution: "Gymnase du Bugnon"
classe: "3M02"
matiere: "math"          # math | info
type: "cours"
lang: fr
---

<!-- ============================================================
     TEMPLATE — PAGE DE COURS
     ============================================================

     RENDU :
       GitHub      → visualisation directe (math ✓, tableaux ✓)
       HTML        → convert.sh html  (boîtes stylées via CSS)
       DOCX        → convert.sh docx
       PDF/LaTeX   → convert.sh pdf
       PPTX        → convert.sh pptx  (chaque ## = une diapo)

     SYNTAXE DES BOÎTES PÉDAGOGIQUES :
       Blockquote avec label gras en première ligne.
       GitHub  → blockquote standard (lisible)
       Pandoc  → div stylée via le filtre charte.lua

       Labels reconnus :
         **Définition** | **Théorème** | **Proposition**
         **Méthode**    | **Exemple**  | **Remarque**
         **Attention**  | **Correction**

     MATH :
       Inline  → $f(x) = x^2$
       Display → $$\int_a^b f(x)\,\mathrm{d}x = F(b) - F(a)$$

     ============================================================ -->


## § 1 — Titre de la première section

Texte introductif de la section. On peut écrire des formules
en ligne : la fonction $f$ est définie sur $\mathbb{R}$ par
$f(x) = x^2 + 1$.

Une formule centrée :

$$
  \lim_{n \to +\infty} \frac{1}{n} = 0.
$$

---

### § 1.1 — Définitions

> **Définition 1.1** — *Continuité en un point*
>
> Soit $f : \mathbb{R} \to \mathbb{R}$ et $a \in \mathbb{R}$.
> On dit que $f$ est **continue en $a$** si
> $$\lim_{x \to a} f(x) = f(a).$$

Texte entre les boîtes.

> **Théorème 1.1** — *Dérivabilité implique continuité*
>
> Toute fonction dérivable en $a \in \mathbb{R}$ est continue en $a$.

> **Remarque**
>
> La réciproque est fausse : $f(x) = |x|$ est continue en $0$
> mais n'est pas dérivable en $0$.

---

### § 1.2 — Exemples

> **Exemple 1.1**
>
> La fonction $f(x) = \sqrt{x}$ est continue sur $[0, +\infty[$
> car elle est dérivable sur $]0, +\infty[$ et vérifie $f(0) = 0$.

---

### § 1.3 — Méthode

> **Méthode** — *Calculer une limite*
>
> 1. Vérifier si la substitution directe $x \leftarrow a$ est possible.
> 2. Si une indétermination apparaît, simplifier (factoriser, conjuguer, …).
> 3. Conclure avec le théorème des gendarmes si nécessaire.

---

## § 2 — Titre de la deuxième section

### § 2.1 — Tableaux

Les tableaux GFM sont rendus nativement sur GitHub et par Pandoc.

| Fonction        | Dérivée              | Domaine      |
|:----------------|:---------------------|:-------------|
| $x^n$           | $n x^{n-1}$          | $\mathbb{R}$ |
| $\ln x$         | $\dfrac{1}{x}$       | $]0, +\infty[$ |
| $e^x$           | $e^x$                | $\mathbb{R}$ |
| $\sin x$        | $\cos x$             | $\mathbb{R}$ |
| $\cos x$        | $-\sin x$            | $\mathbb{R}$ |

---

### § 2.2 — Code (pour les cours d'informatique)

Bloc de code Python :

```python
def derivee_approx(f, x, h=1e-7):
    """Dérivée approchée de f en x par taux d'accroissement."""
    return (f(x + h) - f(x)) / h

# Exemple : dérivée de x² en x = 3
f = lambda x: x**2
print(derivee_approx(f, 3))   # ≈ 6.0
```

Bloc de code JavaScript :

```javascript
function estPremier(n) {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) {
    if (n % i === 0) return false;
  }
  return true;
}
```

---

### § 2.3 — Proposition et preuve

> **Proposition 2.1**
>
> Pour tout entier $n \geq 1$ :
> $$\sum_{k=1}^{n} k = \frac{n(n+1)}{2}.$$

**Démonstration.** On procède par récurrence sur $n$.

- *Initialisation :* Pour $n = 1$, les deux membres valent $1$.
- *Hérédité :* Supposons la formule vraie au rang $n$. Alors
  $$\sum_{k=1}^{n+1} k = \frac{n(n+1)}{2} + (n+1) = \frac{(n+1)(n+2)}{2}.$$

La formule est donc vraie pour tout $n \geq 1$. $\square$

---

## § 3 — Titre de la troisième section

> **Attention**
>
> Ne pas confondre $\overrightarrow{AB} + \overrightarrow{CD}$ avec
> $\overrightarrow{AC} + \overrightarrow{BD}$ : ces deux expressions
> sont égales par la relation de Chasles, mais leur interprétation
> géométrique est différente.

---

*Fin du cours.*
