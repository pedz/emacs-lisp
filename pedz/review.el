(defun review ( )
  "Blah blah blah"
  (interactive)
  (let* ((mark1 (progn (beginning-of-line 1) (point)))
	 (mark2 (progn (beginning-of-line 2) (point))))
    (goto-char mark1)
    (re-search-forward " *\(.*\)\.\([^.]*\) delta \(.*\)" mark2)
    (let* ((major (buffer-substring (match-beginning 2) (match-end 2)))
	   (minor (buffer-substring (match-beginning 1) (match-end 1)))
	   (path (buffer-substring (match-beginning 3) (match-end 3)))
	   (prev (int-to-string (1- (string-to-int minor)))))
      (delete-other-windows)
      (shell-command))))
