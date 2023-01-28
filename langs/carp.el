(use-package clojure-mode
  :ensure t
  :defer t)

(add-hook 'clojure-mode-hook 'company-mode)
(add-hook 'clojure-mode-hook 'show-paren-mode)
(add-hook 'clojure-mode-hook 'electric-pair-mode)
(add-hook 'clojure-mode-hook 'auto-highlight-symbol-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(my--load-file-from-home "langs/carp/carp-flycheck.el")
(my--load-file-from-home "langs/carp/inf-carp-mode.el")
(my--load-file-from-home "langs/carp/carp-mode.el")
(require 'carp-mode)
(require 'inf-carp-mode)

(add-to-list 'auto-mode-alist '("\\.carp\\'" . carp-mode))
