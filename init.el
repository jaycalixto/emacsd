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
(setq display-buffer-alist
      '(("\\*compilation\\*"
         (display-buffer-reuse-window display-buffer-same-window))))

;; languages and major modes
(mapcar #'my--load-file-from-home
        '("langs/typescript.el"
          "langs/elisp.el"
          ;; "langs/ada.el"
          "langs/c.el"
          "langs/cpp.el"
          ;; "langs/clisp.el"
          ;; "langs/clojure.el"
          ;; "langs/elixir.el"
          "langs/gdscript.el"
          ;; "langs/scheme.el"
          "langs/javascript.el"
          "langs/lua.el"
          "langs/org.el"
          "langs/rust.el"
          "langs/python.el"
          ;; "langs/scala.el"
          ;; "langs/sml.el"
          ;; "langs/svelte.el"
          "langs/zig.el"
          "langs/cmake.el"
          ;; "langs/carp.el"
          ;; "langs/nix.el"
          "langs/janet.el"))

;; start with messages buffer
;; (setq initial-buffer-choice
;;       (lambda ()
;;         (get-buffer "*Messages*")))

(my--load-file-from-home "tree.el")

(my--load-file-from-home "themes.el")

(add-to-list 'default-frame-alist '(height . 48))
(add-to-list 'default-frame-alist '(width . 120))

(defun my-compile-at-project-root ()
  "Run compile command at the project root containing a Makefile."
  (interactive)
  (let ((root (locate-dominating-file default-directory ".dir-locals.el")))
    (if root
        (let ((default-directory root))
          (compile compile-command))
      (compile compile-command))))
