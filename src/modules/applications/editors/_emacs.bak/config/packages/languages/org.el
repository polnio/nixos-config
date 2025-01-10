(use-package evil-org
  :after org
  :hook (org-mode . evil-org-mode))

;; (use-package org-appear
;;   :after org
;;   :hook (org-mode . org-appear-mode))

(use-package org-superstar
  :after org
  :hook (org-mode . (lambda () (org-superstar-mode 1)))
  :init
  (setq org-hide-leading-stars t)
  (setq org-superstar-leading-bullet ?\s)
  (setq org-indent-mode-turns-on-hiding-stars nil)
  )

;; (use-package org-fancy-priorities
;;   :after org             
;;   :hook (org-mode . org-fancy-priorities-mode))

;; (setq org-startup-with-latex-preview t)
;; (setq org-preview-latex-process-alist '(("latex" . "latexmk -pdflatex -interaction nonstopmode -f %f")))
(setq org-preview-latex-default-process 'imagemagick)
;; (add-hook 'org-mode-hook 'org-latex-preview-mode)
;; (add-hook 'org-mode-hook #'turn-on-org-cdlatex)
(add-hook 'org-mode-hook 'org-indent-mode)
