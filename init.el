;; Minimal interface
(when (display-graphic-p)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

;; work with utf 8
(set-language-environment "UTF-8")

;; save buffers/frames/etc
(desktop-save-mode 1)

;; filename on frame title
(setq-default frame-title-format '("%b [%m] - Emacs"))

;; disable anoying ring
(setq visible-bell 1)

;; send custom set variable to other file and keep init.el clean
(setq custom-file "~/.emacs.d/custom.el")

;; remember last line
(save-place-mode 1)

;; initial mode for scratch buffer
(setq initial-major-mode 'org-mode)

;; cleaner backups
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '((".*" . "~/.emacs.d/saves/"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups

;; file backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))

(tooltip-mode -1)
(menu-bar-mode -1)

(add-hook 'prog-mode-hook 'linum-mode)

;; better line number format
(setq-default linum-format "%4d ")

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
(setq-default evil-want-C-u-scroll t)
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (evil-set-initial-state 'help-mode 'normal)
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t)
  (setq evil-want-keybinding nil))


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
  (setq which-key-popup-type 'minibuffer)
  (setq which-key-side-window-location 'bottom)
  (setq which-key-side-window-max-width 0.33)
  (setq which-key-side-window-max-height 0.25)
  :config
  (which-key-mode))

;; recentf in list
;; (use-package dashboard
;;   :ensure t
;;   :diminish dashboard-mode
;;   :config
;;   (setq dashboard-startup-banner 2)
;;   (setq dashboard-items '((recents . 10)
;; 			  (bookmarks . 10)
;; 			  (registers . 10)
;; 			  ))
;;   (dashboard-setup-startup-hook))

