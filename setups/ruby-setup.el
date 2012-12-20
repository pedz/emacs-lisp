;;; Now using GNU Emacs 23.2 which ships ruby mode but rinari uses its
;;; own (slightly newer) ruby.el.

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

;; YARI everywhere!
(define-key help-map "r" 'yari)

;; Turn on ruby-electric-mode
(eval-after-load 'ruby-mode
  '(add-hook 'ruby-mode-hook (function
			      (lambda ()
				(ruby-electric-mode t)))))

;; This boogers rgrep somehow and it doesn't seem to help anyway
;; (require 'rspec-mode)
(provide 'ruby-setup)
