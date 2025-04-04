(defun my--open-init-el ()
  (interactive)
  (find-file user-init-file))

;; evil mode
(use-package evil
  :ensure t
  :init
  (progn
    (setq-default evil-overriding-maps
                  '((Buffer-menu-mode-map . nil)))
    (setq-default evil-undo-system 'undo-redo)
    (setq evil-want-C-u-scroll t))
  :config
  (progn
    (evil-mode 1)
    (evil-set-initial-state 'help-mode 'normal)
    (evil-set-initial-state 'compilation-mode 'normal)
    (evil-set-initial-state 'recentf-mode 'normal)
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t)
    (setq evil-want-keybinding nil)))

(defun buffer-files-menu ()
  (interactive)
  (buffer-menu t))

(defun general-define-standard-keys ()
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   ;; "/" '(counsel-rg :which-key "ripgrep") ; need counsel package
   "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
   "'" '(switch-to-next-buffer :which-key "next buffer")
   "SPC" '(execute-extended-command :which-key "M-x")
   ;; help
   "h" '(nil :which-key "help")
   "hv" '(describe-variable :which-key "describe variable")
   "hf" '(describe-function :which-key "describe function")
   "hk" '(describe-key :which-key "describe key")
   ;; Buffers
   "b" '(nil :which-key "buffers")
   "bl" '(ido-switch-buffer :which-key "switch buffer")
   "bd" '(kill-current-buffer :which-key "kill buffer")
   "bn" '(evil-next-buffer :which-key "next buffer")
   "bp" '(evil-prev-buffer :which-key "previous buffer")
   "bb" '(list-buffers :which-key "list buffers")
   "bm" '(buffer-menu :which-key "buffer menu")
   "bf" '(buffer-files-menu :which-key "buffer menu visiting files")
   ;; Frames
   "r" '(nil :which-key "frames")
   "rc" '(make-frame :which-key "new frame")
   "rd" '(delete-frame :which-key "delete frame")
   "rn" '(other-frame :which-key "next frame")
   "rf" '(next-multiframe-window :which-key "next multiframe window")
   ;; Window
   "w" '(nil :which-key "window")
   "wf" '(other-frame :which-key "other frame")
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
   "qq" '(save-buffers-kill-terminal :which-key "kill emacs")
   ;; emacs
   "e" '(nil :which-key "emacs")
   "ep" '(list-packages :which-key "list packages")
   "er" '(restart-emacs :which-key "restart emacs")
   ;; File
   "f" '(nil :which-key "files")
   "ff" '(my--open-init-el :which-key "open init.el")
   "fl" '(load-file :which-key "load file")
   "fo" '(ido-find-file :which-key "find files")
   "fr" '(recentf-open-files :which-key "open recent files")
   ;;flycheck
   "!" '(nil :which-key "flycheck")
   "!l" '(flycheck-list-errors :which-key "list errors")
   ;; misc
   "=" '(nil :which-key "misc commands")
   "==" '(whitespace-mode :which-key "toggle whitespace mode")
   "[" '(imenu-list-smart-toggle :which-key "toggle imenu list")
   ;; emacs
   "xf" '(find-file :which-key "find file")
   "xb" '(switch-to-buffer :which-key "switch to buffer")))

(defun general-define-buffer-list-keys ()
  (general-define-key
   :states 'normal
   :keymaps 'Buffer-menu-mode-map
   "RET" '(Buffer-menu-this-window :which-key "buffer menu this window")))

;; General
(use-package general
  :ensure t
  :after evil
  :config
  (progn
    (general-define-standard-keys)))

(global-set-key (kbd "C-;") 'comment-line)

(defun general-define-package-mode-keys ()
  (general-define-key
   :states '(normal visual)
   :keymaps 'package-menu-mode-map
   :prefix "SPC"
   "c" '(nil :which-key "package menu major mode")
   "cu" '(package-menu-mark-upgrades :which-key "mark upgrades")
   "cx" '(package-menu-execute :which-key "execute marked action")))

(add-hook 'package-menu-mode-hook #'general-define-package-mode-keys)

