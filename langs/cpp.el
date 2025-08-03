(use-package clang-format
  :ensure t
  :defer t)

(defun my-config-company-for-c++ ()
  (setq-local company-backends
              '(company-semantic
                company-dabbrev-code
                company-keywords
                company-files
                company-dabbrev)))

(defun my-setup-cpp-mode ()
  (message "setting up legacy mode for C++")
  ;; (require 'c++-mode)
  (require 'semantic)
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (add-hook 'c++-mode-hook #'semantic-mode)
  (add-hook 'c++-mode-hook #'electric-pair-mode)
  (add-hook 'c++-mode-hook #'rainbow-delimiters-mode)
  (add-hook 'c++-mode-hook #'company-mode)
  (add-hook 'c++-mode-hook #'my-config-company-for-c++))

(defun my-setup-cpp-ts-mode ()
  (message "setting up ts mode for C++")
  (use-package c-ts-mode
    :ensure t
    :defer t
    :config
    (progn
      (setq c-ts-mode-indent-offset 2)
      (setq-default indent-tabs-mode nil)
      (setq c-ts-mode-indent-style 'linux)
      (require 'semantic)
      (global-semanticdb-minor-mode 1)
      (global-semantic-idle-scheduler-mode 1)
      (add-hook 'c++-ts-mode-hook #'lsp-deferred)
      (add-hook 'c++-ts-mode-hook #'semantic-mode)
      (add-hook 'c++-ts-mode-hook #'electric-pair-mode)
      (add-hook 'c++-ts-mode-hook #'rainbow-delimiters-mode)
      (add-hook 'c++-ts-mode-hook #'company-mode)
      (add-hook 'c++-ts-mode-hook (lambda ()
                                    (add-hook 'before-save-hook #'clang-format-buffer nil t)))
      (add-hook 'c++-ts-mode-hook #'my-config-company-for-c++))
    :general
    (:keymaps 'c++-ts-mode-map
              :prefix "SPC"
              :states '(normal visual)
              "c" '(nil :which-key "C++ major mode")
              "cr" '(lsp-rename :which-key "lsp rename")
              "cf" '(lsp-execute-code-action :which-key "lsp execute code action"))))

(if (treesit-language-available-p 'cpp)
    (my-setup-cpp-ts-mode)
  (my-setup-cpp-mode))
