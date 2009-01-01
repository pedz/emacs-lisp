
(setq old-load-path load-path
      inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d")
(require 'add-paths)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "red" "green" "yellow" "blue" "magenta" "darkturquoise" "white"])
 '(case-fold-search nil)
 '(display-time-mail-file (quote none))
 '(ecb-options-version "2.33beta1")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-source-path (quote (("/" "/") (#("/Users/pedz/rails-projects/rcm" 0 30 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "rcm"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup (quote ("Please_add_wget_to_your_path_or_set_the_fullpath_to_wget" . other)))
 '(inhibit-splash-screen t)
 '(mmm-submode-decoration-level 2)
 '(rails-ws:default-server-type "webrick")
 '(shell-prompt-pattern ".+@.+<[0-9]+> on .*
" t)
 '(tool-bar-mode nil)
 '(user-full-name "Perry Smith")
 '(vc-ignore-dir-regexp "\\`\\([\\/][\\/]\\|/\\.\\.\\./\\|/net/\\|/afs/\\)\\'"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:background "DarkRed"))))
 '(flymake-warnline ((((class color)) (:background "DarkOrange"))))
 '(mmm-code-submode-face ((t (:foreground "Plum"))))
 '(mmm-comment-submode-face ((t (:foreground "Plum" :slant italic))))
 '(mmm-output-submode-face ((t (:foreground "Plum" :underline t)))))

;; The wisent-ruby stuff uses word-at-point and part of emacs-rails uses it too
(autoload 'word-at-point "thingatpt")

;; (require 'cedet-setup)
;; (require 'ecb-setup)
(require 'ruby-setup)
(require 'rails-setup)

;; These load as a result of rails mode...
;; (require 'flyspell)
;; (require 'align)
;; (require 'find-recursive)
;; (require 'snippet-setup)

(require 'nxml-setup)
(require 'mmm-setup)
(require 'css-setup)
(require 'javascript-setup)
;; (require 'wisent-setup)

(require 'pedz)
