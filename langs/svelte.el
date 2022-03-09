(use-package svelte-mode
  :defer t
  :ensure t
  :config
  (progn
    (add-hook 'svelte-mode-hook #'company-mode)
    (add-hook 'svelte-mode-hook #'rainbow-delimiters-mode)))
