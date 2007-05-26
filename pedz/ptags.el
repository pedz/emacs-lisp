;;;; In many of my functions, I require a call which determines the
;;;; default system much like tags does.  I use a function from etags
;;;; to do this as well as creating another function which does the
;;;; same thing for non-interactive use.  At some point, I would like
;;;; to amend these functions with a way to modify the syntax table
;;;; temporarily so that the defaults could be better controlled.

(require 'etags)

;;;###autoload
(defun get-symbol-interactively ( prompt )
  "Used by cscope and others to get a symbol in a tags style interface
and allow for interactive confirmation or changes"
  (let ((current-prefix-arg nil))
    (list (find-tag-tag prompt))))

;;;###autoload
(defun get-symbol-non-interactively ()
  "Used by cscope and others to get a symbol under the cursor.  Uses
the same mechanism for the default as get-symbol-interactively"
  (funcall (or find-tag-default-function
	       (get major-mode 'find-tag-default-function)
	       'find-tag-default)))

;;;###autoload
(defun x-find-tag ( click )
  "Find function via TAGS that mouse is pointing at"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (find-tag (get-symbol-non-interactively)))

(global-set-key [C-S-mouse-3] 'x-find-tag)

(provide 'ptags)
