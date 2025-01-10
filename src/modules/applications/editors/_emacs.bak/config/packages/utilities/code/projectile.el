(use-package projectile
  :after evil
  :init
  (when (file-directory-p "~/Documents/school")
    (setq projectile-project-search-path '("~/Documents/school")))
  :config
  (projectile-mode +1)
  (evil-define-key 'normal projectile-mode-map (kbd "SPC p") 'projectile-command-map))
