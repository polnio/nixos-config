(use-package lsp-mode
  ;; :after evil
  ;; :after which-key
  ;; :hook (lsp-mode . lsp-enable-which-key-integration)
  ;; :config
  ;; (evil-define-key 'normal lsp-keymap-prefix (kbd "SPC l") 'lsp-keymap-prefix))
  )

(use-package lsp-ui
  :after lsp
  :hook (lsp-mode . lsp-ui-mode))
