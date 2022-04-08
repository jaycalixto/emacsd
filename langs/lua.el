(use-package lua-mode
  :ensure t
  :defer t
  :config
  (progn
    (setq lua-indent-level 2)))

(add-to-list 'load-path "langs/love-minor-mode.el")

