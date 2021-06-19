(use-package slime
  :ensure t
  :defer t
  :init
  (progn
    (add-hook 'lisp-mode-hook 'company-mode)
    (add-hook 'lisp-mode-hook 'show-paren-mode)
    (add-hook 'lisp-mode-hook 'electric-pair-mode)
    (add-hook 'lisp-mode-hook 'auto-highlight-symbol-mode)
    (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
    (general-evil-define-key 'normal lisp-mode-map
      :prefix "SPC"
      "cs" '(slime :which-key "run slime")
      "cc" '(slime-eval-buffer :which-key "eval buffer")))
  :config
  (progn
    (setq file-slime-helper (expand-file-name "~/quicklisp/slime-helper.el"))
    (when (file-exists-p file-slime-helper)
      (progn
	(load file-slime-helper)
	(setq inferior-lisp-program "ccl")))))
