;; -*- lexical-binding: t; -*-

(defun after-rust-mode-loaded ()
  (progn
    (electric-pair-mode)
    (setq indent-tabs-mode nil)
    ;;(prettify-symbols-mode)
    (flycheck-mode)
    (rainbow-delimiters-mode)
    (company-mode)
    (font-lock-mode 1)
    (lsp-deferred)))

(use-package rust-mode
  :ensure t
  :defer t
  :config
  (progn
    (setq rust-format-on-save t)
    (add-hook 'rust-mode-hook #'after-rust-mode-loaded)))

(when my--use-evil
  (general-define-key
   :keymaps 'rust-mode-map
   :prefix "SPC"
   :states '(normal visual)
   "cr" '(rust-run :which-key "rust run")
   "cu" '(rust-compile :which-key "rust compile")
   "cl" '(rust-run-clippy :which-key "rust run clippy")
   "ct" '(rust-test :which-key "rust test")
   "ck" '(rust-check :which-key "rust check")
   "cn" '(rust-goto-format-problem :which-key "rust go to format problem")
   "cf" '(rust-format-buffer :which-key "rust format buffer")))
