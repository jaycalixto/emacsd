(defun my--load-file-from-home (filename)
  (load-file
   (expand-file-name filename user-emacs-directory)))

(my--load-file-from-home "my-configs.el")

;; Bootstrap `use-package'
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(my--load-file-from-home "keybindings.el")

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

(global-hl-line-mode 1)

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

;; rainbow delimiter
(use-package rainbow-delimiters
  :ensure t
  :defer t)


;; ido
(use-package ido
  :ensure t
  :defer t
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
(use-package company
  :ensure t
  :defer t)

(use-package auto-highlight-symbol
  :ensure t
  :defer t)

(use-package flycheck
  :ensure t
  :defer t
  :config
  (progn
    (setq-default flycheck-temp-prefix ".flycheck")
    (flycheck-add-mode 'typescript-tslint 'web-mode)))

;; Language Server Protocol
(use-package lsp-mode
  :ensure t
  :defer t
  :config
  (setq-default lsp-enable-snippet nil)
  :hook
  (lsp-mode . lsp-enable-which-key-integration)
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :defer t
  :commands lsp-ui-mode)

;; imenu list
(use-package imenu-list
  :ensure t
  :defer t
  :commands imenu-list-smart-toggle
  :config
  (progn
    (setq-default imenu-list-focus-after-activation t)
    (setq-default imenu-list-auto-resize t)
    (setq-default imenu-list-position 'right)))

;; tab bar
;; (global-tab-line-mode t)
(setq tab-line-new-button-show nil)
(setq tab-line-close-button-show nil)
(setq tab-line-separator " ")

;; spellcheck
;; (setq ispell-program-name "hunspell")
;; (setq ispell-local-dictionary "pt_BR")

;; languages and major modes
(my--load-file-from-home "langs/typescript.el")
(my--load-file-from-home "langs/elisp.el")
;; (my--load-file-from-home "langs/ada.el")
(my--load-file-from-home "langs/c.el")
;; (my--load-file-from-home "langs/clisp.el")
;; (my--load-file-from-home "langs/clojure.el")
;; (my--load-file-from-home "langs/elixir.el")
(my--load-file-from-home "langs/gdscript.el")
;; (my--load-file-from-home "langs/scheme.el")
(my--load-file-from-home "langs/javascript.el")
;; (my--load-file-from-home "langs/lua.el")
(my--load-file-from-home "langs/org.el")
(my--load-file-from-home "langs/rust.el")
(my--load-file-from-home "langs/python.el")
;; (my--load-file-from-home "langs/scala.el")
;; (my--load-file-from-home "langs/sml.el")
;; (my--load-file-from-home "langs/svelte.el")
;; (my--load-file-from-home "langs/zig.el")
;; (my--load-file-from-home "langs/cmake.el")
;; (my--load-file-from-home "langs/carp.el")
(my--load-file-from-home "langs/nix.el")

;; start with messages buffer
;; (setq initial-buffer-choice
;;       (lambda ()
;;         (get-buffer "*Messages*")))

(my--load-file-from-home "tree.el")

(my--load-file-from-home "themes.el")

(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 120))
