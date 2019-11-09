;; Minimal interface
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

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
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-acario-light t))

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
           ;; Window
           "wl" '(windmove-right :which-key "move right")
           "wh" '(windmove-left :which-key "move left")
           "wk" '(windmove-up :which-key "move up")
           "wj" '(windmove-down :which-key "move bottom")
           "w/" '(split-window-right :which-key "split right")
           "w-" '(split-window-below :which-key "split bottom")
           "wx" '(delete-window :which-key "delete window")
           ;; Others
           "at" '(ansi-term :which-key "open terminal")
	   "qq" '(kill-emacs :which-key "kill emacs")
           ))

;; company
(use-package company
  :ensure t)

;; doom modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  )

;; evil collection
(use-package evil-collection
  :ensure t
  :init
  (evil-collection-init))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (all-the-icons general which-key helm doom-themes evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
