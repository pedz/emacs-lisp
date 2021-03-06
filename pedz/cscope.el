;;
;; %W%
;;
;;
;; This was written by Perry Smith (a.k.a. pedz) at Tandem 
;; Thu Jul 26 10:32:36 CDT 1990
;;
;; This is a set of routines which uses the output of cscope to do
;; basically the same things as cscope except you don't have to leave
;; emacs (what a concept!)
;;
;; Recommended use
;;
;; Setup all the cscope goodies
;;(autoload 'cscope-find-goodies "cscope"
;;	  "Creates a cscope buffer with lines that match STRING"
;;	  t)
;;(autoload 'cscope-find-func "cscope"
;;	  "Find FUNCTION declaration (or a #define) using the cscope stuff"
;;	    t)
;;(autoload 'cscope-find-symbol "cscope"
;;	  "Find all references to SYMBOL"
;;	  t)
;;(autoload 'cscope-find-func-call "cscope"
;;	  "Find all calls to FUNCTION"
;;	  t)
;;(autoload 'cscope-find-file "cscope"
;;	  "Finds files matching PATTERN"
;;	  t)
;;(autoload 'cscope-find-file-include "cscope"
;;	  "Finds files which include the file matching PATTERN"
;;	  t)
;;
;; bind the above functions to your favorite key sequence.
;;

