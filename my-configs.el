;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; safe local variables
(put 'my--compiler 'safe-local-variable #'stringp)
(put 'my--term 'safe-local-variable #'stringp)

(setq-default my--font
              (if (eq system-type 'gnu/linux)
                  "DejaVuSans Mono 10"
                "Lucida Console 12"))

(setq default-frame-alist
      (add-to-list 'default-frame-alist `(font . ,my--font)))

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
(setq visible-bell t)

;; send custom set variable to other file and keep init.el clean
(setq custom-file "~/.emacs.d/custom.el")

;; filename on frame title
(setq frame-title-format '("%b [%f] - Emacs " emacs-version))

;; work with utf 8
(set-language-environment "UTF-8")

;; remember last line
(save-place-mode t)

;; kill scratch buffer
;;(if (get-buffer "*scratch*")
;;    (kill-buffer "*scratch*"))

;; disable ~ files
(setq make-backup-files nil)

;; show line numbers for programming modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; make frame start bigger and more centralized
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 120 50))

;; revert buffers a when file changed in disk
(global-auto-revert-mode t)

;; start server
(add-hook 'emacs-startup-hook
          (lambda ()
            (require 'server)
            (message "starting server")
            (unless (server-running-p) (server-start))))

;; Make gc pauses faster by decreasing the threshold.
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 2 1000 1000))))

;; show total startup time
(add-hook 'emacs-startup-hook
	  (lambda ()
            (message (emacs-version))
            (message "emacs started in %s" (emacs-init-time))))

