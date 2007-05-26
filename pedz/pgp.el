;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; PGP 2.2 encryption/decryption routines for Mail/Rmail modes.
;;
;; Copyright 1992 by Gray Watson and the Antaire Corporation
;;
;; $Id: pgp.el,v 1.14 1993/05/25 01:19:36 gray Exp $
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LCD Archive Entry:
;; pgp|Gray Watson|gray.watson@antaire.com|
;; Pretty Good Privacy Version 2.2+ Interface.|
;; 25-May-1993|1.14|~/interfaces/pgp.el|
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 1, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Put the following in your .emacs to enable the pgp hooks:
;;
;;(autoload 'pgp-decrypt-message "pgp"
;;	  "Decrypt and incoming mail message in rmail using pgp" t)
;;(autoload 'pgp-verify-message "pgp"
;;	  "Verify an incoming cleartext-signed mail message in rmail using pgp"
;;	  t)
;;(autoload 'pgp-encrypt-message "pgp"
;;	  "Encrypt an outgoing mail message using pgp" t)
;;(autoload 'pgp-sign-message "pgp"
;;	  "Sign your mail message using pgp" t)
;;(autoload 'pgp-append-public "pgp"
;;	  "Add your public key to end of outgoing mail message using pgp" t)
;;
;; (setq pgp-tmp-dir (format "%s/tmp" (getenv "PGPPATH")))
;; (setq pgp-binary "/usr/local/bin/pgp")
;;
;; (require 'sendmail)
;; (define-key rmail-mode-map "\C-cd" 'pgp-decrypt-message)
;; (define-key rmail-mode-map "\C-cv" 'pgp-verify-message)
;; (define-key mail-mode-map "\C-ce" 'pgp-encrypt-message)
;; (define-key mail-mode-map "\C-cs" 'pgp-sign-message)
;; (define-key mail-mode-map "\C-ca" 'pgp-append-public)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; SECURITY
;;
;; This module makes use of:
;;
;;   a) a password routine which does not echo chars
;;   b) PGP 2.2's way of taking the password from stdin
;;   c) a secure temporary file directory.
;;
;; However, there are many other ways to overcome Unix security so BEWARE.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; LIMITATIONS
;;
;; If you mistype the password, PGP will prompt for it again even if it is in
;; filter mode.  This is just plain PGP idiocy but I don't know a way around
;; it without hacking PGP code.  PGP should just return an error code here
;; if anyone is listening.
;;
;; If you ^G after waiting for what you think an "abnormally long" time and you
;; have in your mail buffer the PGP prompt for a password then you need to
;; undo a couple of times to restore your mail message and then try again.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; VARIABLES
;;

;;
;; Where to put the pgp.el temp files.  WARNING: should be secure directory
;; I usually create a tmp under my PGPPATH directory which is secure so maybe
;; (setq pgp-tmp-dir (format "%s/tmp" (getenv "PGPPATH"))) is more appropriate.
;;
(defvar pgp-tmp-dir "/var/tmp"
  "Directory to put pgp.el temp files.  WARNING: should be secure.")

;;
;; Full-path to the pgp installed binary.  Maybe (expand-file-name "~/bin/pgp")
;;
(defvar pgp-binary "/usr/local/bin/pgp" "Full path to the pgp binary.")

;;
;; The PGP User-ID for your personal key to sign and encrypt outgoing messages
;;
(defvar pgp-my-user-id (user-full-name)
  "The PGP User ID to locate your personal key to sign and encrypt messages.")

;;
;; Encrypt all outgoing messages with your private key also so you can read
;; your own outgoing messages.
;;
(defvar pgp-encrypt-with-my-key nil
  "Set to t to always encrypt outgoing messages with your private key.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; FUNCTIONS
;;

;;
;; read in a password without showing user input and while handling ^u (kill)
;; as well as delete and ^h (erase).  does another emacs function do this?
;;
(defun read-password (prompt)
  (let ((key ?\177) (pass ""))
    
    ;; run until we get a cr or lf
    (while (not (or (= key ?\n)
		    (= key ?\r)))
      (progn
	;; watch for erase characters
	(if (or (= key ?\177)
		(= key ?\010))
	    (if (> (length pass) 0)
		(setq pass (substring pass 0 -1)))
	  (if (= key ?\025)
	      (setq pass "")
	    (setq pass (concat pass (char-to-string key)))
	    )
	  )
	
	;; display the prompt if appropriate
	(if prompt
	    (message prompt))
	
	;; magic to read-key while blocking quitting while in the non-echo area
	(setq cursor-in-echo-area t)
	(setq inhibit-quit t)
	(setq key (read-char))
	(setq cursor-in-echo-area nil)
	(setq inhibit-quit nil)
	)
      )
    pass
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; encrypt a message while in Mail mode
;;
(defun pgp-encrypt-message ()
  "Encrypt an outgoing mail message using pgp in Mail mode"
  (interactive)
  (let ((pass) (tmp) (user) (receiver) (next) (start) (command)
	(process-environment))
    
    ;; setup the environment for pgp with tmp directory
    (setq tmp (getenv "PGPPATH"))
    (if (not tmp)
	(error
	 "Please set your PGPPATH env variable before using this function!"))
    (setq process-environment
	  (list (format "PGPPATH=%s" tmp)
		(format "TMP=%s" pgp-tmp-dir)
		"PGPPASSFD=0"
		))
    
    ;; get the password and signature address
    (setq pass (read-password "PGP Password: "))
    (setq user (read-input
		(format "Signature to use or 'none' [%s]: " pgp-my-user-id)
		))
    (if (string= user "")
	(setq user pgp-my-user-id))
    
    ;; get the receiver information
    (goto-char (point-min))
    (re-search-forward "^To:[ ]*")
    (setq start (point))
    (re-search-forward "@\\|\n")
    (if (= (char-after (- (point) 1)) ?\n)
	(forward-char -1))
    (setq receiver (read-input
		    (format "Encrypt message for [%s]: "
			    (buffer-substring start (point)))))
    (if (string= receiver "")
	(setq receiver (buffer-substring start (point))))
    
    ;; should we encrypt with user's key also?
    (if (or pgp-encrypt-with-my-key
	    (y-or-n-p (format "Encrypt message for yourself [%s]? "
			      pgp-my-user-id)))
	(setq receiver (concat  receiver "' '" pgp-my-user-id))
      )
    
    ;; maybe add some more addresses to encrypt for?
    (while (not (string=
		 (setq next (read-input
			     "Encrypt message for someone else [none]: ")) ""))
      (setq receiver (concat receiver "' '" next))
      )
    
    ;; copy the message into the message file
    (goto-char (point-min))
    (search-forward "\n--text follows this line--\n")
    (setq start (point))
    (insert pass "\n")
    
    ;; call pgp on the message
    (message "Working.  Please wait...")
    (if (string= user "none")
	(setq command (format "%s -fe '%s'" pgp-binary receiver))
      (setq command (format "%s -fe -su '%s' '%s'" pgp-binary user receiver))
      )
    
    (shell-command-on-region start (point-max) command t)
    
    ;; remove the pgp stuff if the user wants
    (goto-char start)
    (message "Press a key to remove pgp information from the message.")
    (read-char)
    (search-forward "-----BEGIN PGP MESSAGE-----\n")
    (search-backward "-----BEGIN PGP MESSAGE-----\n")
    (delete-region start (point))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; decrypt a message in Rmail mode
;;
(defun pgp-decrypt-message ()
  "Decrypt and incoming mail message using pgp in Rmail mode"
  (interactive)
  (let ((pass) (tmp) (start) (process-environment))
    
    ;; setup the environment for pgp with tmp directory
    (setq tmp (getenv "PGPPATH"))
    (if (not tmp)
	(error
	 "Please set your PGPPATH env variable before using this function!"))
    (setq process-environment
	  (list (format "PGPPATH=%s" tmp)
		(format "TMP=%s" pgp-tmp-dir)
		"PGPPASSFD=0"
		))
    
    ;; get the password and destination address
    (setq pass (read-password "PGP Password: "))
    
    ;; copy the message into the message file
    (goto-char (point-min))
    (search-forward "\n\n")
    (setq start (point))
    (rmail-edit-current-message)
    (insert pass "\n")
    
    ;; call pgp on the message
    (message "Working.  Please wait...")
    (shell-command-on-region start (point-max) pgp-binary t)
    
    ;; remove the pgp information
    (goto-char start)
    (message "Press a key to remove pgp information from the message.")
    (read-char)
    (search-forward "\nSignature made")
    (search-forward "\n")
    (delete-region start (point))
    (rmail-cease-edit)
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; sign a message in Mail mode
;;
(defun pgp-sign-message ()
  "Sign your mail message using pgp in mail mode"
  (interactive)
  (let ((pass) (clear) (command) (tmp) (start) (process-environment))
    
    ;; setup the environment for pgp with tmp directory
    (setq tmp (getenv "PGPPATH"))
    (if (not tmp)
	(error
	 "Please set your PGPPATH env variable before using this function!"))
    (setq process-environment
	  (list (format "PGPPATH=%s" tmp)
		(format "TMP=%s" pgp-tmp-dir)
		"PGPPASSFD=0"
		))
    
    ;; get the password
    (setq pass (read-password "PGP Password: "))
    
    ;; get signature.
    (setq user (read-input
		(format "Signature to use [%s]: " pgp-my-user-id)
		))
    (if (string= user "")
	(setq user pgp-my-user-id))
    
    (setq clear (y-or-n-p "Clear-text sign? "))
    
    ;; copy the message into the message file
    (goto-char (point-min))
    (search-forward "\n--text follows this line--\n")
    (setq start (point))
    (insert pass "\n")
    
    ;; call pgp on the message
    (message "Working.  Please wait...")
    (setq command (format "%s -fs -u '%s'" pgp-binary user))
    (if clear
	(setq command (concat command " +clear")))
    (shell-command-on-region start (point-max) command t)
    
    ;; remove the pgp stuff if the user wants
    (goto-char start)
    (message "Press a key to remove pgp information from the message.")
    (read-char)
    (if clear
	(progn
	  (search-forward "-----BEGIN PGP SIGNED MESSAGE-----\n")
	  (search-backward "-----BEGIN PGP SIGNED MESSAGE-----\n"))
      (progn
	(search-forward "-----BEGIN PGP MESSAGE-----\n")
	(search-backward "-----BEGIN PGP MESSAGE-----\n")))
    (delete-region start (point))
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; verify the signature of an incoming message
;;
(defun pgp-verify-message ()
  "Verify an incoming cleartext-signed mail message using pgp in Rmail mode"
  (interactive)
  (let ((start) (tmp) (process-environment))
    
    ;; setup the environment for pgp with tmp directory
    (setq tmp (getenv "PGPPATH"))
    (if (not tmp)
	(error
	 "Please set your PGPPATH env variable before using this function!"))
    (setq process-environment
	  (list (format "PGPPATH=%s" tmp)
		(format "TMP=%s" pgp-tmp-dir)
		))
    
    ;; copy the message into the message file
    (goto-char (point-min))
    (search-forward "\n-----BEGIN PGP SIGNED MESSAGE-----")
    (beginning-of-line)
    (setq start (point))
    
    ;; get a buffer
    (save-excursion
      ;; call pgp on the message
      (message "Working.  Please wait...")
      (shell-command-on-region start (point-max) pgp-binary nil)
      
      (goto-char (point-min))
      (message "Press a key to return to message buffer")
      (read-char)
      (kill-buffer "*Shell Command Output*")
      )
    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; append your public key on the end of a message in Mail mode
;;
(defun pgp-append-public ()
  "Add a public key to end of outgoing mail message using pgp in mail mode"
  (interactive)
  (let ((tmp) (start) (key) (process-environment) (public))
    
    ;; setup the environment for pgp with tmp directory
    (setq tmp (getenv "PGPPATH"))
    (if (not tmp)
	(error
	 "Please set your PGPPATH env variable before using this function!"))
    (setq process-environment
	  (list (format "PGPPATH=%s" tmp)
		(format "TMP=%s" pgp-tmp-dir)
		))
    (setq public (format "%s/tmp/public" tmp))
    
    ;; copy the public into the public file
    (if (file-exists-p (concat public ".asc"))
	(delete-file (concat public ".asc")))
    
    (setq key
	  (read-input (format "Public key to extract [%s]: " pgp-my-user-id)))
    (if (string= key "")
	(setq key pgp-my-user-id))
    
    ;; get the public key into the buffer
    (save-excursion
      (message "Working.  Please wait...")
      (setq start (point-max))
      (shell-command-on-region start start
			       (format "%s -kx '%s' %s" pgp-binary key public)
			       t)
      (goto-char start)
      (message "Press a key to remove pgp information from the message.")
      (read-char)
      (delete-region start (point-max))
      
      (insert-char ?\n 1)
      (insert-file (concat public ".asc"))
      (delete-file (concat public ".asc"))
      )
    ))
