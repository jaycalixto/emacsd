(use-package tide
  :ensure t
  :defer t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package typescript-mode
  :ensure t
  :defer t
  :config
  (progn
    (setq company-tooltip-align-annotations t)
    (add-hook 'typescript-mode-hook #'setup-tide-mode)
    (add-hook 'typescript-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'typescript-mode-hook #'electric-pair-mode)
    (add-hook 'before-save-hook 'tide-format-before-save)))
