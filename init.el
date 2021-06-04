;; disable startup buffer
(setq inhibit-splash-screen t)

;; disable menu bar in console
(menu-bar-mode -1)

;; disable tooltips
(tooltip-mode -1)

;; Minimal interface
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

;; disable anoying ring
(setq visible-bell 1)

;; send custom set variable to other file and keep init.el clean
(setq custom-file "~/.emacs.d/custom.el")

;; start by opening init.el
;; (setq initial-buffer-choice user-init-file)

;; filename on frame title
(setq frame-title-format '("%b [%m] - Emacs " emacs-version))

;; work with utf 8
(set-language-environment "UTF-8")

;; remember last line
(save-place-mode t)

;; kill scratch buffer
(if (get-buffer "*scratch*")
    (kill-buffer "*scratch*"))

;; disable ~ files
(setq make-backup-files nil)

;; show line numbers for programming modes
(add-hook 'prog-mode-hook 'linum-mode)

;; better line number format
(setq-default linum-format "%03d")

;; Better font
(setq default-frame-alist
      (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 10")))

;; make frame start bigger and more centralized
(when window-system
  (set-frame-position (selected-frame) 350 50)
  (set-frame-size (selected-frame) 120 55))

;; theme
;; (load-theme 'adwaita t)

;; (load-file (expand-file-name "themes/blu-light.el" user-emacs-directory))

(add-to-list 'custom-theme-load-path
	     (expand-file-name "themes" user-emacs-directory))

;;(load-theme 'blu-light t)
(load-theme 'rebecca t)

;; whitespace mode
(setq whitespace-style
      '(face tabs spaces trailing lines-tail space-before-tab newline
        empty space-after-tab space-mark tab-mark
        newline-mark missing-newline-at-eof))
(setq whitespace-line-column 100)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; show total startup time
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "emacs started in %s" (emacs-init-time))))
