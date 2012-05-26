;;
;; Simple routines to help use prvm
;;

;;;###autoload
(defun delete-path-elements (regexp)
  "Deletes elements matching REGEXP from the user's PATH environment variable"
  ; Set new PATH environment variable to...
  (setenv "PATH"
	  ; the concatination of the elements separated by ":" of ...
	  (mapconcat
	   ; all of the elements that remain after the delq which ...
	   (function (lambda (x) x))
	   ; deletes the nil elements which are ...
	   (delq nil
		 ; mappings of each car to either nil if it matches
		 ; the regular expression else or itself if it does not...
		 (mapcar
		  (function (lambda (path)
			      (if (string-match regexp path)
				  nil
				path)))
		  ; starting from the PATH environment variable split by ":"
		  (split-string (getenv "PATH") ":")))
	   ":")))

;;;###autoload
(defun prepend-path (path)
  "Prepends PATH to the user's PATH environment variable"
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
      (setenv "PATH" temp))))
