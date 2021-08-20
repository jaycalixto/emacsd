(use-package org
  :ensure t
  :defer t
  :general
  (:keymaps 'org-mode-map
            :prefix "SPC"
            :states '(normal visual)
            "ch" '(org-insert-heading :which-key "org insert heading")
            "ct" '(org-todo :which-key "org TODO")
            "c'" '(org-edit-special :which-key "org edit special")
            "c." '(org-time-stamp :which-key "org timestamp")))