(require 'v3-file)
(require 'ptags)

(defvar cscope-out-buffer nil
  "Buffer associated with the cscope process")
(make-variable-buffer-inherited 'cscope-out-buffer)

(defvar cscope-start-time nil
  "Last modification time of cscope.out file when cscope was started")
(make-variable-buffer-local 'cscope-start-time)

(defvar cscope-program-name "cscope-front"
  "*Name of program to run for cscope stuff")

(defvar cscope-auto-go t
  "*When only 1 cscope entry is found, emacs automatically selects that
entry")

(defvar cscope-process nil
  "Holds the process object for 'cscope'")
(make-variable-buffer-inherited 'cscope-process)

(defvar cscope-file-vector nil
  "Holds the full path names for the files listed in the cscope output")
(make-variable-buffer-local 'cscope-file-vector)

(defvar cscope-line-vector nil
  "Holds the line numbers for the lines listed in the cscope output")
(make-variable-buffer-local 'cscope-line-vector)

(defvar cscope-mode-map nil "")

(if cscope-mode-map
    ()
  (setq cscope-mode-map (make-keymap))
  (define-key cscope-mode-map "n" 'next-line)
  (define-key cscope-mode-map " " 'next-line)
  (define-key cscope-mode-map "p" 'previous-line)
  (define-key cscope-mode-map "\177" 'previous-line)
  (define-key cscope-mode-map "v" 'cscope-view-from-list)
  (define-key cscope-mode-map "q" 'delete-window)
  (define-key cscope-mode-map "e" 'cscope-goto-from-list)
  (define-key cscope-mode-map [mouse-1] 'x-cscope-goto-from-list-other-window)
  (define-key cscope-mode-map [drag-mouse-1] 'x-cscope-no-op)
  (define-key cscope-mode-map [down-mouse-1] 'x-cscope-no-op)
  (define-key cscope-mode-map [mouse-2] 'x-cscope-goto-from-list)
  (define-key cscope-mode-map [drag-mouse-2] 'x-cscope-no-op)
  (define-key cscope-mode-map [down-mouse-2] 'x-cscope-no-op)
  (define-key cscope-mode-map [mouse-3] 'x-cscope-view-from-list)
  (define-key cscope-mode-map [drag-mouse-3] 'x-cscope-no-op)
  (define-key cscope-mode-map [down-mouse-3] 'x-cscope-no-op)
  )

;;;###autoload
(defun cscope-mode ()
  "Major mode used to look at the cscope output stuff\n
Type:
  n to go to the next line
  Space to go to the next line
  p to go to the previous line
  Rubout to go to the previous line
  v to view the file and line
  q to delete the cscope window
  e to edit the file at the line
"
  (use-local-map cscope-mode-map)
  (setq truncate-lines t)
  (setq buffer-read-only t)
  (setq major-mode 'cscope-mode)
  (setq mode-name "C-Scope"))

;;;###autoload
(defun cscope-find-symbol ( string )
  "Find all references to the SYMBOL."
  (interactive (get-symbol-interactively "Find symbol: "))
  (cscope-find-goodies (concat "0" string "\n")))

;;;###autoload
(defun cscope-find-func ( string )
  "Find a function declaration (or a #define) using the cscope stuff"
  (interactive (get-symbol-interactively "Find function: "))
  (cscope-find-goodies (concat "1" string "\n")))

;;;###autoload
(defun cscope-find-functions-called ( string )
  "Find all functions called by this function"
  (interactive (get-symbol-interactively "Find calls from: "))
  (cscope-find-goodies (concat "2" string "\n")))

;;;###autoload
(defun cscope-find-func-call ( string )
  "Find all calls to the function"
  (interactive (get-symbol-interactively "Find calls to: "))
  (cscope-find-goodies (concat "3" string "\n")))

;;;###autoload
(defun cscope-find-string ( string )
  "Find string using cscope stuff"
  (interactive (get-symbol-interactively "Find string: "))
  (cscope-find-goodies (concat "4" string "\n")))

;;;###autoload
(defun cscope-find-pattern ( string )
  "Finds egrep patter in cscope stuff"
  (interactive (get-symbol-interactively "Pattern: "))
  (cscope-find-goodies (concat "6" string "\n")))

;;;###autoload
(defun cscope-find-file ( string )
  "Finds files matching PATTERN"
  (interactive (get-symbol-interactively "Find file: "))
  (cscope-find-goodies (concat "7" string "\n")))

;;;###autoload
(defun cscope-find-file-include ( string )
  "Find the files which include the file matching PATTERN"
  (interactive (get-symbol-interactively "Find files which include: "))
  (cscope-find-goodies (concat "8" string "\n")))

;;;###autoload
(defun cscope-find-assignment ( string )
  "Find assignments to variables and fields matching PATTERN"
  (interactive (get-symbol-interactively "Find assignments to symbol: "))
  (cscope-find-goodies (concat "9" string "\n")))

;;;###autoload
(defun cscope-get-line-number ()
  "Returns the \"line number\" out of a cscope output buffer"
  (end-of-line)
  (re-search-backward "^[ 0-9][ 0-9][0-9]")
  (1- (string-to-number (buffer-substring (match-beginning 0) (match-end 0)))))

;;;###autoload
(defun cscope-goto-from-list ( arg )
  "Point is in a buffer pointing to a line produced by
cscope-list-line. This routine plops into the file at the appropriate
spot"
  (interactive "P")
  (let* ((num (cscope-get-line-number))
	 (fname (expand-file-name (aref cscope-file-vector num)))
	 (lnum (aref cscope-line-vector num)))
    (if arg
	(find-file-other-window fname)
      (find-file fname))
    (message (buffer-name))
    (goto-char (point-min))
    (forward-line (1- lnum))))

;;;###autoload
(defun cscope-view-from-list ()
  "Point is in a buffer pointing to a line produced by
cscope-list-line. This routine plops into the file at the appropriate
spot"
  (interactive)
  (let* ((num (cscope-get-line-number))
	 (fname (expand-file-name (aref cscope-file-vector num)))
	 (lnum (aref cscope-line-vector num)))
    (find-file fname)
    (goto-char (point-min))
    (forward-line (1- lnum))
    (view-buffer (current-buffer))))

;;;
;;; We are very carefull to reference only the cscope-out-buffer
;;; variable from a normal C file.  We then switch to that buffer and
;;; use its values for cscope-process and any other inherited
;;; variables.  If cscope-out-buffer is nil or if the buffer does not
;;; exist, we assume we need to recrank a cscope for this file.
;;; 

(defvar cscope-clone-dir nil
  "Directory for the top of the clone tree used by cscope")


;;;###autoload
(defun cscope-520-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix520"
			  "/520_SERVICE" ))
;;;###autoload
(defalias 'cscope-5200-00 'cscope-520-process)

;;;###autoload
(defun cscope-52B-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52B"
			  "/52B_SERVICE" ))
;;;###autoload
(defalias 'cscope-5200-01 'cscope-52B-process)

;;;###autoload
(defun cscope-52F-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52F"
			  "/52F_COMPLETE" ))

;;;###autoload
(defun cscope-52H-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52H"
			  "/52H_COMPLETE" ))
;;;###autoload
(defun cscope-52I-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52I"
			  "/52I_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5200-05 'cscope-52I-process)
;;;###autoload
(defalias 'cscope-5200-06 'cscope-52I-process)

;;;###autoload
(defun cscope-52L-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52L"
			  "/52L_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5200-07 'cscope-52L-process)

;;;###autoload
(defun cscope-52M-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52M"
			  "/52M_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5200-08 'cscope-52M-process)

;;;###autoload
(defun cscope-52Q-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52Q"
			  "/52Q_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5200-09 'cscope-52Q-process)

;;;###autoload
(defun cscope-52S-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix52S"
			  "/52S_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5200-10 'cscope-52S-process)

;;;###autoload
(defun cscope-530-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix530"
			  "/530_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-00 'cscope-530-process)

;;;###autoload
(defun cscope-53A-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53A"
			  "/53A_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-01 'cscope-53A-process)

;;;###autoload
(defun cscope-53D-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53D"
			  "/53D_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-03 'cscope-53D-process)

;;;###autoload
(defun cscope-53E-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53E"
			  "/53E_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-04 'cscope-53E-process)

;;;###autoload
(defun cscope-53H-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53H"
			  "/53H_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-05 'cscope-53H-process)

;;;###autoload
(defun cscope-53J-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53J"
			  "/53J_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-06 'cscope-53J-process)

;;;###autoload
(defun cscope-53L-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53L"
			  "/53L_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-07 'cscope-53L-process)

;;;###autoload
(defun cscope-53N-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53N"
			  "/53N_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-08 'cscope-53N-process)

;;;###autoload
(defun cscope-53Q-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53Q"
			  "/53Q_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-09 'cscope-53Q-process)

;;;###autoload
(defun cscope-53S-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53S"
			  "/53S_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-10 'cscope-53S-process)

;;;###autoload
(defun cscope-53V-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53V"
			  "/53V_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-11 'cscope-53V-process)

;;;###autoload
(defun cscope-53X-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix53X"
			  "/53X_COMPLETE" ))
;;;###autoload
(defalias 'cscope-5300-12 'cscope-53X-process)

;;;###autoload
(defun cscope-610-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix610"
			  "/610_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-00 'cscope-610-process)

;;;###autoload
(defun cscope-61B-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61B"
			  "/61B_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-01 'cscope-61B-process)

;;;###autoload
(defun cscope-61D-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61D"
			  "/61D_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-02 'cscope-61D-process)

;;;###autoload
(defun cscope-61F-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61F"
			  "/61F_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-03 'cscope-61F-process)

;;;###autoload
(defun cscope-61H-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61H"
			  "/61H_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-04 'cscope-61H-process)

;;;###autoload
(defun cscope-61J-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61J"
			  "/61J_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-05 'cscope-61J-process)

;;;###autoload
(defun cscope-61L-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61L"
			  "/61L_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-06 'cscope-61L-process)

;;;###autoload
(defun cscope-61N-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61N"
			  "/61N_COMPLETE" ))

;;;###autoload
(defun cscope-61Q-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61Q"
			  "/61Q_COMPLETE" ))

;;;###autoload
(defalias 'cscope-6100-07 'cscope-61S-process)

;;;###autoload
(defun cscope-61V-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61V"
			  "/61V_COMPLETE" ))

;;;###autoload
(defun cscope-61X-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61X"
			  "/61X_COMPLETE" ))

;;;###autoload
(defun cscope-61S-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix61S"
                          "/61S_COMPLETE" ))
;;;###autoload
(defalias 'cscope-6100-07-04 'cscope-61S-process)

;;;###autoload
(defun cscope-710-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix710"
                          "/710_SERVICE" ))
;;;###autoload
(defun cscope-71B-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix71B"
                          "/71B_COMPLETE" ))
;;;###autoload
(defun cscope-71D-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix71D"
                          "/71D_COMPLETE" ))
;;;###autoload
(defun cscope-71F-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix71F"
                          "/71F_COMPLETE" ))
;;;###autoload
(defun cscope-71H-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/aix71H"
                          "/71H_COMPLETE" ))
;;;###autoload
(defalias 'cscope-7100-00 'cscope-71B-process)

;;;###autoload
(defalias 'cscope-7100-01 'cscope-71D-process)

;;;###autoload
(defun cscope-ipf-process ( )
  (interactive)
  (cscope-bananas-are-fun "/gsa/ausgsa/projects/a/aix/isr/53ipfl53H"
			  "/53ipfl53H_latest" ))

;;;###autoload
(defun cscope-bananas-are-fun ( base build )
  (let ((new-buf (get-buffer-create "$&$&$&$"))
	(data-dir (concat base "/cscope"))
	(base-dir (concat base build ))
	(count 0)
	l out reply link)
    (set-buffer new-buf)
    (setq cscope-out-buffer nil)
    (setq default-directory base-dir)
    (setq l (directory-files data-dir nil ".*\.db$"))
    (while l
      (setq link (concat data-dir "/" (car l)))
      (while (stringp (setq link (car (file-attributes link))))
	nil)
      (if (null link)
	  (setq out (append out (list (cons (car l) (setq count (1+ count)))))))
      (setq l (cdr l)))
    (setq reply (completing-read "Cscope database: " out nil t "mono.db"))
    (cscope-init-process (concat data-dir "/" reply) reply)
    (kill-buffer new-buf)))

;;;###autoload
(defun cscope-new-process ( )
  (interactive)
  (setq cscope-out-buffer nil)
  (cscope-init-process "cscope.out" ""))

;;;###autoload
(defun cscope-init-process ( cscope-out dbname )
  (condition-case dummy
      (set-buffer cscope-out-buffer)
    (error 
     (let* ((old-buf (current-buffer))
	    (rel-name (v3-clone-relative-path default-directory))
	    (def-dir (if rel-name
			 (concat (car v3-clone-list) "/" rel-name)
		       default-directory))
	    (dir-temp (expand-file-name
		       (read-file-name "Dir with cscope file "
				       def-dir def-dir t)))
	    ;;(clone-temp (expand-file-name
			 ;;(read-file-name "Dir for top of clone tree "
					 ;;def-dir def-dir t)))
	    (clone-temp dir-temp)
	    (full-name (concat dir-temp "CSCOPE" dbname))
	    (buf-name (concat "cscope:" dbname " " (file-name-nondirectory
						    (directory-file-name
						     dir-temp)))))
	;
	; We want to find a cscope buffer if we already have a cscope
	; started in this directory.  We set buffer-file-name equal to
	; the directory path with "CSCOPE" appended and use that to
	; search with.  We eventuall set the buffer name to a shorter
	; and nicer looking "cscope: dir" where dir is the last
	; directory in the path
	;
	(if (setq cscope-out-buffer (get-file-buffer full-name))
	    (set-buffer cscope-out-buffer)
	  (set-buffer
	   (setq cscope-out-buffer (create-file-buffer buf-name)))
	  (setq buffer-file-name full-name
		cscope-clone-dir clone-temp
		default-directory dir-temp)
	  (inherit-from-buffer old-buf)
	  (setq cscope-process nil)))))
  (pop-to-buffer cscope-out-buffer)
  (let ((mod-time (nth 5 (file-attributes "cscope.out")))
	(dead-proc (or (null cscope-process)
		       (null (eq (process-status cscope-process) 'run)))))
    (if (and (not dead-proc)
	     (not (equal cscope-start-time mod-time)))
	(progn
	  (kill-process cscope-process)
	  (setq dead-proc t)))
    (if dead-proc
	(progn
	  (if cscope-process
	      (message "Restarting dead cscope-process...")
	    (message "Starting new cscope process..."))
	  (set-process-query-on-exit-flag
	   (setq cscope-process (start-process "cscope" cscope-out-buffer
					       cscope-program-name
					       (or v3-setup-level "")
					       cscope-clone-dir
					       "-f" cscope-out)) nil)
	  (cscope-wait)
	  (setq cscope-start-time mod-time))))
  (setq buffer-read-only nil)
  (erase-buffer))

;;;###autoload
(defun cscope-wait ()
  "Waits for the cscope process to finish"
  (message "Waiting for cscope...")
  (while (and (eq (process-status cscope-process) 'run)
	      (progn
		(goto-char (point-max))
		(beginning-of-line)
		(not (looking-at ">> "))))
    (accept-process-output cscope-process)))

;;;###autoload
(defun cscope-format ()
  "Formats the output of cscope to be pretty"
  (let ((longest-file 0)
	(longest-function 0)
	(longest-line 0)
	(counter 0)
	pat return-value)
    (goto-char (point-max))
    (beginning-of-line)
    (delete-region (point)
		   (save-excursion
		     (forward-line 1)
		     (point)))
    (goto-char (point-min))
    (delete-region (point)
		   (save-excursion
		     (forward-line 1)
		     (point)))
    ;;
    ;; Go through buffer finding the longest filename, function name,
    ;; and line number.
    ;; 
    (while (re-search-forward "^\\([^ ]+\\) \\([^ ]+\\) \\([^ ]+\\) \\(.*\\)"
			      nil t)
      (let ((filename (file-name-nondirectory
		       (buffer-substring (match-beginning 1) (match-end 1))))
	    (function (buffer-substring (match-beginning 2) (match-end 2)))
	    (linenum (buffer-substring (match-beginning 3) (match-end 3)))
	    (other (buffer-substring (match-beginning 4) (match-end 4)))
	    temp)
	(if (> (setq temp (length filename)) longest-file)
	    (setq longest-file temp))
	(if (> (setq temp (length function)) longest-function)
	    (setq longest-function temp))
	(if (> (setq temp (length linenum)) longest-line)
	    (setq longest-line temp))
	(setq counter (1+ counter))))
    (setq cscope-file-vector (make-vector counter "")
	  cscope-line-vector (make-vector counter 0)
	  return-value counter
	  counter 0)

    ;;
    ;; Go through buffer reformatting it to be pretty
    ;;
    (goto-char (point-min))
    (while (re-search-forward "^\\([^ ]+\\) \\([^ ]+\\) \\([^ ]+\\) \\(.*\\)"
			      nil t)
      (let* ((full-filename
	      (buffer-substring (match-beginning 1) (match-end 1)))
	     (filename (file-name-nondirectory full-filename))
		       
	     (function (buffer-substring (match-beginning 2) (match-end 2)))
	     (linenum (buffer-substring (match-beginning 3) (match-end 3)))
	     (other (buffer-substring (match-beginning 4) (match-end 4)))
	     (filelen (length filename))
	     (funclen (length function))
	     (temp (format "%%3d %%s%%%ds%%s%%%ds%%%ds %%s"
			   (1+ (- longest-file filelen))
			   (1+ (- longest-function funclen))
			   longest-line)))
	(aset cscope-file-vector counter full-filename)
	(aset cscope-line-vector counter (string-to-number linenum))
	(replace-match (format temp (setq counter (1+ counter))
			       filename " " function " " linenum
			       other) t t)
	(put-text-property (save-excursion (beginning-of-line) (point))
			   (point)
			   'mouse-face 'highlight)))
    ;;
    ;; Go back through and wrap the long lines in a pretty fashion
    ;;
    (goto-char (point-min))
    (setq pat (concat "\\("
		      (make-string (- (window-width) 2) ?.)
		      "\\)\\(.+\\)"))
    (while (re-search-forward pat nil t)
      (replace-match (concat
		      (buffer-substring (match-beginning 1) (match-end 1))
		      "\n"
		      (make-string
		       (+ longest-file longest-function longest-line 7) ? )
		      (buffer-substring (match-beginning 2) (match-end 2)))
		     t t)
      (put-text-property (match-beginning 1) (point) 'mouse-face 'highlight)
      (beginning-of-line))
    (goto-char (point-min))
    (not-modified)
    return-value))

;;;###autoload
(defun cscope-find-goodies ( string )
  "Calls the cscope program and sends it STRING, plops into the buffer
and puts the buffer into cscope-mode"
  (interactive "sString: \nP")
  (cscope-init-process "cscope.out" "")
  (send-string cscope-process string)
  (cscope-wait)
  (if (and (= (cscope-format) 1) cscope-auto-go)
      (cscope-goto-from-list nil)
    (pop-to-buffer cscope-out-buffer)
    (cscope-mode)))

;;;###autoload
(defun x-cscope-goto-from-list ( click )
  "Move to where the mouse is and then process the line"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (cscope-goto-from-list nil))

;;;###autoload
(defun x-cscope-goto-from-list-other-window (click)
  "Move to where the mouse is and then process the line"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (cscope-goto-from-list t))

;;;###autoload
(defun x-cscope-view-from-list ( click )
  "Move to where the mouse is and then process the line"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (cscope-view-from-list))

;;
;; Neat features for c-mode so that we can cscope from the mouse
;;
;;;###autoload
(defun x-c-mode-cscope-sym ( click )
  "Find symbol via cscope that mouse is pointing at"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (cscope-find-goodies (concat "0" (get-symbol-non-interactively) "\n")))

;;;###autoload
(defun x-c-mode-cscope-func ( click )
  "Find function via cscope that mouse is pointing at"
  (interactive "@e")
  (goto-char (posn-point (event-start click)))
  (cscope-find-goodies (concat "1" (get-symbol-non-interactively) "\n")))

;;;###autoload
(defun x-cscope-no-op ( click )
  "Function which does nothing"
  (interactive "e"))

(provide 'cscope)
