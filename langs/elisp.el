(use-package emacs-lisp-mode
  :defer t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'emacs-lisp-mode-hook 'company-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
    (add-hook 'emacs-lisp-mode-hook 'electric-pair-mode))
  :general
  (:keymaps 'emacs-lisp-mode-map
            :prefix "SPC"
            :states '(normal visual)
            "c" '(nil :which-key "emacs lisp keys")
            "ce" '(elisp-eval-region-or-buffer :which-key "eval region or buffer")))
