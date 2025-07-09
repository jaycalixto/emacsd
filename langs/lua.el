(defun my-setup-legacy-lua-mode ()
  (message "Setting up legacy mode for lua")
  (use-package lua-mode
    :ensure t
    :defer t
    :config
    (progn
      (setq lua-indent-level 2))))

(defun my-setup-lua-treesit-mode ()
  (message "setting up treesit mode for lua")
  (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))
  (add-hook 'lua-ts-mode 'lsp-deferred)
  (add-hook 'lua-ts-mode 'company-mode)
  (add-hook 'lua-ts-mode 'flycheck-mode))

(if (treesit-language-available-p 'lua)
    (my-setup-lua-treesit-mode)
  (my-setup-legacy-lua-mode))
