--[[
  charte.lua — Filtre Pandoc pour les boîtes pédagogiques
  =========================================================

  Transforme les blockquotes dont la première ligne contient
  un label gras reconnu en divs typés (HTML) ou environnements
  LaTeX (PDF).

  LABELS RECONNUS :
    Définition  → div.box.definition    / \begin{definition}
    Théorème    → div.box.theorem       / \begin{theorem}
    Proposition → div.box.proposition   / \begin{proposition}
    Méthode     → div.box.method        / \begin{method}
    Exemple     → div.box.example       / \begin{example}
    Remarque    → div.box.remark        / \begin{remark}
    Attention   → div.box.warning       / \begin{warning}
    Correction  → div.box.correction    / \begin{correction}

  SYNTAXE SOURCE :
    > **Définition 1.1** — *Continuité*
    >
    > Corps de la définition avec $f(x) = x^2$.

  RÉSULTAT HTML :
    <div class="box definition">
      <div class="box-title">Définition 1.1 — Continuité</div>
      <p>Corps de la définition…</p>
    </div>
--]]

local labels = {
  ["définition"]  = "definition",
  ["definition"]  = "definition",
  ["théorème"]    = "theorem",
  ["theoreme"]    = "theorem",
  ["proposition"] = "proposition",
  ["méthode"]     = "method",
  ["methode"]     = "method",
  ["exemple"]     = "example",
  ["remarque"]    = "remark",
  ["attention"]   = "warning",
  ["correction"]  = "correction",
}

-- Extrait le texte brut d'un Inline
local function inline_text(el)
  if el.t == "Str"   then return el.text end
  if el.t == "Space" then return " "    end
  if el.t == "SoftBreak" then return " " end
  if el.t == "Emph"  then
    local t = ""
    for _, v in ipairs(el.content) do t = t .. inline_text(v) end
    return t
  end
  if el.t == "Strong" then
    local t = ""
    for _, v in ipairs(el.content) do t = t .. inline_text(v) end
    return t
  end
  return ""
end

-- Reconstitue le texte d'une liste d'inlines
local function inlines_text(inlines)
  local t = ""
  for _, il in ipairs(inlines) do t = t .. inline_text(il) end
  return t
end

-- Identifie le type de boîte d'après la première ligne
-- Retourne (css_class, title_inlines, rest_blocks) ou nil
local function parse_box(blocks)
  if #blocks == 0 then return nil end
  local first = blocks[1]
  if first.t ~= "Para" and first.t ~= "Plain" then return nil end

  local inlines = first.content
  -- La première inline doit être Strong
  if not inlines[1] or inlines[1].t ~= "Strong" then return nil end

  -- Récupère le texte brut du label bold
  -- Note : on utilise le texte original (pas lower()) car %a ne couvre
  -- pas les caractères accentués en Lua standard.
  -- On extrait le premier "mot" jusqu'au premier espace ou chiffre.
  local label_text = inlines_text(inlines[1].content)
  -- Extrait le premier token (jusqu'à espace, chiffre ou ponctuation)
  local first_word = label_text:match("^([^%s%d,%.%(]+)")
  if not first_word then return nil end
  -- Normalise en minuscules pour les caractères ASCII ; conserve les accents
  first_word = first_word:lower()

  local css_class = labels[first_word]
  if not css_class then return nil end

  -- Reconstruit le titre complet (Strong + suite de la ligne)
  -- en inlines texte plate
  local title_parts = {}
  for _, il in ipairs(inlines) do
    table.insert(title_parts, inline_text(il))
  end
  local title_str = table.concat(title_parts):gsub("^%s+", ""):gsub("%s+$", "")
  -- Retire les tirets isolés en début/fin
  title_str = title_str:gsub("^%s*%-%s*", ""):gsub("%s*%-%s*$", "")

  -- Corps : tout sauf le premier bloc
  local rest = {}
  for i = 2, #blocks do
    table.insert(rest, blocks[i])
  end

  return css_class, title_str, rest
end

-- ── Sortie HTML ───────────────────────────────────────────────────────────────

local function make_html_div(css_class, title_str, body_blocks)
  local open = string.format(
    '<div class="box %s"><div class="box-title">%s</div>',
    css_class, title_str
  )
  local close = "</div>"
  -- Enveloppe dans des blocs RawBlock
  local result = { pandoc.RawBlock("html", open) }
  for _, b in ipairs(body_blocks) do
    table.insert(result, b)
  end
  table.insert(result, pandoc.RawBlock("html", close))
  return result
end

-- ── Sortie LaTeX ──────────────────────────────────────────────────────────────

local latex_env = {
  definition  = "definition",
  theorem     = "theorem",
  proposition = "proposition",
  method      = "methode",
  example     = "exemple",
  remark      = "remarque",
  warning     = "attention",
  correction  = "correction",
}

local function make_latex_env(css_class, title_str, body_blocks)
  local env = latex_env[css_class] or css_class
  local open = string.format("\\begin{%s}[%s]", env, title_str)
  local close = string.format("\\end{%s}", env)
  local result = { pandoc.RawBlock("latex", open) }
  for _, b in ipairs(body_blocks) do
    table.insert(result, b)
  end
  table.insert(result, pandoc.RawBlock("latex", close))
  return result
end

-- ── Filtre principal ──────────────────────────────────────────────────────────

function BlockQuote(el)
  local css_class, title_str, rest = parse_box(el.content)
  if not css_class then return el end  -- blockquote normal

  local fmt = FORMAT
  if fmt == "html" or fmt == "html5" or fmt == "html4" then
    return make_html_div(css_class, title_str, rest)
  elseif fmt == "latex" or fmt == "pdf" then
    return make_latex_env(css_class, title_str, rest)
  else
    -- DOCX, PPTX, ODT : style de paragraphe personnalisé
    -- On retourne un div avec la classe pour que Pandoc
    -- utilise le style DOCX correspondant si custom-reference.docx le définit.
    local div = pandoc.Div(rest, pandoc.Attr("", {"box", css_class}))
    -- Injecte le titre comme premier paragraphe en gras
    local title_para = pandoc.Para({
      pandoc.Strong({pandoc.Str(title_str)})
    })
    table.insert(div.content, 1, title_para)
    return div
  end
end
