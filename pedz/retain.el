;;;
;;; Routines for using retain
;;;
;;;
;;; New way to get an interactive argument for PMR and all its buddies.
;;;

(defun get-argument ( prompt regexp history )
  "Get an argument"
  (let* ((pos (point))
	 (eol (search-forward-regexp "$"))
	 (bol (search-backward-regexp "^"))
	 (str nil))
    (while (and (<= bol pos)
		(goto-char bol)
		(or (null (search-forward-regexp regexp eol t))
		    (< (match-end 0) pos)))
      (setq bol (1+ bol)))
    (goto-char pos)
    (if (and (<= (match-beginning 0) pos)
	     (>= (match-end 0) pos))
	(setq str (buffer-substring (match-beginning 0) (match-end 0))))
    (read-from-minibuffer prompt str nil nil history nil nil)))

(defvar retain-mode-map nil "")
(if retain-mode-map
    ()
  (setq retain-mode-map (make-sparse-keymap))
  (define-key retain-mode-map [mouse-2] 'x-get-pmr))

(defvar current-pmr nil "Current pmr we are looking at")
(make-variable-buffer-local 'current-pmr)

(defvar current-queue nil "Current queue we are looking at")
(make-variable-buffer-local 'current-queue)

(defvar pmrget "pmrget" "*Program to use to get pmrs")
(defvar aparget "aparget" "*Program to use to get apars")
(defvar ptfget "ptfget" "*Program to use to get ptfs")
(defvar retdead nil "*Set if retain is dead")

(defvar pmrorder-last nil "Last pmrorder command given")
(make-variable-buffer-local 'pmrorder-last)

;;;###autoload
(defun pmrorder-mode ()
  "Mode to go into when looking at the output of PMR order"
  (highlight-pmrs)
  (use-local-map retain-mode-map)
  (not-modified))

;;;###autoload
(defun find-pmr ( prompt )
  "Used by the interactive command to pickup the complete pmr number
the cursor is on"
  (let ((comma-syntax (char-to-string (char-syntax ?,)))
	result)
    (modify-syntax-entry ?, "w")
    (unwind-protect
	(setq result (get-symbol-interactively prompt))
      (modify-syntax-entry ?, comma-syntax))
    result))

;;;###autoload
(defun process-complete ( process state )
  "Look for process to enter the exit state and then clean up its
buffer and delete it from the process table"
  (let ((buf (process-buffer process)))
    (if (null (buffer-name buf))
	t
      (save-excursion
	(set-buffer buf)
	(if (null (string= state "finished\n"))
	    (insert state)
	  (goto-char (point-min))
	  (highlight-pmrs)
	  (use-local-map retain-mode-map)
	  (not-modified)
	  (setq case-fold-search t)
	  (setq buffer-read-only t)))
      (display-buffer buf))))

;;;###autoload
(defun async-call-process ( program infile buffer display &rest args )
  (let* ((buf (if (eq buffer t)
		  (current-buffer)
		buffer))
	 (proc (apply 'start-process program buf program args )))
    (set-process-sentinel proc 'process-complete)
    (if buf
	(pop-to-buffer buf))
    proc))

;;;###autoload
(defun wait-for-async-process ( proc )
  "Wait for PROC to finish"
  (while (null (eq (process-status proc) 'exit))
    (accept-process-output)))

;;;###autoload
(defun retain-common ( bufname cmd args name &optional force-erase )
  "Common routine which creates a buffer called BUFNAME.  If the
buffer already exists then it is used unless FORCE-ERASE (the prefix
arg) is true.  Then call-process using CMD with ARGS.  The buffer is
selected when finished.  Another feature is if this is called inside
the buffer that we are looking for, then we assume the user wants to
refresh the buffer so FORCE-ERASE is set to true"
  (let ((flag (or (string-equal bufname (buffer-name (current-buffer)))
		  force-erase))
	(buf (get-buffer bufname)))
    (if (and (not flag) buf)
	(progn
	  (switch-to-buffer buf)
	  nil)
      (switch-to-buffer bufname)
      (setq buffer-read-only nil)
      (erase-buffer)
      (setq current-pmr name)
      (process-buffer
       (if retdead
	   (apply 'async-call-process cmd nil t nil "-o" args)
	 (apply 'async-call-process cmd nil t nil args))))))
  
;;;
;;; pmr-pattern explained:
;;;   The first line is the problem number which can be upper or lower
;;;   case letters and numbers.
;;;   The second line is the optional branch which can be seperated by
;;;   a comma, period, or space and have an optional upper or lower
;;;   case b.
;;;   The third line is similar except is for the country code.
(defvar pmr-pattern
  (concat
   "\\<[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]"
   "\\([,. ][Bb]?[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]"
   "\\([,. ][Cc]?[a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]\\)?\\)?\\>")
  "Pattern that matchs a PMR number")

(defvar apar-pattern
  "\\<[Ii][XxYy][0-9][0-9][0-9][0-9][0-9]\\>"
  "Pattern that matchs an APAR number")

(defvar ptf-pattern
  "\\<[Uu][0-9][0-9][0-9][0-9][0-9][0-9]\\>"
  "Pattern that matchs a PTF number")

(defvar pmr-apar-pattern
  (concat "\\(" pmr-pattern "\\)\\|\\(" apar-pattern "\\)")
  "Pattern that matchs a PMR or APAR number")

(defvar defect-pattern
  "\\<[0-9][0-9][0-9][0-9][0-9][0-9]\\>"
  "Pattern that matchs a defect number")

(defvar all-pattern
  (concat "\\(" pmr-pattern "\\)\\|\\(" apar-pattern "\\)\\|\\(" ptf-pattern "\\)")
  "Pattern that matchs a PMR, APAR, or PTF number")

(defvar pgrep-pattern
  (concat "\\(" pmr-pattern
	  "\\)\\|\\(" apar-pattern 
	  "\\)\\|\\(" ptf-pattern
	  "\\)\\|\\(" defect-pattern
	  "\\)")
  "Pattern that matchs a PMR, APAR, PTF or defect number")

(defvar pmr-history nil
  "History of PMR's retrieved")

(defvar apar-history nil
  "History of APAR's retrieved")

(defvar ptf-history nil
  "History of PTF's retrieved");

(defvar pgrep-history nil
  "Hisotory of pgrep patters retrieved")

(defun highlight-pmrs ( )
  "Goes through current region and highlights the PMR numbers"
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward all-pattern nil t)
      (put-text-property (match-beginning 0) (point) 'mouse-face 'highlight))))

;;;###autoload
(defun PMR ( number arg )
  "Gets a PMR"
  (interactive (list (get-argument "PMR: " pmr-apar-pattern 'pmr-history)
		     current-prefix-arg))
  ;;
  ;; we try to understand more pmr numbers and make these changes
  ;; 12345,b987 => 12345,987          Remove the b prefix for the branch
  ;; 12345,234,cxyz => 12345,234,xyc  Remove the c prefix the country code
  ;; 12345,123 => 12345,123,000       Assume US pmrs if no country code
  ;;
  ;; I wish I could cope with 12345 b456 but thats for another day.
  ;;
  (let (pos)
    (while (setq pos (string-match " " number))
      (setq number (concat (substring number 0 pos)
			   ","
			   (substring number (1+ pos))))))
  (if (string-match "^.....,b..." number)
      (setq number (concat (substring number 0 6) (substring number 7))))
  (if (string-match "^.....\.b..." number)
      (setq number (concat (substring number 0 5) "," (substring number 7))))
  (if (string-match "^.....,...,c..." number)
      (setq number (concat (substring number 0 10) (substring number 11))))
  (if (string-match "^.....,...\.c..." number)
      (setq number (concat (substring number 0 9) "," (substring number 11))))
  (if (string-match "^.....,...$" number)
      (setq number (concat number ",000")))
  (retain-common (concat "PMR " number) pmrget (list "-Ai" number) number arg))

;;;###autoload
(defun APAR ( number arg )
  "Gets a APAR"
  (interactive (list (get-argument "APAR: " pmr-apar-pattern 'apar-history)
		     current-prefix-arg))
  (retain-common (concat "APAR " number) aparget (list "-a" number) number arg))

;;;###autoload
(defun PTF ( number arg )
  "Gets a PTF"
  (interactive (list (get-argument "PTF: " ptf-pattern 'ptf-history)
		     current-prefix-arg))
  (retain-common (concat "PTF " number) ptfget (list "-a" number) number arg))

;;;###autoload
(defun pgrep ( number arg )
  "Gets the output of pgrep"
  (interactive (list (get-argument "Pattern: " pgrep-pattern 'pgrep-history)
		     current-prefix-arg))
  (retain-common (concat "pgrep " number) "pgrep" (list number) number arg))

;;;###autoload
(defun pmr-search ( pattern arg )
  "Makes a call to pmrsearch"
  (interactive "sSearch pattern \nP")
  (retain-common (concat "pmr search:" pattern) "pmrsearch" (list pattern) pattern 
		 arg))

;;;###autoload
(defun find-number ()
  "Finds the apar or pmr number from the pmr's text"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (re-search-forward "Queue: *\\([^ ]+,...\\)")
    (setq-default current-queue
		  (setq current-queue (buffer-substring (match-beginning 1)
							(match-end 1))))
    (goto-char (point-min))
    (re-search-forward "P[Mm][Rr]: *\\([^ \n]+\\)$")
    (concat "pmr"
	    (setq-default current-pmr
			  (setq current-pmr
				(buffer-substring (match-beginning 1)
						  (match-end 1)))))))

;;;###autoload
(defun put-all-pmr ()
  "Plops the current pmr into the current buffer"
  (interactive)
  (insert (concat current-queue "/" current-pmr)))

;;;###autoload
(defun put-pmr ()
  "Plops the current pmr into the current buffer"
  (interactive)
  (insert current-pmr))

;(defun log-pmr ()
;  "Makes a log entry to start the clock for this pmr"
;  (interactive)
;  (let ((num (find-number)))
;    (if (null watchdog-doing)
;	(setq watchdog-doing num))
;    (message num)))
		  
(defvar cs-map nil
  "Local map used in a cs buffer.")

(if cs-map
    ()
  (setq cs-map (make-sparse-keymap))
  (define-key cs-map [mouse-1] 'find-pmr-in-cs-buffer)
  (define-key cs-map [down-mouse-1] 'x-no-op)
  (define-key cs-map [drag-mouse-1] 'x-no-op))

;;;###autoload
(defun cs (queue arg)
  "Get the queue from retain"
  (interactive "sQueue [pedz,165] \nP")
  (if (string= queue "")
      (setq queue "pedz,165"))
  (let ((buf (retain-common (concat "cs " queue) "cs" (list queue) queue arg)))
    (if buf
	(progn
	  (set-buffer buf)
	  (use-local-map cs-map)))))

;(defun get-pmrs (arg)
;  "Suck down all of the pmrs on my queue"
;  (interactive "sQueue [pedz,165] ")
;  (if (string= arg "")
;      (setq arg "pedz,165"))
;  (wait-for-async-process (cs arg))
;  (let (last)
;    (sit-for 0)
;    (goto-char (point-max))
;    (re-search-backward "^ *\\([0-9]+\\)\\.")
;    (setq last (string-to-int (buffer-substring
;			       (match-beginning 1) (match-end 1))))
;    (while (> last 0)
;      (progn
;	(wait-for-async-process (PMR (int-to-string last) t))
;	(sit-for 0)
;	(setq last (1- last))))))

(defvar pmrorder-map nil
  "Local map used in the pmrorder buffers to map mouse button one to
get the pmr pointed to")

(if pmrorder-map
    ()
  (setq pmrorder-map (make-sparse-keymap))
  (define-key pmrorder-map [mouse-1] 'x-get-pmr)
  (define-key pmrorder-map [down-mouse-1] 'x-no-op)
  (define-key pmrorder-map [drag-mouse-1] 'x-no-op))

;;;###autoload
(defun pmrorder ( queues arg )
  "Get the pmrorder report for QUEUES into a buffer named pmrorder and
set up a local map so that the first mouse button will get the pmr
picked on."
  (interactive "sQueues: \nP")
  (let ((buf (retain-common (concat "pmrorder " queues)
			     "pmrorder" (list "-a" queues) queues arg)))
    (if buf
	(progn
	  (set-buffer buf)
	  (use-local-map pmrorder-map)
	  (modify-syntax-entry ?, "w")))))

;;;###autoload
(defun ppp ( )
  "Get the pmrorder report for QUEUES into a buffer named pmrorder and
set up a local map so that the first mouse button will get the pmr
picked on."
  (interactive)
  (find-file "/tmp/pmrorderd")
  (use-local-map pmrorder-map)
  (modify-syntax-entry ?, "w"))

(defun get-highlight-text ()
  "Returns the text under point that has the mouse highlight property"
  (save-excursion
    (buffer-substring
     (progn
       (while (eq (get-text-property (1- (point)) 'mouse-face) 'highlight)
	 (backward-char))
       (point))
     (progn
       (while (eq (get-text-property (point) 'mouse-face) 'highlight)
	 (forward-char))
       (point)))))

;;;###autoload
(defun x-get-pmr ( click )
  "Bound to a mouse button, retrieves the pmr, apar, or ptf whose
number is pointed to"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (let ((thing (get-highlight-text)))
    (message thing)
    (if (string-match pmr-pattern thing)
	(PMR thing nil)
      (if (string-match apar-pattern thing)
	  (APAR thing nil)
	(if (string-match ptf-pattern thing)
	    (PTF thing nil))))))
      

;;;###autoload
(defun x-no-op ( click )
  "Does nothing with a mouse event"
  (interactive "e"))


(defun apar2pmr ( apar )
  (let* ((pmr (process-output-to-string "apar2pmr" apar)))
    (if (string-match "invalid\\|no pmr listed" pmr)
	nil
      (substring pmr 0 (string-match "\n" pmr)))))

;;;###autoload
(defun sanitize-pmr-number ( s )
  "Returns a sanitized version of the PMR number passed in.  If an
apar number is passed in, the apar to pmr conversion is done.  If the
string begins with \"pmr\", it is stripped of.  Any spaces are
converted to commas"
  (interactive "sPMR: ")
  ;; Is this an apar number?
  (if (and (string-match "\\`\\(\\([Ii][XxYy]\\)\\|[Aa]\\)" s)
	   (null (setq s (apar2pmr s))))
      nil
    (if (string-match "\\`pmr" s)
	(setq s (substring s (match-end 0))))
    ;;
    ;; Replace spaces with commas
    ;;
    (let ( pos )
      (while (setq pos (string-match " " s))
	(setq s (concat (substring s 0 pos)
			","
			(substring s (1+ pos))))))
    s))

;;;###autoload
(defun find-pmr-in-cs-buffer ( click )
  "When bound to a mouse event in a \"cs\" buffer, the pmr on the line
clicked on is retrieved"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (let* ((pos (point))
	 (queue nil)
	 bound prob branch country pmr)
    (save-excursion
      ;;
      ;; Go to the first line and see if we can find a queue name
      ;;
      (goto-char (point-min))
      (save-excursion
	(beginning-of-line 2)
	(setq bound (point)))
      (if (re-search-forward "\\(.*\\):" bound t)
	  (setq queue (concat 
		       (buffer-substring (match-beginning 1)
					 (match-end 1))
		       "/")))
      ;;
      ;; Go to the second line and see if we can find "PROB#" "B/O" and "CTRY"
      ;;
      (goto-char bound)
      (save-excursion
	(beginning-of-line 2)
	(setq bound (point)))
      (if (save-excursion (setq prob (search-forward "PROB#" bound t)))
	  (progn
	    (setq prob (- prob (point)))
	    (if (save-excursion (setq branch (search-forward "B/O" bound t)))
		(setq branch (- branch (point))))
	    (if (save-excursion (setq country (search-forward "CTY" bound t)))
		(setq country (- country (point))))
	    ;;
	    ;; Now go to the beginning of the line and suck out the fields
	    ;;
	    (goto-char pos)
	    (beginning-of-line)
	    (setq prob (buffer-substring (+ (point) prob -5)
					 (+ (point) prob)))
	    (if branch
		(setq branch
		      (concat "," (buffer-substring (+ (point) branch -3)
						    (+ (point) branch)))))
	    (if country
		(setq country
		      (concat "," (buffer-substring (+ (point) country -3)
						    (+ (point) country)))))
	    (setq pmr (concat queue prob branch country)))
	;;
	;; We can not figure out where the problem number is so we
	;; just guess that we have a line like "  2. PPPPP BBB ...."
	;; and hope
	;;
	(goto-char pos)
	(beginning-of-line)
	(save-excursion
	  (beginning-of-line 2)
	  (setq bound (point)))
	(setq pmr
	      (concat queue
		      (buffer-substring (+ (point) 5) (+ (point) 10))
		      ","
		      (buffer-substring (+ (point) 11) (+ (point) 14))))))
    (message (format "Getting pmr %s" pmr))
    (PMR pmr t)))

(defun insert-current-pmr ()
  "Inserts the current PMR number.  Current means the PMR's buffer is
shown in a currently visible window.  We pick the first one we find"
  (interactive)
  (let* ((win-start (selected-window))
	 (this-win win-start)
	 (result nil))
    (save-excursion
      (while (progn
	       (set-buffer (window-buffer this-win))
	       (not (or (setq result current-pmr)
			(eq (setq this-win (next-window this-win 0 'visible))
			    win-start))))))
    (if result
	(insert result))))

(defun get-all ( )
  "Simple function to get all the pmrs in the pmrorder buffer"
  (interactive)
  (let ((this-buf (current-buffer))
	proc)
    (while (re-search-forward "^.....,...,..." nil t)
      (if (setq proc (PMR (buffer-substring (match-beginning 0) (point)) nil))
	  (wait-for-async-process proc))
      (set-buffer this-buf))))

(provide 'retain)
