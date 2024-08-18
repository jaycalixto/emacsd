(use-package catppuccin-theme
  :ensure t
  :init
  (setq catppuccin-flavor 'frappe) ;; latte macchiato mocha frappe
  :defer t)

(setq-default my-theme-to-use
              ;;'rebecca
              ;;'atom-one-dark
              ;;'srcery
              ;;'catppuccin
              'acme)

(add-to-list
 'custom-theme-load-path
 (expand-file-name "themes" user-emacs-directory))
(load-theme my-theme-to-use t)

(defun reenable-theme ()
  (interactive)
  (disable-theme my-theme-to-use)
  (load-theme my-theme-to-use t))
