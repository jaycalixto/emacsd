(defun my--open-init-el ()
  (interactive)
  (find-file user-init-file))

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

;; general
(use-package general
  :ensure t
  :after evil
  :config
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
   "bd" '(kill-this-buffer :which-key "kill buffer")
   "bn" '(evil-next-buffer :which-key "next buffer")
   "bp" '(evil-prev-buffer :which-key "previous buffer")
   "bb" '(list-buffers :which-key "list buffers")
   ;; Frames
   ;; "r" '(nil :which-key "frames")
   ;; "rc" '(make-frame :which-key "new frame")
   ;; "rd" '(delete-frame :which-key "delete frame")
   ;; "rn" '(other-frame :which-key "next frame")
   ;; "rf" '(next-multiframe-window :which-key "next multiframe window")
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
   "qq" '(save-buffers-kill-terminal :which-key "kill emacs")
   ;; File
   "f" '(nil :which-key "files")
   "ff" '(my--open-init-el :which-key "open init.el")
   "fl" '(load-file :which-key "load file")
   "fo" '(ido-find-file :which-key "find files")
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

(global-set-key (kbd "C-;") 'comment-line)
