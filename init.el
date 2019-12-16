;; Minimal interface
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

;; disable anoying ring
(setq visible-bell 1)

;; remember last line
(save-place-mode 1)

(tooltip-mode -1)
(menu-bar-mode -1)

(global-linum-mode t)

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
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
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
	   "pf" '(helm-find-file :which-key "find files")
	   ;; Buffers
	   "bb" '(helm-buffers-list :which-key "buffers list")
	   "bd" '(evil-delete-buffer :which-key "kill buffer")
	   "bn" '(evil-next-buffer :which-key "next buffer")
	   "bp" '(evil-prev-buffer :which-key "previous buffer")
	   ;; Frames
	   "fn" '(other-frame :which-key "next frame")
	   "ff" '(next-multiframe-window :which-key "next multiframe window")
	   ;; Window
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
	   ;; File
	   "Fl" '(load-file :which-key "load file")
	   "Fr" '(helm-recentf :which-key "recent files")
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

;; nim
(use-package nim-mode
  :ensure t)

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
  )

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  )

(use-package origami
  :ensure t
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode yaml-mode all-the-icons general which-key helm doom-themes evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
