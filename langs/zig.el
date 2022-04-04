(use-package zig-mode
  :ensure t
  :defer t
  :config
  (progn
    (add-hook 'zig-mode-hook #'electric-pair-mode)
    (add-hook 'zig-mode-hook #'rainbow-delimiters-mode)
    (add-hook 'zig-mode-hook #'company-mode))
  :general
  (:keymaps 'zig-mode-map
            :prefix "SPC"
            :states '(normal visual)
            "cb" '(zig-compile :which-key "zig compile")
            "cf" '(zig-format-buffer :which-key "zig format buffer")
            "ct" '(zig-test-buffer :which-key "zig test buffer")
            "cp" '(zig-toggle-format-on-save :which-key "zig toggle format on save")
            "cr" '(zig-run :which-key "zig run")))
