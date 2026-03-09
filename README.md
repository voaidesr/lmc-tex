# LMC LaTeX Notes Template

This project is built around `master.tex` + `preamble.tex` and compiled with `latexmk` via `make`.

## Build with make

Requirements:
- `make`
- `latexmk`
- A LaTeX distribution (TeX Live or MiKTeX)

Targets:
- `make` or `make pdf`: compile `master.tex` once into `build/`
- `make watch`: watch mode (`latexmk -pvc`) for live rebuilds
- `make clean`: remove intermediate files
- `make distclean`: remove intermediates and `build/`

Output PDF is written to `build/master.pdf`.

## Style Guide (LaTeX preset)

The preset lives in `preamble.tex`. Keep document content in `sections/*.tex` and keep `master.tex` as the orchestration file.

Guidelines:
- Add content as section files and include them from `master.tex` with `\\input{sections/...}`.
- Reuse preset theorem environments instead of redefining local ad-hoc boxes:
  - `definition`, `theorem`, `lemma`, `prop`, `corollary`
  - `eg`, `remark`, `note`, `proof`, `explanation`
- Use existing math helpers where applicable (`\\N`, `\\R`, `\\Q`, `\\Z`, `\\C`, `\\Ker`, `\\im`, etc.).
- Keep visual consistency by using preset macros for pedagogical structure:
  - `\\lesson{nr}{weekday month day year}{optional title}`
  - `\\exercise{...}`, `\\subexercise{...}`
- Prefer extending `preamble.tex` once for shared behavior rather than redefining commands in section files.

## VS Code (LaTeX Workshop)

If you use LaTeX Workshop together with `make watch`, disable extension auto-build to avoid duplicate compile loops.

Add this in your VS Code settings (`.vscode/settings.json` or user settings):

```json
{
  "latex-workshop.latex.autoBuild.run": "never"
}
```

Typical workflow in VS Code:
1. Run `make watch` in the terminal.
2. Edit `.tex` files normally.
3. Use the PDF viewer for preview; `latexmk` handles recompilation.