;; Key Bindings
(use-package general
  :ensure t
  :config (general-define-key
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
	   "fc" '(new-frame :which-key "new frame")
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
	   ;; workgroups
	   ;; "wg" '(nil :which-key "workgroups")
	   ;; "wgn" '(wg-switch-right :which-key "next workgroup")
	   ;; "wgp" '(wg-switch-left :which-key "previous workgroup")
	   ;; "wgs" '(wg-save :which-key "workgroup save")
	   ;; "wgl" '(wg-load :which-key "workgroup load")
	   ;; "wgc" '(wg-create-workgroup :which-key "create workgroup")
	   ;; "wgg" '(wg-switch-to-workgroup :which-key "switch to workgroup")
	   ;; "wg?" '(wg-help :which-key "workgroup help")
	   ;; git
	   ;; "g" '(nil :which-key "magit")
	   ;; "gg" '(magit-status :which-key "status")
	   ;; "gc" '(magit-commit :which-key "commit")
	   ;; "gs" '(magit-stage :which-key "stage")
	   ;; "gl" '(magit-log :which-key "log")
	   ;; "gr" '(nil :which-key "remote")
	   ;; "grp" '(magit-push :which-key "push")
	   ;; "grl" '(magit-pull :which-key "pull")
	   ;; ;; major modes
	   "m" '(which-key-show-major-mode :which-key "+major mode")
	   ;; Others
	   "r" '(nil :which-key "none")
	   "rs" '(nil :which-key "none")
	   "at" '(ansi-term :which-key "open terminal")
	   "qq" '(kill-emacs :which-key "kill emacs")
	   ;; "pi" '(package-install :which-key "package install")
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
  :ensure t
  :config
  (setq-default rust-format-on-save t))

(add-hook 'rust-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)))

(use-package racer
  :ensure t
  :config
  (setq-default company-tooltip-align-annotations t)
  :general
  (:states '(normal emacs)
	   :keymaps 'rust-mode-map
	   "gd" '(racer-find-definition :which-key "racer go to definition")
	   "C-SPC" '(company-indent-or-complete-common :which-key "company complete"))
  )

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

;; auto update packages
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t
	auto-package-update-interval 30)
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

(general-define-key
 :keymaps 'dired-mode-map
 :states '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "M-SPC"
 "d" '(nil :which-key "dired")
 "du" '(dired-up-directory :which-key "up directory")
 "de" '(dired-find-file :which-key "edit file")
 "dv" '(dired-view-file :which-key "view file")
 "do" '(dired-find-file-other-window :which-key "edit file other window")
 "dd" '(dired-insert-subdir :which-key "insert subdir")
 )
;; ;; magit
;; (use-package magit
;;   :ensure t
;;   )

;; (use-package evil-magit
;;   :ensure t
;;   )

;; flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (add-to-list 'display-buffer-alist
	       `(,(rx bos "*Flycheck errors*" eos)
		 (display-buffer-reuse-window
		  display-buffer-in-side-window)
		 (side            . bottom)
		 (reusable-frames . visible)
		 (window-height   . 0.25)))
  )

(use-package flycheck-rust
  :ensure t
  :config
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

;; (use-package flycheck-inline
;;   :ensure t
;;   :config
;;   (with-eval-after-load 'flycheck
;;     (add-hook 'flycheck-mode-hook #'flycheck-inline-mode)))

(use-package flycheck-pos-tip
  :ensure t
  :config
  (with-eval-after-load 'flycheck
    (add-hook 'flycheck-mode-hook #'flycheck-pos-tip-mode)))

;; nim
(use-package nim-mode
  :ensure t
  :general
  (:states '(normal visual)
	   :keymaps 'nim-mode-map
	   :prefix "SPC"
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

(declare-function my--python-shell-send-buffer ()
		  "send buffer to python shell WITHOUT replacing if __name__ == main"
		  (interactive)
		  (python-shell-send-buffer 1))

(defun my--python-run-file-on-shell-command ()
  "Run the current file on a separated shell command Needs this to run GUI python scripts on windows, as they won't open a window on windows"
  (interactive)
  (shell-command (concat "python " (buffer-file-name)))
  )

(use-package anaconda-mode
  :ensure t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  :general
  (:states '(normal visual)
	   :keymaps 'python-mode-map
	   :prefix "SPC"
	   "c" '(nil :which-key "python mode")
	   "cv" '(python-check :which-key "python check")
	   "cc" '(my--python-shell-send-buffer :which-key "run buffer on python shell")
	   "cp" '(run-python :which-key "run python shell")
	   "cf" '(python-shell-send-file :which-key "run file on python shell")
	   "cs" '(my--python-run-file-on-shell-command :which-key "run python on command shell")
	   "c<" '(python-indent-shift-left :which-key "python indent shift left")
	   "c>" '(python-indent-shift-right :which-key "python indent shift right")
	   )
  )

(use-package company-anaconda
  :ensure t
  :after company
  :config
  (add-to-list 'company-backends 'company-anaconda)
  (add-hook 'python-mode-hook 'company-mode)
  (when (string-equal system-type "windows-nt")
    (setq-default flycheck-python-pycompile-executable "python")
    (setq-default flycheck-python-pylint-executable "python")
    (setq-default flycheck-python-flake8-executable "python"))
  )


(use-package blacken
  :ensure t
  :config
  (setq-default blacken-line-length 79)
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package pyvenv
  :ensure t
  )

(use-package kivy-mode
  :ensure t)

;; (use-package origami
;;   :ensure t
;;   )

;; ;; golden ration
;; (use-package golden-ratio
;;   :ensure t
;;   :init
;;   (golden-ratio-mode 1))

(defun my--lua-run-love-shell-command ()
  "Run love on the current dir on a separated shell command"
  (interactive)
  (shell-command (concat "love " default-directory))
  )

;; lua mode
(use-package lua-mode
  :ensure t
  :general
  (:states '(normal visual)
	   :keymaps 'lua-mode-map
	   :prefix "SPC"
	   "rr" '(my--lua-run-love-shell-command :which-key "run love2d")
	   )
  )

(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-setup-default)
  (persistent-scratch-autosave-mode 1))

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

;; (use-package workgroups
;;   :ensure t
;;   :config
;;   (workgroups-mode 1)
;;   (setq wg-switch-on-load nil)
;;   (wg-load "~/.emacs.d/workgroups/coding")
;;   )

;; (use-package window-purpose
;;   :ensure t
;;   :config
;;   (purpose-mode)
;;   (add-to-list 'purpose-user-mode-purposes '(python-mode . py))
;;   (add-to-list 'purpose-user-mode-purposes '(inferior-python-mode . py-repl))
;;   (setq purpose-use-default-configuration t)
;;   (purpose-compile-user-configuration))

(use-package gdscript-mode
  :ensure t
  )

(use-package neotree
  :ensure t
  :config
  (setq-default neo-theme (if (display-graphic-p) 'nerd 'arrows))
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  :general
  (:states '(normal visual)
	   :keymaps 'neotree-mode-map
	   :prefix "SPC"
	   "cc" '(neotree-change-root :which-key "neotree change root")
	   "cr" '(neotree-rename-node :which-key "neotree rename node")
	   "cn" '(neotree-create-node :which-key "neotree create node")
	   )
  )

(defun my-put-file-name-on-clipboard ()
  "Put the current file name on the clipboard"
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
		      default-directory
		    (buffer-file-name))))
    (when filename
      (with-temp-buffer
	(insert filename)
	(clipboard-kill-region (point-min) (point-max)))
      (message filename))))

;; projectile
(use-package projectile
  :ensure t
  :general
  (:states '(normal visual)
	   :keymaps 'projectile-mode-map
	   :prefix "SPC"
	   "p" '(projectile-command-map :which-key "projectile command")
	   )
  :config
  (projectile-mode +1)
  (setq-default projectile-indexing-method 'native)
  )

;; Themes
(use-package material-theme
  :ensure t
  :defer t)

(use-package srcery-theme
  :ensure t
  :defer t
  )

(use-package flatland-theme
  :ensure t
  :defer t
  )

(use-package sublime-themes
  :ensure t
  :defer t
  )

(use-package gruvbox-theme
  :ensure t
  :defer t)

(use-package suscolors-theme
  :ensure t
  :defer t
  )

(use-package atom-one-dark-theme
  :ensure t
  :defer t)

(defvar my--theme
  (custom-available-themes))

(defun my--rnth (seq)
  (nth (random (length seq)) seq))

(defun my--load-theme ()
  (interactive)
  ;; (load-theme (my--rnth my--theme) t)
  (load-theme 'adwaita t)
  )

(add-hook 'emacs-startup-hook 'my--load-theme)
