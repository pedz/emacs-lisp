;;
;; A very crude "rails-server" mode.  Currently, the user must do a
;; lot by hand.  First, get in the root directory for your rails
;; project.  You can do this either by dired of that directory or
;; start a shell and cd to that directory.  Then do M-x
;; rails-server-start.
;;
;; I am currently using mongrel -- that may affect some features or
;; utility of this.
;;
;; What is currently hooked up:
;;
;; C-c r (Control-C r) will send a SIGHUP to child process which will
;; restart the server.  (r is for restart)
;;
;; C-c C-c will kill the server.
;;
;; Killing the buffer will kill the server.
;;
;; It makes ansi-color-for-comint-mode local and set it to t.  This
;; causes the ansi colorized SQL lines to come out nice and pretty.
;;
;; The buffer hooks in to next-error.  C-x ` with a prefix, goes to
;; the bottom of the buffer, then searches backwards Error.  Then it
;; searchs forward by "arg" count for a filename:line number.  So,
;; when your rails app craps out, just C-u C-x ` will put you at the
;; line of the error (YMMV of course).  NOTE:: The *rails-server*
;; buffer is used if it was used last.  If you do a grep or compile
;; (remember compiles?), then next-error will use those errors.  To
;; get next-error to use *rails-server*, put the *rails-server* buffer
;; as the only window in the frame and make it the current window.
;; Then next error will use it first.
;;
;; This is a submode of shell-mode so what features are in shell mode
;; will be here but there is no way to get back to an interactive
;; prompt so that may be a silly mistake on my part.  Maybe should be
;; a submode of comint-mode.
;;

(require 'shell)

(defvar rails-server-path "./script/server"
  "The path that is started via rails-server-start")

(defvar rails-server-buffer nil
  "The buffer used by the rails server process")

(defvar rails-server-mode-map nil
  "The key map for a buffer in rails-server-mode")
(cond ((not rails-server-mode-map)
       (setq rails-server-mode-map (nconc (make-sparse-keymap) shell-mode-map))
       (define-key rails-server-mode-map "\C-cr" 'rails-server-mode-restart)
       ))

(defun rails-server-next-error ( arg reset )
  "Hook for compile-next-error.  If reset is true, then from the end of the buffer, find the line that caused the error.
  i.e. search back to the stop of the last stack and then put
  point at the line number for the indicated file."
  (if reset
      (progn
	(goto-char (point-max))
	(search-backward "Error (")))

  ;; The first group is not used.  We may have just search backwards
  ;; and are sitting at Error (/file/name:18 ...  In that case, the
  ;; first part of the first group finds "(/" -- this will skip errors
  ;; with messages (Syntax Error seems to be a special case -- this is
  ;; to catch that special case).  Otherwise, the first part scans the
  ;; white space as well as the leading /.  We have to scan the / here
  ;; because we scanned it in the other part.  We will add it back in
  ;; later.  The next two groups are pretty obvious.  One is to find
  ;; the file name up to a colon.  The second is to find the line
  ;; number.  The last group is not used as well.  It finds either a
  ;; colon or an end of line.
  (message "hi")
  (re-search-forward "\\((/\\|^ */\\)\\([^:\n]*\\):\\([0-9]*\\)\\(:\\|$\\)" nil nil arg)
  (let ((file-name (concat "/" (match-string 2)))
	(line-number (string-to-number (match-string 3))))
    (message (format "file is %s line is %d" file-name line-number))
    (if (file-exists-p (concat "." file-name))
	(setq file-name (concat "." file-name)))
    (with-current-buffer (find-file file-name)
      (goto-line line-number))))


(defun rails-server-kill-buffer ()
  "Hooked in to kill-buffer-hook"
  (if (eq (current-buffer) rails-server-buffer)
      (if (get-buffer-process (current-buffer))
	  (kill-process (get-buffer-process (current-buffer))))))

(define-derived-mode rails-server-mode shell-mode "Rails Server"
  "Major mode for interacting with the rails server.  Maybe should be
  a minor mode."
  (make-local-variable 'ansi-color-for-comint-mode)
  (setq ansi-color-for-comint-mode t)
  (setq next-error-function 'rails-server-next-error)
  (add-hook 'kill-buffer-hook 'rails-server-kill-buffer nil t))

(defun rails-server-mode-restart ()
  "Send a HUP signal to the process"
  (interactive)
  (signal-process (get-buffer-process (current-buffer)) 'hup))

(defun rails-server-start (&optional buffer)
  "Starts the rails server -- makes a lot of assumptions"
  (interactive
   (list
    (and current-prefix-arg
	 (read-buffer "Rails Server Buffer: "
		      (generate-new-buffer-name "*rails-server*")))))
  (setq buffer (get-buffer-create (or buffer "*rails-server*")))
  (setq rails-server-buffer buffer)
  ;; Pop to buffer, so that the buffer's window will be correctly set
  ;; when we call comint (so that comint sets the COLUMNS env var properly).
  (pop-to-buffer buffer)
  (unless (comint-check-proc buffer)
    (let* ((prog rails-server-path))
      (apply 'make-comint-in-buffer "rails-server" buffer prog ())
      (rails-server-mode)))
  buffer)

(provide 'rails-server)
