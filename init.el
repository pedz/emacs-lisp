
(setq old-load-path load-path
      inhibit-startup-message t)

(add-to-list 'load-path "~/.emacs.d")
(require 'add-paths)

;; Enable this if you develop in semantic, or develop grammars
;; (semantic-load-enable-semantic-debugging-helpers)

;; '(ecb-process-non-semantic-files nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["black" "red" "green" "yellow" "blue" "magenta" "darkturquoise" "white"])
 '(case-fold-search nil)
 '(ecb-options-version "2.33beta1")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-source-path (quote (("/" "/") (#("/Users/pedz/rails-projects/rcm" 0 30 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "rcm"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup (quote ("Please_add_wget_to_your_path_or_set_the_fullpath_to_wget" . other)))
 '(inhibit-splash-screen t)
 '(mmm-submode-decoration-level 2)
 '(shell-prompt-pattern ".+@.+<[0-9]+> on .*
")
 '(tool-bar-mode nil)
 '(user-full-name "Perry Smith")
 '(vc-ignore-dir-regexp "\\`\\([\\/][\\/]\\|/\\.\\.\\./\\|/net/\\|/afs/\\)\\'"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(mmm-code-submode-face ((t (:foreground "Plum"))))
 '(mmm-comment-submode-face ((t (:foreground "Plum" :slant italic))))
 '(mmm-output-submode-face ((t (:foreground "Plum" :underline t)))))

(require 'flyspell)
(require 'align)
;; (require 'cedet-setup)
;; (require 'ecb-setup)
(require 'nxml-setup)
(require 'mmm-setup)
(require 'find-recursive)
(require 'snippet-setup)
(require 'ruby-setup)
(require 'rails-setup)
(require 'css-setup)
;; (require 'wisent-setup)
(require 'pedz)
