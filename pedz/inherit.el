;;;
;;; Inherited variable functions and fun-ness
;;;
(defvar inherited-alist nil
  "List of variables kepted which are inherited from a \"parent\" buffer")

;;;###autoload
(defun make-variable-buffer-inherited ( a )
  "Make symbol A be inherited -- this implies that it is buffer local"
  (make-variable-buffer-local a)
  (setq inherited-alist (cons a inherited-alist)))

;;;###autoload
(defun inherit-from-buffer ( buf )
  "Set all inherited variables of current buffer to those values of BUF"
  (interactive "bBuffer: ")
  (let ((curbuf (current-buffer))
	set-list)
    (set-buffer buf)
    (setq set-list
	  (mapcar '(lambda ( v )
		     (cons v (symbol-value v)))
		  inherited-alist))
    (set-buffer curbuf)
    (mapcar '(lambda ( c )
	       (set (car c) (cdr c)))
	    set-list)))

;;;###autoload
(defun setup-inheritance ()
  "Sets up inheritance from the buffer that we are currently doing a find file from"
  (if (boundp 'buffer-to-inherit-from)
      (inherit-from-buffer buffer-to-inherit-from)))

;;;###autoload
(defun kill-inherited-variables ()
  "Sets all inherited variables to nil"
  (interactive)
  (mapcar '(lambda ( v ) (set v nil)) inherited-alist))

(add-to-list 'find-file-hook 'setup-inheritance)

(provide 'inherit)
