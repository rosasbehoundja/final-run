# Literature review and theoretical background update

Based on main commit 3296197. This package contains only changed/new files.
Extract into the repository root, preserving directories, or apply the separate
patch with `git apply thesis-background.patch`. Do not do both.

Changes: Masmoudi et al. (2024) bibliography entry and discussion; rewritten
literature-review introduction and research gap; theoretical background chapter;
six original TikZ figures and shared style; photo suggestions with credits.

Validation: all citation keys and cross-references resolve in source; no duplicate
bibliography keys; git diff --check passes. All six diagrams compiled and were
visually inspected in a standalone preview. The complete thesis could not be
compiled in this environment because its existing class requires unavailable
siunitx.sty. Compile the full project in your regular LaTeX environment.

The photographs are suggestions only and have not been inserted.
