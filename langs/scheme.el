(use-package geiser
  :ensure t
  :defer t)

(use-package geiser-chicken
  :ensure t
  :defer t)

(add-hook 'scheme-mode-hook 'company-mode)
(add-hook 'scheme-mode-hook 'show-paren-mode)
(add-hook 'scheme-mode-hook 'electric-pair-mode)
(add-hook 'scheme-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)
