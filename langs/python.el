(use-package py-autopep8
  :ensure t)

(defun py-autopep8-enable-on-save ()
  (add-hook 'before-save-hook 'py-autopep8-buffer nil t))

(defun my-setup-python-mode ()
  (message "setting up legacy mode for python")
  (use-package elpy
    :ensure t
    :defer t
    :init
    (advice-add 'python-mode :before 'elpy-enable)
    (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)))

(defun my-after-python-ts-mode-loaded ()
  (progn
    (lsp-deferred)
    (flycheck-mode)
    (company-mode)))

(defun my-setup-python-treesit-mode ()
  (message "setting up treesit mode for python")
  (progn
    (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
    (setq-default lsp-pylsp-plugins-autopep8-enabled t)
    (add-hook 'python-ts-mode-hook 'py-autopep8-enable-on-save)
    (add-hook 'python-ts-mode-hook #'my-after-python-ts-mode-loaded)))

(if (treesit-language-available-p 'python)
    (my-setup-python-treesit-mode)
  (my-setup-python-mode))
