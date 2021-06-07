(add-hook 'lisp-mode-hook 'company-mode)
(add-hook 'lisp-mode-hook 'show-paren-mode)
(add-hook 'lisp-mode-hook 'electric-pair-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)

(use-package slime
  :ensure t
  :defer t
  :config
  ;; TODO make this work on linux
  (progn
    (load (expand-file-name "~/quicklisp/slime-helper.el"))
    (setq inferior-lisp-program "ccl")))
