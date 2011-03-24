
(defvar old-load-path load-path
  "Saved value of load-path at startup")

(defun print-load-path ()
  "Used to debug load-path issues.  Prints the entire list into the
current buffer which is assumed to be *scratch*"
  (interactive)
  (let ((temp load-path))
    (while temp
      (insert (format "%s\n" (car temp)))
      (setq temp (cdr temp)))))

;; Add to load path so we can find add-paths
(add-to-list 'load-path "~/.emacs.d")
(require 'add-paths)
;; Now add paths to all the directories in site-lisp and here
(if (file-directory-p "/usr/local/share/emacs/site-lisp")
    (recursively-add-dir-to-load-path "/usr/local/share/emacs/site-lisp"))
(recursively-add-dir-to-load-path (expand-file-name "~/.emacs.d"))

;; Set by emacs' customizing routines -- don't change directly
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ansi-color-for-comint-mode t)
 '(ansi-color-names-vector ["black" "red" "green" "yellow" "blue" "magenta" "darkturquoise" "white"])
 '(case-fold-search nil)
 '(display-time-mail-file (quote none))
 '(ecb-options-version "2.33beta1")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-source-path (quote (("/" "/") (#("/Users/pedz/rails-projects/rcm" 0 30 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "rcm"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup (quote ("Please_add_wget_to_your_path_or_set_the_fullpath_to_wget" . other)))
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(mmm-submode-decoration-level 2)
 '(mumamo-chunk-coloring 1 nil nil "let most of the page be uncolored and color only the sub-chunks")
 '(ns-alternate-modifier (quote super))
 '(ns-command-modifier (quote meta))
 '(nxhtml-skip-welcome nil nil nil "Shh!!!")
 '(rails-ws:default-server-type "webrick")
 '(rng-nxml-auto-validate-flag t nil nil "Validate all the time")
 '(rng-schema-locating-files (quote ("/Users/pedzan/.emacs.d/schemas.xml" "schemas.xml" "/Applications/Emacs.app/Contents/Resources/etc/schema/schemas.xml" "/Users/pedzan/.emacs.d/rnc/html5/html5-schemas.xml")))
 '(save-abbrevs nil)
 '(shell-prompt-pattern ".+@.+<[0-9]+> on .*
")
 '(split-width-threshold 1600)
 '(tool-bar-mode nil)
 '(user-full-name "Perry Smith")
 '(vc-ignore-dir-regexp "\\`\\([\\/][\\/]\\|/\\.\\.\\./\\|/net/\\|/afs/\\)\\'"))

;; Ditto from above -- don't change by hand.
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

;; Pull in nxhtml
(require 'nxhtml-setup)

;; (require 'cedet-setup)
;; (require 'ecb-setup)
(require 'ruby-setup)
;;(require 'rails-setup)

;; These load as a result of rails mode...
;; (require 'flyspell)
;; (require 'align)
;; (require 'find-recursive)
;; (require 'snippet-setup)

;; nxml is now part of the standard distribution.  Probably this set
;; up needs to go away.
;; (require 'nxml-setup)

;; Probably will change with next update of emacs but currently need
;; to point to js.el
(require 'javascript-setup)

;; Part of the html5 setup to load the html5 schema.
;; (require 'whattf-dt)
(add-hook 'nxml-mode-hook 
	  (function (lambda()
		      (require 'whattf-dt)
		      )))

;; (require 'wisent-setup)
(if (or (eq window-system 'mac)
	(eq window-system 'ns))
    (require 'mac-setup))
(require 'pedz)
;; This gets loaded because of ido at the first find file so lets just
;; load it now and get it over with.
(require 'tramp)
