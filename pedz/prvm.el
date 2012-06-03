;;
;; Simple routines to help use prvm
;;

;;;###autoload
(defun delete-path-elements (regexp)
  "Deletes elements matching REGEXP from the user's PATH
environment variable as well as exec-path"
  (save-match-data
    (let ((match-func (function (lambda (path)
				  (if (string-match regexp path)
				      nil
				    path)))))
      ;; Set new PATH environment variable to...
      (setenv "PATH"
	      ;; the concatination of the elements separated by ":" of ...
	      (mapconcat
	       ;; all of the elements that remain after the delq which ...
	       (function (lambda (x) x))
	       ;; deletes the nil elements which are ...
	       (delq nil
		     ;; mappings of each car to either nil if it matches
		     ;; the regular expression else or itself if it does not...
		     (mapcar
		      match-func
		      ;; starting from the PATH environment variable split by ":"
		      (split-string (getenv "PATH") ":")))
	       ":"))
      (setq exec-path
	    ;; deletes the nil elements which are ...
	    (delq nil
		  ;; mappings of each car to either nil if it matches
		  ;; the regular expression else or itself if it does not...
		  (mapcar match-func exec-path))))))

;;;###autoload
(defun prepend-path (path)
  "Prepends PATH to the user's PATH environment variable as well
as exec-path"
  (save-match-data
    ; Get PATH environment variable and see if the first path is dot
    (let* ((temp (getenv "PATH"))
	   (had-leading-dot (string-match "^\\.:" temp)))
      ; If first path element is dot, then remove it
      (if had-leading-dot
	  (setq temp (replace-match "" nil nil temp)))
      ; prepend new path element to front
      (setq temp (concat path ":" temp))
      ; if first path element was dot (before), then add it back on
      (if had-leading-dot
	  (setq temp (concat ".:" temp)))
      ; set this as the new PATH environment variable
      (setenv "PATH" temp)))
  (setq exec-path (if (string-equal (car exec-path) ".")
		      (cons "." (cons path (cdr exec-path)))
		    (cons path (cdr exec-path)))))

;;;###autoload
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

;;;###autoload
(defun prvm-activate ()
  (interactive)
  (let ((prvmrc (find-prvmrc)))
    (if (null prvmrc)
	(message "No .prvmrc file found")
      (with-temp-buffer
	(insert-file-contents prvmrc)
	(while (< (point) (point-max))
	  (narrow-to-region (point-at-bol) (point-at-eol))
	  (prvm-parse-line (buffer-string))
	  (widen)
	  (beginning-of-line 2))))))

;;;###autoload
(defun prvm-parse-line (string)
  (save-match-data
    (when (string-match "^[[:blank:]]*delete-path-elements[[:blank:]]+['\"]?\\([^'\"]*\\)['\"]?$" string)
      (message (concat "deleting-path-elements " (match-string 1 string)))
      (delete-path-elements (match-string 1 string)))
    (when (string-match "^[[:blank:]]*prepend-path[[:blank:]]+['\"]?\\([^'\"]*\\)['\"]?$" string)
      (message (concat "prepend-path " (match-string 1 string)))
      (prepend-path (match-string 1 string)))))
