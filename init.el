;; Make startup faster by reducing the frequency of garbage
;; collection.  The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

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

(defun my--load-file-from-home (filename)
  (load-file
   (expand-file-name filename user-emacs-directory)))

;; package config
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; rainbow delimiter
(use-package rainbow-delimiters
  :ensure t
  :defer t)

;; modeline
(use-package mood-line
  :ensure t
  :defer t
  :init
  (mood-line-mode t)
  :config
  (progn
    (display-time-mode)
    (column-number-mode)))

;; whitespace mode
(use-package whitespace
  :defer t
  ;;:init
  ;;(add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (progn
    (setq whitespace-style
	  '(face tabs spaces trailing lines-tail space-before-tab newline
		 empty space-after-tab space-mark tab-mark
		 newline-mark missing-newline-at-eof))
    (setq whitespace-line-column 100)))

;; keybindings
(my--load-file-from-home "keybindings.el")

;; ido
(use-package ido
  :ensure t
  :defer t
  ;; :init
  ;; (ido-mode t)
  :config
  (progn
    (require 'recentf)
    (recentf-mode t)
    (setq ido-separator "\n")
    (setq recentf-max-saved-items 200)
    (setq ido-use-virtual-buffers t))
  :hook
  (after-init . ido-mode))

;; autocompletion
;; TODO fix autocompletion colors on blu theme
(use-package company
  :ensure t
  :defer t)

;; Which Key
(use-package which-key
  :ensure t
  :defer t
  :config
  (progn 
    (setq which-key-separator " ")
    (setq which-key-prefix-prefix "+")
    (setq which-key-popup-type 'minibuffer)
    (setq which-key-side-window-location 'bottom)
    (setq which-key-side-window-max-width 0.33)
    (setq which-key-side-window-max-height 0.25))
  :hook
  (after-init . which-key-mode))

;; languages and major modes
(my--load-file-from-home "langs/elisp.el")
;; (my--load-file-from-home "langs/elixir.el")

;; theme (load theme last so i imediatly can tell if there's something wrong)
(add-to-list
 'custom-theme-load-path
 (expand-file-name "themes" user-emacs-directory))

(load-theme 'blu-light t)
;; (load-theme 'rebecca t)

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

;; show total startup time
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "emacs started in %s" (emacs-init-time))))
