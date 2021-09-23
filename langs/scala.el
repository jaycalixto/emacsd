(use-package scala-mode
  :defer t
  :ensure t
  :interpreter ("scala" . scala-mode)
  :config
  (progn
    (add-hook 'scala-mode-hook #'flycheck-mode)
    (add-hook 'scala-mode-hook #'company-mode)
    (add-hook 'scala-mode-hook #'lsp)
    (add-hook 'scala-mode-hook #'lsp-lens-mode)))

(use-package sbt-mode
  :ensure t
  :defer t
  :commands sbt-start sbt-command
  :config
  ;; allows using Space in minibuffer
  (substitute-key-definition 'minibuffer-complete-word 'self-insert-command minibuffer-local-completion-map)
  ;; sbt-supershell kills sbt-mode
  (setq sbt:program-options '("-Dsbt.supershell=false")))

(use-package lsp-metals
  :ensure t
  :defer t)
