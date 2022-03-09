(use-package zig-mode
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'zig-mode-hook #'electric-pair-mode)
    (add-hook 'zig-mode-hook #'company-mode)))
