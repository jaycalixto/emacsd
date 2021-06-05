(use-package emacs-lisp-mode
  :defer t
  :init
  (progn
    (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'emacs-lisp-mode-hook 'company-mode)
    (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
    (add-hook 'emacs-lisp-mode-hook 'electric-pair-mode)))
