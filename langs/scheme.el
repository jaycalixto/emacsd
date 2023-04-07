(use-package geiser
  :ensure t
  :defer t)

(use-package geiser-chicken
  :ensure t
  :defer t)

(use-package scheme
  :ensure t
  :defer t
  :general
  (:keymaps 'scheme-mode-map
            :prefix "SPC"
            :states '(normal visual)
            "cr" '(compile-and-run :which-key "scheme compile and run"))
  )

(add-hook 'scheme-mode-hook 'company-mode)
(add-hook 'scheme-mode-hook 'show-paren-mode)
(add-hook 'scheme-mode-hook 'electric-pair-mode)
(add-hook 'scheme-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

(defun compile-and-run ()
  (interactive)
  (let ((compile-dir (vc-find-root (buffer-file-name) ".dir-locals.el")))
    (unless compile-dir
      (message "project root with .dir-locals.el file not found"))
    (message compile-dir))
  (if (null my--compiler)
      (message "please configure the my--compiler local variable"))
  ;; (shell-command "cd .. ; chicken-install -n ; gnome-terminal -- bash -c './ascii-roguelike; sh read -p finished... ' ")
  )
