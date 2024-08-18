(use-package cmake-mode
  :ensure t
  :defer t)

(use-package clang-format
  :ensure t
  :defer t)

(defun my-setup-c-ts-mode ()
  (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))
  (use-package c-ts-mode
    :ensure t
    :defer t
    :config
    (progn
      (setq c-ts-mode-indent-offset 2)
      (setq c-ts-mode-indent-style 'linux)
      (add-hook 'c-ts-mode-hook #'electric-pair-mode)
      (add-hook 'c-ts-mode-hook #'lsp-deferred)
      (add-hook 'c-ts-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'c-ts-mode-hook (lambda ()
                                  (add-hook 'before-save-hook #'clang-format-buffer nil t)))
      (add-hook 'c-ts-mode-hook #'company-mode))
    :general
    (:keymaps 'c-ts-mode-map
              :prefix "SPC"
              :states '(normal visual)
              "c" '(nil :which-key "c major mode")
              "cr" '(lsp-rename :which-key "lsp rename")
              "cf" '(lsp-execute-code-action :which-key "lsp execute code action"))))

(defun my-setup-c-mode ()
  (use-package cc-mode
    :ensure t
    :defer t
    :config
    (progn
      (require 'semantic)
      (global-semanticdb-minor-mode 1)
      (global-semantic-idle-scheduler-mode 1)
      (add-hook 'c-mode-hook #'semantic-mode)
      (add-hook 'c-mode-hook #'electric-pair-mode)
      (add-hook 'c-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'c-mode-hook #'company-mode)
      (add-hook 'c-mode-hook
                (lambda() (setq-local company-backends
                                      '(company-semantic
                                        company-dabbrev-code
                                        company-keywords
                                        company-files
                                        company-dabbrev))))
      (setq c-basic-offset 2)
      (setq c-default-style '((java-mode . "java")
                              (awk-mode . "awk")
                              (other . "linux"))))))

(if (treesit-language-available-p 'c)
    (my-setup-c-ts-mode)
  (my-setup-c-mode))
