(defun process-complete ( process state )
  "Look for process to enter the exit state and then clean up its
buffer and delete it from the process table"
  (if (null (string= state "finished\n"))
      (insert state)
    (set-buffer (process-buffer process))
    (goto-char (point-min))
    (not-modified)
    (setq case-fold-search t)
    (setq buffer-read-only t)))

(defun async-call-process ( program infile buffer display &rest args )
  (let* ((buf (if (eq buffer t)
		  (current-buffer)
		buffer))
	 (proc (apply 'start-process program buf program args )))
    (set-process-sentinel proc 'process-complete)
    (if buf
	(pop-to-buffer buf))))
