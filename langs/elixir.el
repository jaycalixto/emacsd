(use-package elixir-mode
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'elixir-mode-hook 'alchemist-mode)
    (add-hook 'elixir-mode-hook 'company-mode)
    ;; (add-hook 'elixir-mode-hook 'smartparens-mode)
    (add-hook 'elixir-mode-hook 'electric-pair-mode)
    (add-hook 'elixir-mode-hook (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))))

(use-package alchemist
  :ensure t
  :defer t)
