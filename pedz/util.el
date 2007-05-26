
;;
;; Setup the translate map and map \C-\\ to look like \C-S and also
;; map \C-^ to look like \C-Q.  This sucks rocks but its the only
;; choices I have.  Don't know exactly what the set-input-mode does.
;;
;;;###autoload
(defun xon-xoff-mode ()
  "Swap keys, etc so that xon/xoff flow control works"
  (interactive)
  (if (null keyboard-translate-table)
      (progn
	(setq keyboard-translate-table (make-string 128 0))
	(let ((i 0))
	  (while (< i 128)
	    (progn
	      (aset keyboard-translate-table i i)
	      (setq i (1+ i)))))))
  (aset keyboard-translate-table ?\C-\\ ?\C-S)
  (aset keyboard-translate-table ?\C-^ ?\C-Q)
  (set-input-mode nil t nil))

;;
;; Setup the translate map to map backspace to delete and vice-versa.
;;
;;;###autoload
(defun backspace-delete-flip ()
  "Swap keys, etc so that backspace and delete are flipped:"
  (interactive)
  (if (null keyboard-translate-table)
      (progn
	(setq keyboard-translate-table (make-string 128 0))
	(let ((i 0))
	  (while (< i 128)
	    (progn
	      (aset keyboard-translate-table i i)
	      (setq i (1+ i)))))))
  (aset keyboard-translate-table ?\C-? ?\C-H)
  (aset keyboard-translate-table ?\C-H ?\C-?))

;;;###autoload
(defun split-window-in-thirds ()
  "Split the window where point is at into thirds displaying other
buffers in the two other windows"
  (interactive)
  (let ((win (selected-window)))
    (delete-other-windows win)
    (split-window win (/ (window-height win) 3)))
  (other-window 1)
  (switch-to-buffer (other-buffer))
  (split-window)
  (other-window 1)
  (switch-to-buffer (other-buffer))
  (other-window 1))

;;;###autoload
(defun start-vm (&optional folder read-only)
  "Starts vm but sets some variables based upon the display"
  (interactive (list nil current-prefix-arg))
  (let ((display (frame-parameter (selected-frame) 'display)))
    (if (or (null (stringp display))
	    (string= display ":0.0")
	    (string-match ".*\.austin\.ibm\.com:" display))
	(vm folder read-only)
      (let ((vm-frame-per-composition nil)
	    (vm-frame-per-edit nil)
	    (vm-frame-per-folder nil)
	    (vm-frame-per-summary nil)
	    (baud-rate 14400))
	(vm folder read-only)))))

;;;
;;; The compilation code has a hook that I use for the AIX release 4
;;; build environment.
;;;
;;;###autoload
(defun v4-build-compilation-finish ( buf msg )
  "This function is hooked into compile.el by pointing
compilation-finish-function at it.  It goes through the buffer looking
for \"cd ../.......\" at the beginning as well as the \"[ /bos/blah
]\" messages and converts them into Entering and Leaving messages."
  (save-excursion
    (goto-char (point-min))
    (beginning-of-line 3)
    (if (not (looking-at "relative path: \\.\\(.*\\)/[^/]*\\.\ncd \\(.*\\)"))
	t
      (let ((rel-path (buffer-substring (match-beginning 1) (match-end 1)))
	    (cd-path (buffer-substring (match-beginning 2) (match-end 2))))
	(message rel-path)
	(message cd-path)
	(setq default-directory (file-name-as-directory
				 (expand-file-name cd-path)))
	(setq compilation-directory-stack (list default-directory))
	(setq compilation-enter-directory-regexp
	      (concat "^\\[ "
		      (regexp-quote rel-path)
		      "/\\(.*\\) \\]"))))))

;;;###autoload
(defun from-home ()
  "Call this when working from home"
  (interactive)
  (setq vm-frame-per-composition nil
	vm-frame-per-edit nil
	vm-frame-per-folder nil
	vm-frame-per-summary nil
	baud-rate 14400))

;;;###autoload
(defun from-work ()
  "Call this when working from work"
  (interactive)
  (setq vm-frame-per-composition t
	vm-frame-per-edit t
	vm-frame-per-folder t
	vm-frame-per-summary nil
	baud-rate 1000000))

;;;###autoload
(defun update-my-autoloads ()
  "Update my personal loaddefs.el file"
  (interactive)
  (let ((source-directory "~/.emacs.d/el"))
    (update-directory-autoloads "~/.emacs.d/el")))

;;;###autoload
(defun server-ediff-files ( file1 file2 )
  "Called from ediff program via gnudoit"
  (ediff-files file1 file2))

(defun kill-buffers-reqexp ( reqexp &optional ask )
  "Kill all the buffers whose names match REQEXP.  Confirm before
killing if ASK is true."
  (interactive "sREGEXP for buffer names to kill \nP")
  (let ((list (buffer-list)))
    (while list
      (let* ((buffer (car list))
	     (name (buffer-name buffer)))
	(if (and (string-match reqexp name)
		 (or (null ask)
		     (and ask
			  (yes-or-no-p
			   (format "Buffer %s %s. Kill? "
				   name
				   (if (buffer-modified-p buffer)
				       "HAS BEEN EDITED" "is unmodified"))))))
	    (kill-buffer buffer)))
      (setq list (cdr list)))))
