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

;; evil mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (progn
    (evil-mode 1)
    (evil-set-initial-state 'help-mode 'normal)
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t)
    (setq evil-want-keybinding nil)))

;; Key Bindings
(use-package general
  :ensure t
  :config
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   ;; "/" '(counsel-rg :which-key "ripgrep") ; need counsel package
   "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
   "'" '(switch-to-next-buffer :which-key "next buffer")
   "SPC" '(helm-M-x :which-key "M-x")
   ;; help
   "h" '(nil :which-key "help")
   "hv" '(describe-variable :which-key "describe variable")
   "hf" '(describe-function :which-key "describe function")
   "hk" '(describe-key :which-key "describe key")
   ;; Buffers
   "b" '(nil :which-key "buffers")
   "bl" '(helm-mini :which-key "buffers and recent files")
   "bb" '(helm-buffers-list :which-key "buffers list")
   "bd" '(kill-this-buffer :which-key "kill buffer")
   "bn" '(evil-next-buffer :which-key "next buffer")
   "bp" '(evil-prev-buffer :which-key "previous buffer")
   ;; Frames
   "f" '(nil :which-key "frames")
   "fc" '(make-frame :which-key "new frame")
   "fd" '(delete-frame :which-key "delete frame")
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
   ;; neotree
   "t" '(nil :which-key "neotree")
   "tt" '(neotree-toggle :which-key "neotree toggle")
   "ts" '(neotree-show :which-key "neotree show")
   "th" '(neotree-hide :which-key "neotree hide")
   ;; major modes
   "m" '(which-key-show-major-mode :which-key "+major mode")
   ;; Others
   "r" '(nil :which-key "none")
   "rs" '(nil :which-key "none")
   "at" '(ansi-term :which-key "open terminal")
   "qq" '(kill-emacs :which-key "kill emacs")
   ;; kills
   ;; "çç" '(my--kill-extra-buffers :whick-key "kill buffers/windows")
   ;; File
   "F" '(nil :which-key "files")
   "Fl" '(load-file :which-key "load file")
   "Fr" '(helm-recentf :which-key "recent files")
   "Fp" '(helm-find-files :which-key "find files")
   ;;flycheck
   "!" '(nil :which-key "flycheck")
   "!l" '(flycheck-list-errors :which-key "list errors")
   ;; emacs
   "xf" '(find-file :which-key "find file")
   "xb" '(switch-to-buffer :which-key "switch to buffer")
   ;; helm
   "i" '(nil :which-key "helm")
   "ii" '(helm-imenu :which-key "helm imenu")))

;; rainbow delimiter
(use-package rainbow-delimiters
  :ensure t
  :defer t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

;; theme
(add-to-list 'custom-theme-load-path
	     (expand-file-name "themes" user-emacs-directory))

(load-theme 'blu-light t)
;; (load-theme 'rebecca t)

;; modeline
(use-package mood-line
  :ensure t
  :defer t
  :init
  (mood-line-mode)
  :config
  (progn
    (display-time-mode)
    (column-number-mode)))

;; whitespace mode
(use-package whitespace
  :defer t
  :init
  (add-hook 'prog-mode-hook 'whitespace-mode)
  :config
  (progn
    (setq whitespace-style
	  '(face tabs spaces trailing lines-tail space-before-tab newline
		 empty space-after-tab space-mark tab-mark
		 newline-mark missing-newline-at-eof))
    (setq whitespace-line-column 100)))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

;; show total startup time
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "emacs started in %s" (emacs-init-time))))
