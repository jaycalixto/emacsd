(use-package company-lua
  :ensure t
  :defer t)

(defun my-lua-mode-company-init ()
  (setq-local company-backends '((company-lua
                                  company-etags
                                  company-dabbrev-code
                                  company-yasnippet))))

(defun my-after-lua-mode-hook(hook-symbol)
  (setq lua-indent-level 2)
  (add-hook hook-symbol 'lsp-deferred)
  (add-hook hook-symbol 'company-mode)
  (add-hook hook-symbol 'flycheck-mode)
  (add-hook hook-symbol #'my-lua-mode-company-init)
  (setq flycheck-luacheck-args '("--std" "lua53")))

(defun my-setup-legacy-lua-mode ()
  (message "Setting up legacy mode for lua")
  (require 'company)
  (require 'company-lua)
  (require 'compile)
  (use-package lua-mode
    :ensure t
    :defer t
    :config
    (my-after-lua-mode-hook 'lua-mode-hook)
    :general
    (:keymaps 'lua-mode-map
              :prefix "SPC"
              :states '(normal visual)
              "c" '(nil :which-key "lua major mode")
              "cc" '(recompile :which-key "(re)compile"))))

(defun my-setup-lua-treesit-mode ()
  (message "setting up treesit mode for lua")
  (require 'lua-ts-mode)
  (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))
  (my-after-lua-mode-hook 'lua-ts-mode-hook))

;; (if (treesit-language-available-p 'lua)
;;     (my-setup-lua-treesit-mode)
;;   (my-setup-legacy-lua-mode))

(my-setup-legacy-lua-mode)
