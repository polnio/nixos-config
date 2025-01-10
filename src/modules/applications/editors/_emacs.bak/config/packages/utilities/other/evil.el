(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (define-key evil-motion-state-map " " nil)
  (evil-mode 1))

(use-package evil-args
  :config
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-embrace
  :after evil-surround
  :hook (LaTeX-mode . embrace-LaTeX-mode-hook)
  :hook (org-mode . embrace-org-mode-hook)
  :hook (emacs-lisp-mode . embrace-emacs-lisp-mode-hook)
  :init
  (evil-embrace-enable-evil-surround-integration))

(use-package evil-escape
  :init
  (setq evil-escape-key-sequence "jk")
  :config
  (evil-escape-mode))

;; evil-exchange

;; evil-indent-plus

(use-package evil-lion
  :config
  (evil-lion-mode))

(use-package evil-numbers
  :config
  (evil-define-key '(normal visual) 'global (kbd "C-a") 'evil-numbers/inc-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "C-x") 'evil-numbers/dec-at-pt)
  (evil-define-key '(normal visual) 'global (kbd "g C-a") 'evil-numbers/inc-at-pt-incremental)
  (evil-define-key '(normal visual) 'global (kbd "g C-x") 'evil-numbers/dec-at-pt-incremental))

;; evil-snipe

(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

;; evil-trace

(use-package exato)
  
