(use-package web-mode
  :ensure t
  :defer t)

(use-package tide
  :ensure t
  :defer t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (setq tide-format-options '(:indentSize 2 :tabSize 2))
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(defun my-setup-typescript-mode ()
  (message "setting up legacy mode for typescript")
  (use-package typescript-mode
    :ensure t
    :defer t
    :config
    (progn
      (setq company-tooltip-align-annotations t)
      (add-hook 'typescript-mode-hook #'setup-tide-mode)
      (add-hook 'typescript-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'typescript-mode-hook #'electric-pair-mode)
      (add-hook 'before-save-hook 'tide-format-before-save))
    :general
    (:keymaps 'typescript-mode-map
              :prefix "SPC"
              :states '(normal visual)
              "cr" '(tide-rename-symbol :which-key "rename symbol")))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))

(defun my-setup-ts-mode ()
  (message "setting up treesit mode for typescript")
  (use-package typescript-ts-mode
    :ensure t
    :defer t
    :config
    (progn
      (setq company-tooltip-align-annotations t)
      (setq typescript-ts-mode-indent-offset 2)
      (add-hook 'typescript-ts-mode-hook #'setup-tide-mode)
      (add-hook 'typescript-ts-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'typescript-ts-mode-hook #'electric-pair-mode)
      (add-hook 'before-save-hook 'tide-format-before-save))
    :general
    (:keymaps 'typescript-ts-mode-map
              :prefix "SPC"
              :states '(normal visual)
              "cr" '(tide-rename-symbol :which-key "rename symbol")))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode)))

(if (treesit-language-available-p 'typescript)
    (my-setup-ts-mode)
  (my-setup-typescript-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; (flycheck-add-mode 'typescript-tslint 'web-mode)
