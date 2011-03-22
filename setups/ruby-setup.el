;;; Now using GNU Emacs 23.2 which ships ruby mode but rinari uses its
;;; own (slightly newer) ruby.el.


;; ;; Suggestions from inf-ruby
;; (autoload 'ruby-mode "ruby-mode"
;;   "Mode for editing ruby source files" t)


;; (setq auto-mode-alist
;;       (append '(("\\.rb$" . my-ruby-mode)) auto-mode-alist))
;; (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
;; 				     interpreter-mode-alist))

;; (autoload 'run-ruby "inf-ruby"
;;   "Run an inferior Ruby process")
;; (autoload 'inf-ruby-keys "inf-ruby"
;;   "Set local key defs for inf-ruby in ruby-mode")
;; (add-hook 'ruby-mode-hook
;; 	  '(lambda ()
;; 	     (inf-ruby-keys)
;; 	     ))

;; ;; Setup to autoload rdebug
;; (autoload 'rdebug "rdebug"
;;   "Run rdebug on program FILE in buffer *gud-FILE*.
;; The directory containing FILE becomes the initial working directory
;; and source-file directory for your debugger." t)

;; Setup to autoload ruby-electric
(autoload 'ruby-electric-mode "ruby-electric"
  "Toggle Ruby Electric minor mode.
With no argument, this command toggles the mode.  Non-null prefix
argument turns on the mode.  Null prefix argument turns off the
mode.

When Ruby Electric mode is enabled, an indented 'end' is
heuristicaly inserted whenever typing a word like 'module',
'class', 'def', 'if', 'unless', 'case', 'until', 'for', 'begin',
'do'. Simple, double and back quotes as well as braces are paired
auto-magically. Expansion does not occur inside comments and
strings. Note that you must have Font Lock enabled." t)

;; ;; setup to autoload ruby-style
;; (autoload 'ruby-style-c-mode "ruby-style"
;;   "C/C++ mode style for Ruby." t)

;; YARI everywhere!
(define-key help-map "r" 'yari)

;; Turn on ruby-electric-mode
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook (function
			      (lambda ()
				(ruby-electric-mode t)))))

(provide 'ruby-setup)
