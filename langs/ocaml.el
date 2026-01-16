(add-to-list 'load-path "~/.opam/default/share/emacs/site-lisp")
(require 'ocp-indent)

(use-package tuareg
  :ensure t
  :defer t
  :mode (("\\.ocamlinit\\'" . tuareg-mode))
  :config
  (progn
    (add-hook 'tuareg-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'tuareg-mode-hook #'company-mode)
    (add-hook 'tuareg-mode-hook #'electric-pair-mode)))

(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure))
