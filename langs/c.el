(use-package cc-mode
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'c-mode-hook #'company-mode)))

(use-package cmake-mode
  :ensure t
  :defer t)
