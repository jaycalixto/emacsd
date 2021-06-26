;;; blu-light.el --- Tango-based custom theme for faces  -*- lexical-binding:t -*-

;; colors by https://github.com/uloco/theme-bluloco-light

;; Copyright (C) 2021

;; Author: Jayme Calixto <>

(deftheme blu-light
  "My custom light theme.")

(let* ((class '((class color) (min-colors 89)))
       (col00 "#F9F9F9") ;; background
       (col01 "#383A42") ;; foreground
       (col02 "#A0A1A7") ;; comment
       (col03 "#0098DD") ;; keyword
       (col04 "#23974A") ;; function/method
       (col05 "#A04A48") ;; property
       (col06 "#C5A332") ;; string
       (col07 "#CE33C0") ;; number
       (col08 "#823FF1") ;; constant
       (col09 "#275FE4") ;; markup tag
       (col10 "#DF631C") ;; markup attribute
       (col11 "#D52753") ;; class/type/interface
       (col12 "#7A82DA") ;; operator/punctuation

       (bkg col00)
       (black col01)
       (blu "#0099E1")
       (red "#FF0000")
       (bkg-light "#F1F1F1")
       (bkg-mid "#E8E8E8"))

  (custom-theme-set-faces
   'blu-light
   `(cursor ((,class (:background ,black))))
   `(border-color ((,class (:background ,red))))
   `(default ((,class (:background ,bkg :foreground ,black))))
   `(fringe ((,class (:background ,bkg))))

   ;; mode-line
   `(mode-line
     ((,class
       (:foreground ,black :background ,bkg-mid :overline ,blu :box nil))))
   `(mode-line-inactive
     ((,class (:background ,bkg :foreground "#D5D7D8" :box ,bkg-mid))))
   `(mode-line-buffer-id ((,class (:foreground unspecified :bold t))))

   `(header-line ((,class (:foreground ,bkg-mid :background ,black))))

   `(minibuffer-prompt
     ((,class (:foreground ,black :bold t))))
   `(region ((,class (:foreground unspecified :background "#D2ECFF"))))
   `(dired-header
     ((,class (:bold t :foreground "#275FE4"))))
   `(widget-button ((,class (:bold t :foreground "#0084C8"))))

   `(success ((,class (:bold t :foreground "#4E9A06"))))
   `(warning ((,class (:foreground "#CE5C00"))))
   `(error ((,class (:foreground "#FF0000"))))

   `(font-lock-builtin-face ((,class (:foreground "#23974A" :bold t))))
   `(font-lock-constant-face ((,class (:foreground "#823FF1"))))
   `(font-lock-comment-face ((,class (:foreground "#A0A1A7" :bold nil :italic t))))
   `(font-lock-function-name-face ((,class (:foreground "#0000FF" :bold t))))
   `(font-lock-keyword-face ((,class (:bold t :foreground "#0098DD"))))
   `(font-lock-string-face ((,class (:foreground "#C5A332"))))
   `(font-lock-type-face ((,class (:foreground "#D52753" :bold nil))))
   `(font-lock-variable-name-face ((,class (:foreground "#FF0000" :bold t))))
   `(font-lock-warning-face ((,class (:foreground "#DF631C" :bold t))))
   
   ;; whitespace
   `(whitespace-space ((,class (:background nil :foreground "#D5D7D8"))))
   `(whitespace-newline ((,class (:background  nil :foreground "#D5D7D8"))))
   `(whitespace-tab ((,class (:background nil :foreground "#D5D7D8"))))
   `(whitespace-trailing
     ((,class (:background nil :foreground "#D5D7D8"))))
   `(whitespace-line ;; fontlock for lines > 80 chars
     ((,class (:background "#D5D7D8" :foreground unspecified))))

   `(link ((,class (:underline t :foreground "#0066CC"))))
   `(link-visited ((,class (:underline t :foreground "#6799CC"))))
   `(highlight ((,class (:foreground "white" :background "#4A90D9"))))
   `(isearch ((,class (:foreground "white" :background "#77A4DD"))))

   `(erc-action-face ((,class (:foreground "#F5666D"))))
   `(erc-button ((,class (:foreground "#A8799C"))))
   `(erc-current-nick-face ((,class (:bold t :foreground "#FF7092"))))
   `(erc-error-face ((,class (:foreground "#F5666D" :bold t))))
   `(erc-input-face ((,class (:foreground "black"))))
   `(erc-keyword-face ((,class (:foreground "#F5666D"))))
   `(erc-my-nick-face ((,class (:bold t :foreground "#FF8CA7"))))
   `(erc-nick-default-face ((,class (:bold t :foreground "#0084C8"))))
   `(erc-notice-face ((,class (:foreground "#0084C8"))))
   `(erc-prompt-face ((,class (:foreground "black"))))
   `(erc-timestamp-face ((,class (:foreground ,"#4CB64A"))))

   `(magit-log-sha1 ((,class (:foreground "#FF7092"))))
   `(magit-log-head-label-local ((,class (:foreground "#4F78B5"))))
   `(magit-log-head-label-remote ((,class (:foreground ,"#4CB64A"))))
   `(magit-branch ((,class (:bold t :foreground "#0084C8"))))
   `(magit-section-title ((,class (:bold t :foreground "#00578E"))))
   `(magit-item-highlight ((,class (:background "#FEFFBF"))))
   `(magit-diff-add ((,class (:bold t :foreground "#4CB64A"))))
   `(magit-diff-del ((,class (:bold nil :foreground "#F5666D"))))

   `(gnus-group-mail-1-empty ((,class (:foreground "#00578E"))))
   `(gnus-group-mail-1 ((,class (:bold t :foreground "#4F78B5"))))
   `(gnus-group-mail-3-empty ((,class (:foreground "#00578E"))))
   `(gnus-group-mail-3 ((,class (:bold t :foreground "#9CBB43"))))
   `(gnus-group-news-3-empty ((,class (:foreground "#00578E"))))
   `(gnus-group-news-3 ((,class (:bold t :foreground "#9CBB43"))))
   `(gnus-header-name ((,class (:bold t :foreground "#0084C8"))))
   `(gnus-header-subject ((,class (:bold t :foreground "#FF7092"))))
   `(gnus-header-content ((,class (:foreground "#FF7092"))))
   `(gnus-button ((,class (:bold t :foreground "#00578E"))))
   `(gnus-cite-1 ((,class (:foreground "#00578E"))))
   `(gnus-cite-2 ((,class (:foreground "#0084C8"))))

   `(diff-added ((,class (:bold t :foreground "#4E9A06"))))
   `(diff-removed ((,class (:bold t :foreground "#F5666D"))))

   ;; company
   `(company-tooltip ((,class (:background ,bkg-light :foreground ,black))))
   `(company-tooltip-selection ((,class (:background ,blu :foreground ,bkg))))
   ))

(provide-theme 'blu-light)

;;; blu-light.el  ends here
