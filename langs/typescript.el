(use-package tide
  :ensure t
  :defer t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save idle-change new-line mode-enabled))
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

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; (flycheck-add-mode 'typescript-tslint 'web-mode)
