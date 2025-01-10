;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'catppuccin)
;; (setq doom-theme 'cat)
;; (require 'base16-stylix-theme)
;; (load "default.el")

;; (use-package! base16-stylix-theme)
;; (setq base16-theme-256-color-source 'colors)
;; (load-theme 'base16-stylix t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; (use-package! codeium
;;   :defer t
;;   ;; get codeium status in the modeline
;;   :config
;;   ;; (setq codeium-mode-line-enable
;;   ;;       (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
;;   ;; (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
;;   ;; (setq codeium-api-enabled
;;   ;;       (lambda (api)
;;   ;;         (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion)))))
;;   )

(after! org (setq org-startup-with-latex-preview t))
(setq org-startup-with-inline-images t)

;; (after! cdlatex
;;   (setq cdlatex-math-symbol-alist
;;         '((?v ("\\vee" "\\vect")))))
(after! cdlatex
  (setq cdlatex-command-alist
        '(("vv" "Insert \\vect{}" "\\vect{?}" cdlatex-position-cursor nil nil t)))
  (setq cdlatex-math-modify-alist
        '((?b "\\mathbb" "\\textbb" t nil nil)
          (?- "\\overline" nil t t nil))))

(after! mixed-pitch (setq mixed-pitch-variable-cookie '(default :family "Roboto" :weight unspecified)))

(use-package! codeium
  :init
  ;; (add-to-list 'completion-at-point-functions #'codeium-completion-at-point))
  (add-hook! after-change-major-mode-hook
    (lambda () (print! "Hello"))))
;; (lambda () (add-to-list 'completion-at-point #'codeium-completion-at-point))))

(use-package! math-delimiters
  :config
  (with-eval-after-load 'org
    (define-key org-mode-map "$" #'math-delimiters-insert))

  (with-eval-after-load 'tex              ; for AUCTeX
    (define-key TeX-mode-map "$" #'math-delimiters-insert))

  (with-eval-after-load 'tex-mode         ; for the built-in TeX/LaTeX modes
    (define-key tex-mode-map "$" #'math-delimiters-insert))

  (with-eval-after-load 'cdlatex
    (define-key cdlatex-mode-map "$" nil)))
