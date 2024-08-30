;; (use-package catppuccin-theme
;;   :ensure t
;;   :init
;;   (setq catppuccin-flavor 'frappe) ;; latte macchiato mocha frappe
;;   :defer t)

(add-to-list
 'custom-theme-load-path
 (expand-file-name "themes" user-emacs-directory))
;; (load-theme 'rebecca t)
;; (load-theme 'atom-one-dark t)
;; (load-theme 'srcery t)

(setq catppuccin-flavor 'latte)
(load-theme 'catppuccin t)
