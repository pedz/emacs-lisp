;;
;; %W%
;;
;;
;; This file contains hooks, etc to find files in the v3 build environment.
;; I'd be sorta surprised if all the other things were usable without this
;; feature (or something just like it).  The main thing it does is hook into
;; file not file and does a tpath search for the file you are looking for.
;; This version is different from Jack O'Quinn's in that it does not remember
;; which directory you started from.  So the default-directory is the
;; true directory.  One advantage to this is there are few places where you
;; have to trick emacs into re-loading the file.  BUT the disadvantage is
;; that if you are in a /bos directory, you are likely to find the file there
;; without searching your clone trees.  -- This could be solved but it
;; doesn't bit me too often so it doesn't bother me enough to fix it.
;;
;;
;; Typical use -- you have to just load it at startup time.
;;
;; (load "v3-file")
;; (setq auto-mode-alist
;;       (cons '("\\.Z\\(l\\(st?\\)?\\)?$" .
;; 	      v3-uncompress-while-visiting) auto-mode-alist))
;;
;; Requires a program called Tpath.  It it given what v3-setup is passed
;; and should respond with a list of directories, one per line, of
;; where to search.  Typically, it does a cd to the nls directory of
;; the clone tree and then executes "tpath -a ."
;;

(require 'inherit)

(defvar v3-clone-list nil "List of directories that file might be in")
(make-variable-buffer-inherited 'v3-clone-list)
(defvar v3-setup-level nil "What was last past in to v3-setup")
(make-variable-buffer-inherited 'v3-setup-level)

;
; This is generally useful.
;
;;;###autoload
(defun process-output-to-string (prog &rest args)
  "Execute process and return its stdout as a string"
  (save-window-excursion
    (let ((bufp))
      (if (setq bufp (get-buffer "*buf2string*"))
	  (kill-buffer bufp))
      (set-buffer (generate-new-buffer "*buf2string*"))
      (apply 'call-process prog nil t nil args)
      (setq bufp (buffer-string))
      (kill-buffer (current-buffer))
      bufp)))

;The way this works it it calls tpath -u dirpath to get the colon
;seperated list of directories and then it splits this into a list of
;directories and sets that equal to v3-clone-list.  This list is
;later used by v3-find-file

;;;###autoload
(defun v3-setup ( level )
  "Setup v3-clone-list by calling Tpath with argument supplied"
  (interactive "slevel: ")
  (kill-inherited-variables)
  (let ((temp))
    (setq v3-clone-list nil)
    (condition-case var
	(progn
	  (setq temp (process-output-to-string "Tpath" level))
	  (while (numberp (string-match "\\(\\([^/\n]\\|/.\\)+\\)/?\n$" temp))
	    (progn
	      (setq v3-clone-list (cons (substring temp (match-beginning 1)
						    (match-end 1))
					 v3-clone-list))
	      (setq temp (substring temp 0 (match-beginning 1)))))
	  (setq v3-setup-level level))
      (error (message "build environment not on line"))))
  v3-clone-list)

;;;###autoload
(defun v3-get-clone-list ()
  "Called to get the clone-list.  Looks at v3-clone-list and if it is
null then it calls v3-setup with v3-clone-base if non-null
otherwise it calls v3-setup interactively"
  (if (null v3-clone-list)
      (call-interactively 'v3-setup))
  v3-clone-list)

;;;###autoload
(defun v3-get-clone-top ()
  "Call to retrieve the first directory in the list of directories searched"
  (interactive)
  (car (v3-get-clone-list)))

;;;
;;; So we can cope with being reloaded
;;;
(if (not (fboundp 'old-find-file-noselect))
    (fset 'old-find-file-noselect (symbol-function 'find-file-noselect)))

;;;
;;; This is yet another approach to the v3 find file concept.  This
;;; new find-file-noselect sits in front of the normal
;;; find-file-noselect which is now called old-find-file-noselect.
;;; This function sees if the current directory is in the build
;;; environment somehwere.  If it is, then it starts from the top of
;;; the tree and looks down.  This has several advantages.  1) It always
;;; finds the file in the clone if it exists no matter if it also
;;; exists in the current directory.  2) It does not have to do any type
;;; of two-step shuffle tricking the normal function's variables.
;;; 3) Only one buffer is created.  4) If the file is already loaded,
;;; it is not reloaded and thus killing any local variables.
;;; 
;;; This turned out to be more complex than I figured.  First, the base
;;; of the directory for the PLATFORM!! that you want to work on is
;;; determined via v3-setup.  Then there is a two part
;;; search.  First the relative path must be found so the list is
;;; searched looking for a directory that matching the first part of
;;; the filename.  If nothing matches, we return with nil.
;;; 
;;; Next comes the search for the file.  Current
;;; find-file-not-found-hooks is not called but in the future it will
;;; also be used to find a file (or we might just want to look for the
;;; .lstZ directly ourselves).  In any case, we go down the list of
;;; directories looking for a file that exists given the relative path
;;; we determined in the first part.  Hopefully we eventually find
;;; something.  (Gee, if we find a directory but don't find a file I
;;; wonder if we should trick the code into creating the new file in
;;; the platform specific directory instead of in the current
;;; directory??)
;;; 
;;; In any case, when we find a file, we look to see if a buffer
;;; already exists for this file.  If it does, we have to trick all the
;;; variables that are in find-file-noselect.  Namely, we have to set
;;; filename and buf so that things work right.  (We also have to reset
;;; error to nil or we'll get a "new file" message.
;;;  

;;;###autoload
(defun v3-clone-relative-path ( filename )
  "If FILENAME is in the v3 build environment, returns the part of the
filename which iss relative to the tpath directories, otherwise
returns nil"
  (let ((tlist v3-clone-list))
    (setq filename (expand-file-name filename))
    ;; foreach directory in the list, see if it is a prefix of filename
    (while (and tlist
		(not (string-match (concat "\\`"
					   (regexp-quote (car tlist)) "/")
				   filename)))
      (setq tlist (cdr tlist)))
    (and tlist (substring filename (match-end 0) nil))))

;;;###autoload
(defun find-file-noselect (filename &optional nowarn rawfile wildcards)
  "Read file FILENAME into a buffer and return the buffer.
If a buffer exists visiting FILENAME, return that one,
but verify that the file has not changed since visited or saved.
The buffer is not selected, just returned to the caller."
  (setq filename (expand-file-name filename))
  (let ((buffer-to-inherit-from (current-buffer))
	(rel-name (v3-clone-relative-path filename))
	(tlist v3-clone-list)
	new-path)
    (if rel-name
	(while (and tlist
		    (not (file-exists-p
			  (setq new-path (concat (car tlist) "/" rel-name)))))
	  (setq tlist (cdr tlist))))
    (old-find-file-noselect (if (and rel-name tlist)
				new-path
			      filename)
			    nowarn rawfile wildcards)))

;;;###autoload
(defun v3-get-file-buffer ( name )
  "Returns buffer whose buffer-file-name ends with NAME"
  (let ((blist (buffer-list))
	(oldbuf (current-buffer))
	(len (length name)))
    (while (and blist
		(set-buffer (car blist))
		(or (null buffer-file-name)
		    (< (length buffer-file-name) len)
		    (not (string= (substring buffer-file-name (- len)) name))))
      (setq blist (cdr blist)))
    (set-buffer oldbuf)
    (car blist)))

;;
;; This is basically a copy from uncompress.el but I changed the test
;; to simply look for the magic numbers.
;;
;;;###autoload
(defun v3-uncompress-while-visiting ()
  "Temporary \"major mode\" used for .Z files, to uncompress the contents.
It then selects a major mode from the uncompressed file name and contents."
  (goto-char 0)
  (if (not (looking-at "\037\235"))
      nil
    (setq truncate-lines t)
    (setq buffer-read-only t)
    (message "Uncompressing...")
    (let ((old-readonly buffer-read-only)
	  (modified (buffer-modified-p)))
      (setq buffer-read-only nil)
      (shell-command-on-region (point-min) (point-max) "compress -d" t)
      (set-buffer-modified-p modified)
      (setq buffer-read-only old-readonly))
    (message "Uncompressing...done")
    (normal-mode)))

(provide 'v3-file)
