;; file tree configuration
(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-litter-directories '("/node_modules" "/.venv" "/.cask" "/__pycache__"))))

(use-package treemacs-evil
  :ensure t
  :after (treemacs evil))

(general-define-key
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "t" '(nil :which-key "tree")
 "tt" '(treemacs :which-key "open treemacs")
 "tc" '(treemacs-cleanup-litter :which-key "close litter directories")
 "th" '(treemacs-toggle-show-dotfiles :which-key "toggle show dotfiles")
 "ti" '(treemacs-hide-gitignored-files-mode :which-key "toggle show gitignored files")
 "t0" '(treemacs-select-window :which-key "treemacs select window"))
