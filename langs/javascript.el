;; (defun my/disable-js-flycheck-checkers ()
;;   (progn
;;     ;; disable jshint to use eslint
;;     (setq-default flycheck-disabled-checkers
;; 		  (append flycheck-disabled-checkers
;; 			  '(javascript-jshint)))
;;     ;; disable json-jsonlist checking for json files
;;     (setq-default flycheck-disabled-checkers
;; 		  (append flycheck-disabled-checkers
;; 			  '(json-jsonlist)))))

;; (add-hook 'flycheck-mode-hook #'my/disable-js-flycheck-checkers)

;; (use-package js2-mode
;;   :ensure t
;;   :defer t)

;; (use-package json-mode
;;   :ensure t
;;   :defer t)

(use-package css-mode
  :ensure t
  :defer t
  :config
  (company-mode))

(use-package web-mode
  :ensure t
  :defer t
  :init
  (setq-default indent-tabs-mode nil)
  :config
  (company-mode))
  ;; :after 'flycheck)
  ;; :config
  ;; (progn
  ;;   (flycheck-add-mode 'javascript-eslint 'web-mode)))
  ;;   ;; (setq web-mode-markup-indent-offset 4)
    ;; (setq web-mode-css-indent-offset 4)
    ;; (setq web-mode-code-indent-offset 4)))


(add-hook 'web-mode-hook #'flycheck-mode)

(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
;; (defun my/use-eslint-from-node-modules ()
;;   (let* ((root (locate-dominating-file
;; 		(or (buffer-file-name) default-directory)
;; 		"node_modules"))
;; 	 (eslint (and root
;; 		      (expand-file-name "node_modules/eslint/bin/eslint.js"
;; 					root))))
;;     (when (and eslint (file-executable-p eslint))
;;       (setq-local flycheck-javascript-eslint-executable eslint))))
;; (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; ;; for better jsx syntax-highlighting in web-mode
;; ;; - courtesy of Patrick @halbtuerke
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;; 	ad-do-it)
;;     ad-do-it))
