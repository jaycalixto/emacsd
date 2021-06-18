(use-package rjsx-mode
  :defer t
  :ensure t
  :config
  (progn
    (setq-default js-indent-level 4)
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 4)
    (setq indent-line-function 'insert-tab)))
