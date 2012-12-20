;;
;; Simple routines to help use prvm
;;

(defvar prvm-env-list
  '(("GEM_HOME" . setenv)
    ("GEM_PATH" . setenv)
    ("PATH" . prvm-process-path))
  "This is a list of interesting environment variables that we want to
  pull up into emacs so it runs various commands correctly.")

(defun prvm-process-path ( name body )
  "Called for the `SHELL' environment variable so that exec-path may
  be set to match the value"
  (setenv name body)
  (setq exec-path (split-string body ":")))

(defun find-prvmrc (&optional dir)
  "Stolen from rinari-root"
  (or dir (setq dir default-directory))
  (let ((prvmrc (expand-file-name ".prvmrc" dir)))
    (if (file-exists-p prvmrc)
	prvmrc
      (let ((new-dir (expand-file-name (file-name-as-directory "..") dir)))
	;; regexp to match windows roots, tramp roots, or regular posix roots
	(unless (string-match "\\(^[[:alpha:]]:/$\\|^/[^\/]+:/?$\\|^/$\\)" dir)
	  (find-prvmrc new-dir))))))

(defun prvm-parse-line (string)
  "Called for each foo=dog environment string.  If a match is found in
  prvm-env-list, then the function in cdr is called"
  (save-match-data
    (string-match "^\\([^=]+\\)=\\(.*\\)" string)
    (let ((name (match-string 1 string))
	  (body (match-string 2 string)))
      (mapcar (lambda ( cell )
		(if (string-match-p (concat "^" (car cell) "$") name)
		    (apply (cdr cell) (list name body))))
	      prvm-env-list))))

;;;###autoload
(defun prvm-activate ()
  "Call this to find the .prvmrc file and set emacs's environment up
  to match"
  (interactive)
  (let ((prvmrc (find-prvmrc)))
    (if (null prvmrc)
	(message "No .prvmrc file found")
      (with-temp-buffer
	(call-process (getenv "SHELL") nil t nil "--login" "-c" (concat "source " prvmrc "; env"))
	(goto-char (point-min))
	(while (< (point) (point-max))
	  (narrow-to-region (point-at-bol) (point-at-eol))
	  (prvm-parse-line (buffer-string))
	  (widen)
	  (beginning-of-line 2))))))
