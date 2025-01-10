(use-package auctex
  :hook (LaTeX-mode . auctex-latexmk-mode))

(use-package evil-tex
  :hook (LaTeX-mode . evil-tex-mode))

(use-package cdlatex
  :hook (LaTeX-mode . cdlatex-mode)
  :hook (org-mode . org-cdlatex-mode))
