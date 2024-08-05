(use-package py-autopep8
  :ensure t)

(defun py-autopep8-enable-on-save ()
  (add-hook 'before-save-hook 'py-autopep8-buffer nil t))

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

