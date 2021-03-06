;; Nifty for debugging
;; (defadvice load (before load-log activate)
;;   (message "Loading %s" (ad-get-arg 0)))
;; (defadvice require (before load-log activate)
;;   (message "Requiring %s" (ad-get-arg 0)))

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
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(require 'add-paths)

;; Now add paths to all the directories in site-lisp and here
(if (file-directory-p "/usr/local/share/emacs/site-lisp")
    (recursively-add-dir-to-load-path "/usr/local/share/emacs/site-lisp"))
(recursively-add-dir-to-load-path (expand-file-name "~/.emacs.d"))

;; put the elc directory at the front
(setq load-path (remove (expand-file-name "~/.emacs.d/elc") load-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elc"))

;; Ok.  Now lets set up the packages.
(require 'package-setup)

;; Set by emacs' customizing routines -- don't change directly
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-for-comint-mode t)
 '(ansi-color-names-vector ["black" "red" "green" "gold" "blue" "magenta" "darkturquoise" "dark green"])
 '(case-fold-search nil)
 '(display-buffer-reuse-frames t)
 '(display-time-mail-file (quote none))
 '(ecb-options-version "2.33beta1")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-show-sources-in-directories-buffer (quote always))
 '(ecb-source-path (quote (("/" "/") (#("/Users/pedz/rails-projects/rcm" 0 30 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "rcm"))))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup (quote ("Please_add_wget_to_your_path_or_set_the_fullpath_to_wget" . other)))
 '(explicit-bash-args (quote ("--noediting" "--login" "-i")))
 '(ido-enable-tramp-completion nil)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(js2-global-externs (quote ("jQuery" "$")))
 '(js2-include-gears-externs nil)
 '(js2-include-rhino-externs nil)
 '(major-mode (quote text-mode))
 '(mmm-submode-decoration-level 2)
 '(mumamo-chunk-coloring 1 nil nil "let most of the page be uncolored and color only the sub-chunks")
 '(ns-alternate-modifier (quote super))
 '(ns-command-modifier (quote meta))
 '(nxhtml-skip-welcome nil nil nil "Shh!!!")
 '(rails-ws:default-server-type "webrick")
 '(rng-nxml-auto-validate-flag t nil nil "Validate all the time")
 '(rng-schema-locating-files (quote ("/Users/pedzan/.emacs.d/schemas.xml" "schemas.xml" "/Applications/Emacs.app/Contents/Resources/etc/schema/schemas.xml" "/Users/pedzan/.emacs.d/rnc/html5/html5-schemas.xml")))
 '(rspec-use-bundler-when-possible nil)
 '(rspec-use-rake-flag nil)
 '(save-abbrevs nil)
 '(shell-prompt-pattern ".+@.+<[0-9]+> on .*
")
 '(split-width-threshold 1600)
 '(tool-bar-mode nil)
 '(user-full-name "Perry Smith")
 '(user-mail-address "pedz@easesoftware.com")
 '(vc-ignore-dir-regexp "\\`\\([\\/][\\/]\\|/\\.\\.\\./\\|/net/\\|/afs/\\)\\'")
 '(x-select-enable-primary t))

;; Ditto from above -- don't change by hand.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Monaco"))))
 '(flymake-errline ((((class color)) (:background "DarkRed"))))
 '(flymake-warnline ((((class color)) (:background "DarkOrange"))))
 '(mmm-code-submode-face ((t (:foreground "Plum"))))
 '(mmm-comment-submode-face ((t (:foreground "Plum" :slant italic))))
 '(mmm-output-submode-face ((t (:foreground "Plum" :underline t)))))

;; The wisent-ruby stuff uses word-at-point and part of emacs-rails uses it too
(autoload 'word-at-point "thingatpt")

(require 'pedz)
(require 'ruby-setup)
(require 'rails-setup)
(require 'javascript-setup)

;; (require 'doxygen-setup)

;; Part of the html5 setup to load the html5 schema.
;; (require 'whattf-dt)

;; (require 'wisent-setup)
(if (or (eq window-system 'mac)
	(eq window-system 'ns))
    (require 'mac-setup))
;; This gets loaded because of ido at the first find file so lets just
;; load it now and get it over with.
(require 'tramp)

(require 'auto-complete-config)
(ac-config-default)

(require 'jquery-doc)
;; adds ac-source-jquery to the ac-sources list
(add-hook 'js2-mode-hook 'jquery-doc-setup)
