#!/usr/bin/env bash
# =============================================================================
# convert.sh — Convertit un document Markdown vers HTML / DOCX / PPTX / PDF
# =============================================================================
#
# USAGE :
#   ./convert.sh <format> <fichier.md> [options-pandoc]
#
# FORMATS DISPONIBLES :
#   html   → HTML autonome avec MathJax et CSS intégrée
#   docx   → Word (.docx) via référence custom-reference.docx
#   pptx   → PowerPoint (.pptx) — chaque ## = une diapo
#   pdf    → PDF via LaTeX (xelatex)
#   tex    → LaTeX brut (pour débogage)
#
# EXEMPLES :
#   ./convert.sh html  cours.md
#   ./convert.sh docx  exercices.md
#   ./convert.sh pptx  cours.md
#   ./convert.sh pdf   correction.md
#   ./convert.sh html  cours.md --toc
#
# PRÉREQUIS :
#   • pandoc ≥ 3.0   (https://pandoc.org/installing.html)
#   • Pour PDF : pdflatex ou xelatex dans le PATH
#     (MacOS : MacTeX ; Linux : texlive-xetex)
#
# =============================================================================

set -euo pipefail

# ─── Chemins relatifs à l'emplacement de ce script ──────────────────────────

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PANDOC_DIR="$SCRIPT_DIR/pandoc"
LUA_FILTER="$PANDOC_DIR/charte.lua"
HTML_CSS="$PANDOC_DIR/charte-html.css"

# Référence DOCX (génère un docx bien formaté si ce fichier existe)
REFERENCE_DOCX="$PANDOC_DIR/custom-reference.docx"

# ─── Aide ────────────────────────────────────────────────────────────────────

usage() {
  sed -n '2,30p' "$0" | sed 's/^# \?//'
  exit 1
}

# ─── Vérifications préliminaires ─────────────────────────────────────────────

if [[ $# -lt 2 ]]; then usage; fi

FORMAT="$1"
INPUT="$2"
shift 2
EXTRA_ARGS=("$@")

if [[ ! -f "$INPUT" ]]; then
  echo "Erreur : fichier introuvable : $INPUT" >&2
  exit 1
fi

if ! command -v pandoc &>/dev/null; then
  echo "Erreur : pandoc n'est pas installé. Voir https://pandoc.org/installing.html" >&2
  exit 1
fi

# ─── Nom de sortie (même répertoire que la source) ───────────────────────────

BASE="${INPUT%.md}"

# ─── Arguments Pandoc communs ─────────────────────────────────────────────────

COMMON=(
  --lua-filter "$LUA_FILTER"
  --standalone
  --from markdown+tex_math_dollars+pipe_tables+fenced_code_blocks+yaml_metadata_block+smart
)

# Métadonnées utiles pour les en-têtes
COMMON+=(--metadata-file /dev/null)   # évite les warnings si pas de metadata

# ─── Conversion ───────────────────────────────────────────────────────────────

case "$FORMAT" in

  # ── HTML ──────────────────────────────────────────────────────────────────

  html)
    OUTPUT="${BASE}.html"
    pandoc \
      "${COMMON[@]}" \
      --to html5 \
      --css "$HTML_CSS" \
      --mathjax \
      --highlight-style kate \
      "${EXTRA_ARGS[@]}" \
      -o "$OUTPUT" \
      "$INPUT"
    echo "✓ HTML  → $OUTPUT"
    ;;

  # ── DOCX ──────────────────────────────────────────────────────────────────

  docx)
    OUTPUT="${BASE}.docx"
    DOCX_ARGS=()
    if [[ -f "$REFERENCE_DOCX" ]]; then
      DOCX_ARGS=(--reference-doc "$REFERENCE_DOCX")
    fi
    pandoc \
      "${COMMON[@]}" \
      --to docx \
      "${DOCX_ARGS[@]}" \
      "${EXTRA_ARGS[@]}" \
      -o "$OUTPUT" \
      "$INPUT"
    echo "✓ DOCX  → $OUTPUT"
    ;;

  # ── PPTX ──────────────────────────────────────────────────────────────────

  pptx)
    OUTPUT="${BASE}.pptx"
    # Chaque titre ## devient une diapo
    pandoc \
      "${COMMON[@]}" \
      --to pptx \
      "${EXTRA_ARGS[@]}" \
      -o "$OUTPUT" \
      "$INPUT"
    echo "✓ PPTX  → $OUTPUT"
    ;;

  # ── PDF via LaTeX ─────────────────────────────────────────────────────────

  pdf)
    OUTPUT="${BASE}.pdf"
    # Détecte le moteur LaTeX disponible (préférence xelatex pour Unicode)
    if command -v xelatex &>/dev/null; then
      ENGINE="xelatex"
    elif command -v pdflatex &>/dev/null; then
      ENGINE="pdflatex"
    else
      echo "Erreur : aucun moteur LaTeX trouvé (xelatex, pdflatex)." >&2
      echo "Installer MacTeX (macOS) ou texlive-xetex (Linux)." >&2
      exit 1
    fi
    pandoc \
      "${COMMON[@]}" \
      --to pdf \
      --pdf-engine "$ENGINE" \
      --variable geometry:a4paper,margin=2.5cm \
      --variable fontsize=11pt \
      --variable lang=fr \
      "${EXTRA_ARGS[@]}" \
      -o "$OUTPUT" \
      "$INPUT"
    echo "✓ PDF   → $OUTPUT  (moteur : $ENGINE)"
    ;;

  # ── LaTeX brut ────────────────────────────────────────────────────────────

  tex|latex)
    OUTPUT="${BASE}.tex"
    pandoc \
      "${COMMON[@]}" \
      --to latex \
      --variable geometry:a4paper,margin=2.5cm \
      --variable fontsize=11pt \
      --variable lang=fr \
      "${EXTRA_ARGS[@]}" \
      -o "$OUTPUT" \
      "$INPUT"
    echo "✓ LaTeX → $OUTPUT"
    ;;

  # ── Format inconnu ────────────────────────────────────────────────────────

  *)
    echo "Format inconnu : '$FORMAT'" >&2
    echo "Formats disponibles : html  docx  pptx  pdf  tex" >&2
    exit 1
    ;;

esac
