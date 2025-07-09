(use-package janet-mode
  :ensure t
  :defer t)

(add-hook 'janet-mode-hook 'company-mode)
(add-hook 'janet-mode-hook 'show-paren-mode)
(add-hook 'janet-mode-hook 'electric-pair-mode)
(add-hook 'janet-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'janet-mode-hook 'rainbow-delimiters-mode)
