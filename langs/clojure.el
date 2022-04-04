(use-package clojure-mode
  :ensure t
  :defer t
  :init
  (progn 
    (add-hook 'lisp-mode-hook 'company-mode)
    (add-hook 'lisp-mode-hook 'electric-pair-mode)
    (add-hook 'lisp-mode-hook 'auto-highlight-symbol-mode)
    (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'lisp-mode-hook 'show-paren-mode)))
