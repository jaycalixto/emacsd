;; Minimal interface
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

;; work with utf 8
(set-language-environment "UTF-8")

;; disable anoying ring
(setq visible-bell 1)

;; remember last line
(save-place-mode 1)

(tooltip-mode -1)
(menu-bar-mode -1)

(add-hook 'prog-mode-hook 'linum-mode)

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

;; all the icons
(use-package all-the-icons
  :ensure t)

;; rainbow delimiter
(use-package rainbow-delimiters
  :ensure t)

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  :init
  (setq evil-want-keybinding nil))

;; Theme
;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (load-theme 'doom-acario-light t)
;;   ;; (load-theme 'doom-one t)
;;   ;; (load-theme 'doom-acario-dark t)
;;   )

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t)
  )

;; Better font
(setq default-frame-alist
      (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono 10")))


;; Helm
(use-package helm
  :ensure t
  :init
  (defvar helm-mode-fuzzy-match t)
  (defvar helm-completion-in-region-fuzzy-match t)
  (setq helm-candidate-number-limit 50))

;; smartparens
(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config))

;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  (setq which-key-popup-type 'side-window)
  (setq which-key-side-window-location 'bottom)
  (setq which-key-side-window-max-width 0.33)
  (setq which-key-side-window-max-height 0.25)
  :config
  (which-key-mode))

;; recentf in list
(use-package dashboard
  :ensure t
  :diminish dashboard-mode
  :config
  (setq dashboard-items '((recents . 10)
			  (bookmarks . 10)
			  (registers . 10)
			  ))
  (dashboard-setup-startup-hook))

;; Key Bindings
(use-package general
  :ensure t
  :config (general-define-key
	   :states '(normal visual insert emacs)
	   :prefix "SPC"
	   :non-normal-prefix "M-SPC"
	   ;; "/" '(counsel-rg :which-key "ripgrep") ; need counsel package
	   "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
	   "SPC" '(helm-M-x :which-key "M-x")
	   ;; Buffers
	   "b" '(nil :which-key "buffers")
	   "bl" '(helm-mini :which-key "buffers and recent files")
	   "bb" '(helm-buffers-list :which-key "buffers list")
	   "bd" '(evil-delete-buffer :which-key "kill buffer")
	   "bn" '(evil-next-buffer :which-key "next buffer")
	   "bp" '(evil-prev-buffer :which-key "previous buffer")
	   ;; Frames
	   "f" '(nil :which-key "frames")
	   "fn" '(other-frame :which-key "next frame")
	   "ff" '(next-multiframe-window :which-key "next multiframe window")
	   ;; Window
	   "w" '(nil :which-key "window")
	   "wl" '(windmove-right :which-key "move right")
	   "wd" '(evil-window-delete :which-key "delete window")
	   "wh" '(windmove-left :which-key "move left")
	   "wk" '(windmove-up :which-key "move up")
	   "wj" '(windmove-down :which-key "move bottom")
	   "w/" '(split-window-right :which-key "split right")
	   "w-" '(split-window-below :which-key "split bottom")
	   "wx" '(delete-window :which-key "delete window")
	   ;; major modes
	   "m" '(which-key-show-major-mode :which-key "+major mode")
	   ;; Others
	   "at" '(ansi-term :which-key "open terminal")
	   "qq" '(kill-emacs :which-key "kill emacs")
	   "pi" '(package-install :which-key "package install")
	   ;; File
	   "F" '(nil :which-key "files")
	   "Fl" '(load-file :which-key "load file")
	   "Fr" '(helm-recentf :which-key "recent files")
	   "Fp" '(helm-find-files :which-key "find files")
	   )
  (general-create-definer localleader
    :states '(normal visual)
    :prefix ",")
  )

(global-set-key (kbd "C-;")
		'comment-line)

;; company
(use-package company
  :ensure t)

;; doom modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  )

;; ;; evil collection
;; (use-package evil-collection
;;  :ensure t
;;  :init
;;   (evil-collection-init))

;; emacs lisp mode hooks
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'company-mode)

;; rust
(use-package rust-mode
  :ensure t)

(add-hook 'rust-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

;; auto update packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-interval 4)
  (auto-package-update-maybe))


;; evil org mode
(use-package dash
  :ensure t)
(use-package monitor
  :ensure t)
(use-package org-evil
  :ensure t)

;; org mode
(use-package org
  :ensure t
  :general
  (localleader :keymaps 'org-mode-map
	       "cc" '(org-time-stamp :which-key "org time stamp")
  ))

;; yaml
(use-package yaml-mode
  :ensure t
  )

;; markdown
(use-package markdown-mode
  :ensure t
  :init (setq markdown-command "pandoc")
  :general
  (localleader :keymaps 'markdown-mode-map
    "p" '(nil :which-key "preview")
    "pl" '(markdown-live-preview-mode :which-key "markdown live preview mode")
    "pp" '(markdown-preview :which-key "markdown preview")
    "o" '(markdown-other-window :which-key "markdown other window")
    ))

;; magit
(use-package magit
  :ensure t
  )

;; flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

;; nim
(use-package nim-mode
  :ensure t
  :general
  (:states '(normal visual)
	   :keymaps 'nim-mode-map
	   "cc" '(nim-compile :which-key "nim compile")
	   )
  )

(defun my--nim-mode-init-hook ()
   ;; Make files in the nimble folder read only by default.
   ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" buffer-file-name) (read-only-mode 1))
  (flycheck-mode 1)
  )
(add-hook 'nim-mode-hook 'my--nim-mode-init-hook)

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  )

(use-package origami
  :ensure t
  )
  
;; ;; golden ration
;; (use-package golden-ratio
;;   :ensure t
;;   :init
;;   (golden-ratio-mode 1))

;; lua mode
(use-package lua-mode
  :ensure t
  )

;; dart
;; Assuming usage with dart-mode
;; (use-package dart-mode
;;   :ensure-system-package (dart_language_server . "pub global activate dart_language_server")
;;   :custom
;;   (dart-format-on-save t)
;;   (dart-sdk-path "/Applications/flutter/bin/cache/dart-sdk/"))
(use-package dart-mode
  :ensure t
  :custom
  (dart-format-on-save t)
  )

;; (use-package flutter
;;   :after dart-mode
;;   :bind (:map dart-mode-map
;;               ("C-M-x" . #'flutter-run-or-hot-reload))
;;   :custom
;;   (flutter-sdk-path "/Applications/flutter/"))

(use-package flutter
  :after dart-mode
  :ensure t
  )

;; Optional
(use-package flutter-l10n-flycheck
  :after flutter
  :ensure t
  )
;;:config
;;  (flutter-l10n-flycheck-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (gnu-elpa-keyring-update transient magit markdown-mode yaml-mode all-the-icons general which-key helm doom-themes evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

