(use-package gdscript-mode
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'gdscript-mode-hook #'lsp-deferred)))
