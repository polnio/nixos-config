(use-package rust-mode
  :after lsp
  :hook (rust-mode . lsp)
  :init
  (setq rust-mode-treesitter-derive t))
  ;; :config
  ;; (add-hook 'rust-mode-hook #'lsp))

;; (use-package rustic
;;   :after rust-mode)
