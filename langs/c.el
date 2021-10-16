(use-package cc-mode
  :ensure t
  :defer t
  :config
  (progn
    (require 'semantic)
    (global-semanticdb-minor-mode 1)
    (global-semantic-idle-scheduler-mode 1)
    (add-hook 'c-mode-hook #'semantic-mode)
    (add-hook 'c-mode-hook #'electric-pair-mode)
    (add-hook 'c-mode-hook #'company-mode)
    (add-hook 'c-mode-hook
              (lambda() (setq-local company-backends
                                    '(company-semantic
                                      company-dabbrev-code
                                      company-keywords
                                      company-files
                                      company-dabbrev))))
    (setq c-basic-offset 4)
    (setq c-default-style '((java-mode . "java")
                            (awk-mode . "awk")
                            (other . "linux")))))

(use-package cmake-mode
  :ensure t
  :defer t)
