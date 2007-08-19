;;
;; A very crude "rails-server" mode.  Currently, the user must do a
;; lot by hand.  First, get in the root directory for your rails
;; project.  You can do this either by dired of that directory or
;; start a shell and cd to that directory.  Then do M-x
;; rails-server-start.
;;
;; Currently only two sequences are hooked up.  While within the
;; *rails-server* buffer, a C-cr will restart the server.  It does
;; this by sending a SIGHUP to the child process.  The other thing is
;; C-x` (like the compile stuff).  With a prefix, it goes to the
;; bottom of the buffer, then searches backwards Error.  Then it
;; search forward for a filename:line number, splits the screen, and
;; displays that line number.  You have to go back to the buffer and a
;; second C-x` (without a prefix) goes to the next line.  These are
;; both local key bindings.
;;

(defvar rails-server-path "./script/server")

(defvar rails-server-mode-map nil)
(cond ((not rails-server-mode-map)
       (setq rails-server-mode-map (nconc (make-sparse-keymap) shell-mode-map))
       (define-key rails-server-mode-map "\C-cr" 'rails-server-mode-restart)
       (define-key rails-server-mode-map "\C-x`" 'rails-server-mode-find-last-error)
       ))

(define-derived-mode rails-server-mode shell-mode "Rails Server"
  "Major mode for interacting with the rails server.  Maybe should be
  a minor mode."
  )

(defun rails-server-mode-restart ()
  "Send a HUP signal to the process"
  (interactive)
  (signal-process (get-buffer-process (current-buffer)) 'hup))

(defun rails-server-mode-find-last-error (p)
  "From the end of the buffer, find the line that caused the error.
  i.e. search back to the stop of the last stack and then put point at
  the line number for the indicated file."
  (interactive "P")
  (unless (null p)
    (goto-char (point-max))
    (search-backward "Error ("))
  (re-search-forward "^ *\\([^ :]*\\):\\([0-9]*\\):")
  (let ((file-name (match-string 1))
	(line-number (string-to-number (match-string 2))))
    (message "file:%s line:%d" file-name line-number)
    (if (file-exists-p (concat "." file-name))
	(setq file-name (concat "." file-name)))
    (delete-other-windows)
    (goto-line line-number (find-file-other-window file-name))))

(defun rails-server-start (&optional buffer)
  "Starts the rails server -- makes a lot of assumptions"
  (interactive
   (list
    (and current-prefix-arg
	 (read-buffer "Rails Server Buffer: "
		      (generate-new-buffer-name "*rails-server*")))))
  (setq buffer (get-buffer-create (or buffer "*rails-server*")))
  ;; Pop to buffer, so that the buffer's window will be correctly set
  ;; when we call comint (so that comint sets the COLUMNS env var properly).
  (pop-to-buffer buffer)
  (unless (comint-check-proc buffer)
    (let* ((prog rails-server-path))
      (apply 'make-comint-in-buffer "rails-server" buffer prog ())
      (rails-server-mode)))
  buffer)

(provide 'rails-server)
