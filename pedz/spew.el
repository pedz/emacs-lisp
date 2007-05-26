;;
;; %W%
;;
;;
;; This was written by Perry Smith (a.k.a. pedz)
;;
;; This is a set of routines which uses the output of spew to do
;; basically the same things as spew except you don't have to leave
;; emacs (what a concept!)
;;
;; Recommended use
;;
;; Setup all the spew goodies
;;(autoload 'spew-find-symbol "spew"
;;	  "Find all references to SYMBOL"
;;	  t)
;;
;; bind the above functions to your favorite key sequence.
;;

(defvar spew-out-buffer nil
  "Buffer associated with the spew process")
(make-variable-buffer-inherited 'spew-out-buffer)

(defvar spew-start-time nil
  "Last modification time of spew.out file when spew was started")
(make-variable-buffer-local 'spew-start-time)

(defconst spew-program-name "spew"
  "Name of program to run for spew stuff")

(defconst spew-auto-go t
  "When only 1 spew entry is found, emacs automatically selects that
entry")

(defvar spew-process nil
  "Holds the process object for 'spew'")
(make-variable-buffer-inherited 'spew-process)

(defvar spew-file-vector nil
  "Holds the full path names for the files listed in the spew output")
(make-variable-buffer-local 'spew-file-vector)

(defvar spew-line-vector nil
  "Holds the line numbers for the lines listed in the spew output")
(make-variable-buffer-local 'spew-line-vector)

(defvar spew-mode-map nil "")

(if spew-mode-map
    ()
  (setq spew-mode-map (make-keymap))
  (define-key spew-mode-map "n" 'next-line)
  (define-key spew-mode-map " " 'next-line)
  (define-key spew-mode-map "p" 'previous-line)
  (define-key spew-mode-map "\177" 'previous-line)
  (define-key spew-mode-map "v" 'spew-view-from-list)
  (define-key spew-mode-map "q" 'delete-window)
  (define-key spew-mode-map "e" 'spew-goto-from-list)
  (define-key spew-mode-map [mouse-1] 'x-spew-goto-from-list-other-window)
  (define-key spew-mode-map [drag-mouse-1] 'nil)
  (define-key spew-mode-map [down-mouse-1] 'nil)
  (define-key spew-mode-map [mouse-2] 'x-spew-goto-from-list)
  (define-key spew-mode-map [mouse-3] 'x-spew-view-from-list)
  )

;;;###autoload
(defun spew-mode ()
  "Major mode used to look at the spew output stuff\n
Type:
  n to go to the next line
  Space to go to the next line
  p to go to the previous line
  Rubout to go to the previous line
  v to view the file and line
  q to delete the spew window
  e to edit the file at the line
"
  (use-local-map spew-mode-map)
  (setq truncate-lines t)
  (setq buffer-read-only t)
  (setq major-mode 'spew-mode)
  (setq mode-name "Spew"))

;;;###autoload
(defun spew-find-symbol ( string )
  "Find all references to the symbol"
  (interactive (get-symbol-interactively "Find symbol: "))
  (spew-find-goodies (concat string "\n")))


;;;###autoload
(defun spew-get-line-number ()
  "Returns the \"line number\" out of a spew output buffer"
  (end-of-line)
  (re-search-backward "^[ 0-9][ 0-9][0-9]")
  (1- (string-to-int (buffer-substring (match-beginning 0) (match-end 0)))))

;;;###autoload
(defun spew-goto-from-list ( arg )
  "Point is in a buffer pointing to a line produced by
spew-list-line. This routine plops into the file at the appropriate
spot"
  (interactive "P")
  (let* ((num (spew-get-line-number))
	 (fname (expand-file-name (aref spew-file-vector num)))
	 (lnum (aref spew-line-vector num))
	 (buf (if arg
		  (find-file-other-window fname)
		(find-file fname))))
    (goto-char (1+ lnum))
    buf))

;;;###autoload
(defun spew-view-from-list ()
  "Point is in a buffer pointing to a line produced by
spew-list-line. This routine plops into the file at the appropriate
spot"
  (interactive)
  (let* ((num (spew-get-line-number))
	 (fname (expand-file-name (aref spew-file-vector num)))
	 (lnum (aref spew-line-vector num)))
    (save-excursion
      (find-file fname)
      (goto-line lnum)
      (view-buffer (current-buffer)))))

;;;
;;; We are very carefull to reference only the spew-out-buffer
;;; variable from a normal C file.  We then switch to that buffer and
;;; use its values for spew-process and any other inherited
;;; variables.  If spew-out-buffer is nil or if the buffer does not
;;; exist, we assume we need to recrank a spew for this file.
;;; 

;;;###autoload
(defun spew-init-process ( )
  (condition-case dummy
      (set-buffer spew-out-buffer)
    (error
     (let* ((old-buf (current-buffer))
	    (dir-temp (expand-file-name
		       (read-file-name "Dir with spew file " nil
				       default-directory t)))
	    (full-name (concat dir-temp "SPEW"))
	    (buf-name (concat "spew: " (file-name-nondirectory
					(directory-file-name
					 dir-temp)))))
       ;;
       ;; We want to find a spew buffer if we already have a spew
       ;; started in this directory.  We set buffer-file-name equal to
       ;; the directory path with "SPEW" appended and use that to
       ;; search with.  We eventuall set the buffer name to a shorter
       ;; and nicer looking "spew: dir" where dir is the last
       ;; directory in the path
       ;;
       (if (setq spew-out-buffer (get-file-buffer full-name))
	   (set-buffer spew-out-buffer)
	 (set-buffer
	  (setq spew-out-buffer (create-file-buffer buf-name)))
	 (setq buffer-file-name full-name
	       default-directory dir-temp)
	 (inherit-from-buffer old-buf)
	 (setq spew-process nil)))))
  (pop-to-buffer spew-out-buffer)
  (let ((mod-time (nth 5 (file-attributes "spew.out")))
	(dead-proc (or (null spew-process)
		       (null (eq (process-status spew-process) 'run)))))
    (if (and (not dead-proc)
	     (not (equal spew-start-time mod-time)))
	(progn
	  (kill-process spew-process)
	  (setq dead-proc t)))
    (if dead-proc
	(progn
	  (if spew-process
	      (message "Restarting dead spew-process...")
	    (message "Starting new spew process..."))
	  (setq spew-process (start-process "spew" spew-out-buffer
					      spew-program-name "-"))
	  (setq spew-start-time mod-time))))
  (setq buffer-read-only nil)
  (erase-buffer))

;;;###autoload
(defun spew-wait ()
  "Waits for the spew process to finish"
  ;(message "Waiting for spew...")
  (while (and (eq (process-status spew-process) 'run)
	      (progn
		(goto-char (point-max))
		(beginning-of-line 0)
		(not (looking-at "--END--\n"))))
    (accept-process-output spew-process 1 0))
  (message "Spew is done"))

;;;###autoload
(defun spew-format ()
  "Formats the output of spew to be pretty"
  (let ((longest-file 0)
	(longest-line 0)
	(counter 0)
	pat return-value)
    (goto-char (point-max))
    (beginning-of-line 0)
    (kill-line 1)
    (goto-char (point-min))
    (while (re-search-forward "^\\([^ ]+\\) \\([^ ]+\\) \\(.*\\)" nil t)
      (let ((filename (file-name-nondirectory
		       (buffer-substring (match-beginning 1) (match-end 1))))
	    (linenum (buffer-substring (match-beginning 2) (match-end 2)))
	    (other (buffer-substring (match-beginning 3) (match-end 3)))
	    temp)
	(if (> (setq temp (length filename)) longest-file)
	    (setq longest-file temp))
	(if (> (setq temp (length linenum)) longest-line)
	    (setq longest-line temp))
	(setq counter (1+ counter))))
    (setq spew-file-vector (make-vector counter ""))
    (setq spew-line-vector (make-vector counter 0))
    (setq return-value counter)
    (setq counter 0)
    (goto-char (point-min))
    (while (re-search-forward "^\\([^ ]+\\) \\([^ ]+\\) \\(.*\\)" nil t)
      (let* ((full-filename
	      (buffer-substring (match-beginning 1) (match-end 1)))
	     (filename (file-name-nondirectory full-filename))
	     (linenum (buffer-substring (match-beginning 2) (match-end 2)))
	     (other (buffer-substring (match-beginning 3) (match-end 3)))
	     (filelen (length filename))
	     (temp (format "%%3d %%-%ds %%%ds %%s" longest-file longest-line)))
	(aset spew-file-vector counter full-filename)
	(aset spew-line-vector counter (string-to-int linenum))
	(replace-match (format temp
			       (setq counter (1+ counter))
			       filename
			       linenum
			       other)
		       t nil)))
    (goto-char (point-min))
    (setq pat (concat "\\("
		      (make-string (- (window-width) 2) ?.)
		      "\\)\\(.+\\)"))
    (while (re-search-forward pat nil t)
      (replace-match (concat
		      (buffer-substring (match-beginning 1) (match-end 1))
		      "\n"
		      (make-string
		       (+ longest-file longest-line 6) ? )
		      (buffer-substring (match-beginning 2) (match-end 2)))
		     t nil)
      (beginning-of-line))
    (goto-char (point-min))
    return-value))

;;;###autoload
(defun spew-find-goodies ( string )
  "Calls the spew program and sends it STRING, plops into the buffer
and puts the buffer into spew-mode"
  (interactive "sString: ")
  (spew-init-process)
  (message (concat "sending " string))
  (send-string spew-process string)
  (spew-wait)
  (if (and (= (spew-format) 1) spew-auto-go)
      (spew-goto-from-list nil)
    (pop-to-buffer spew-out-buffer)
    (spew-mode)))

;;;###autoload
(defun x-spew-goto-from-list ( click )
  "Move to where the mouse is and then process the line"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (spew-goto-from-list nil))

;;;###autoload
(defun x-spew-goto-from-list-other-window (click)
  "Move to where the mouse is and then process the line"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (spew-goto-from-list t))

;;;###autoload
(defun x-spew-view-from-list ( click )
  "Move to where the mouse is and then process the line"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (spew-view-from-list))

;;;###autoload
(defun x-spew-find-symbol ( click )
  "Find all references to the symbol which is clicked on"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (spew-find-goodies
   (concat (get-symbol-non-interactively) "\n")))

(global-set-key [C-S-mouse-1] 'x-spew-find-symbol)
