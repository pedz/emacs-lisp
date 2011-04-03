;;
;; @(#)pedz.el  1.3
;;
(put 'eval-expression 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq auto-save-interval 1000
      auto-save-list-file-prefix "~/.save/saves-"
      backup-by-copying-when-linked t
      backup-by-copying-when-mismatch t
      delete-old-versions t
      display-time-24hr-format t
      display-time-day-and-date t
      executable-query nil
      inhibit-startup-message t
      kept-new-versions 4
      kept-old-versions 4
      lpr-command "lpr"
      mail-default-reply-to "pedz@austin.ibm.com"
      mail-self-blind t
      mail-archive-file-name nil
      trim-versions-without-asking t
      version-control t)

;; All of these are somewhat obsolete and I don't know how to do them
;; right so lets just leave them out for now.
;; (add-hook 'c-mode-common-hook (function
;; 			      	(lambda ()
;; 				  (setq comment-column 40
;; 					c-basic-offset 4))))
;; (add-hook 'mail-mode-hook (function
;; 			   (lambda ()
;; 			     (define-key mail-mode-map "\e\t"
;; 			       'ispell-complete-word)
;; 			     (pgp-insinuate-keys))))
;; (add-hook 'pascal-mode-hook (function
;; 			      (lambda ()
;; 				(setq case-fold-search t))))
;; (add-hook 'text-mode-hook (function
;; 			   (lambda ()
;; 			     (auto-fill-mode 1)
;; 			     (define-key text-mode-map "\e\t"
;; 				'ispell-complete-word))))
;; (add-hook 'vm-mode-hook (function
;; 			 (lambda ()
;; 			   (define-key vm-mode-map "A" nil))))

(if (or (eq window-system 'mac)
        (eq window-system 'ns))
    (setq mac-emulate-three-button-mouse t))

;; real apropos
(define-key help-map "a" 'apropos)

;;
;; Suggested autoloads for vm
;;
(autoload 'vm "vm" "Start VM on your primary inbox." t)
(autoload 'vm-other-frame "vm" "Like `vm' but starts in another frame." t)
(autoload 'vm-visit-folder "vm" "Start VM on an arbitrary folder." t)
(autoload 'vm-visit-virtual-folder "vm" "Visit a VM virtual folder." t)
(autoload 'vm-mode "vm" "Run VM major mode on a buffer" t)
(autoload 'vm-mail "vm" "Send a mail message using VM." t)
(autoload 'vm-submit-bug-report "vm" "Send a bug report about VM." t)

(defun backward-kill-line ()
  "Kills the line from point back to the beginning of the line"
  (interactive)
  (kill-line 0))

;; setup minibuffer maps to have BSD style line editing
(let ((tlist (list minibuffer-local-completion-map
                   minibuffer-local-map
                   minibuffer-local-must-match-map
                   minibuffer-local-ns-map))
      tmap)
  (while tlist
    (progn
      (setq tmap (car tlist))
      (setq tlist (cdr tlist))
      (define-key tmap "\C-w" 'backward-kill-word)
      (define-key tmap "\C-u" 'backward-kill-line))))

;;;
;;; It may be better to make this a minor mode of something but until
;;; there is a class, lets just stick these into the global map
;;;
(global-set-key [mouse-3] 'x-c-mode-cscope-func)
(global-set-key [double-mouse-3] 'x-c-mode-cscope-sym)

;;
;; My own map of things is in this map and I hook the map to \C-\\ for now
;;
(defvar personal-map (make-sparse-keymap)
  "Keymap for all personal key bindings")
(define-key personal-map "\C-b"
  (function
   (lambda ()
     (interactive) (recenter -1))))
(define-key personal-map "\C-f" 'auto-fill-mode)
(define-key personal-map "\C-p" 'insert-current-pmr)
(define-key personal-map "\C-g" 'goto-line)
(define-key personal-map "\C-k" 'compile)
;; (define-key personal-map "\C-r" 'start-vm)
(define-key personal-map "\C-r" 'vm)
(define-key personal-map "\C-v" 'view-file)
(define-key personal-map "\C-z" 'log-pmr)
(define-key personal-map "z" 'put-pmr)
(define-key personal-map "Z" 'put-all-pmr)
(define-key personal-map "\C-a" 'free-pmr)
(define-key personal-map "F" 'cscope-find-file)
(define-key personal-map "b" 'bury-buffer)
(define-key personal-map "c" 'cscope-find-func-call)
(define-key personal-map "f" 'cscope-find-func)
(define-key personal-map "g" 'cscope-find-goodies)
(define-key personal-map "i" 'cscope-find-file-include)
(define-key personal-map "\C-s" 'spew-find-symbol)
(define-key personal-map "s" 'cscope-find-symbol)
(define-key personal-map "t" (function
                              (lambda ()
                                (interactive)
                                (recenter 0))))
(define-key personal-map "\C-t" (function
                                 (lambda ()
                                   (interactive)
                                   (recenter 0))))
(define-key personal-map "l" 'list-all-matching-lines)
;;
;; For MI/X X server
;;
(define-key personal-map "3" 'split-window-in-thirds)
(define-key global-map "\C-\\" personal-map)

(define-key global-map [C-up] 'undo)
(define-key global-map [C-left] personal-map)

(defun list-all-matching-lines (regexp &optional nlines)
  (interactive "sList lines matching regexp: \nP")
  (let ((here (point)))
    (goto-char (point-min))
    (occur regexp nlines)
    (goto-char here)))

(setq shell-popd-regexp "popd\\|P"
      shell-pushd-regexp "pushd\\|p"
      shell-prompt-pattern ".+@.+<[0-9]+> on .*\n"
      shell-mode-hook (function (lambda ()
                                  (define-key shell-mode-map "\C-c\C-d" 'dirs))))

(define-key global-map "\C-x\C-b" 'electric-buffer-list)

(defun decode-message ( key )
  "Expects to be in the mail message that needs to be decode or encoded"
  (interactive "sEncryption key ")
  (let (start (read-flag buffer-read-only))
    (setq buffer-read-only nil)
    (save-excursion
      (save-restriction
        (while (and
                (re-search-forward "^\\[encode\\]" nil t)
                (setq start (point))
                (re-search-forward "^\\[clear\\]" nil t))
          (forward-line 0)
          (shell-command-on-region start (point) (concat "elm-decode " key) t)))
      (setq buffer-read-only read-flag))))

;;
;; toggle the case fold search flag
;;
(defun toggle-case-fold-search ()
  "Toggles the case fold search flag"
  (interactive)
  (message "case-fold-search is now %s"
           (prin1-to-string (setq case-fold-search (not case-fold-search)))))
(define-key personal-map "\C-c" 'toggle-case-fold-search)

;;(load "gnuserv")
;;(setenv "GNU_SECURE" "/home/pedz/.gnu_secure")
(server-start)

;;; mldrag.el setup
;;;
;;;(global-set-key [mode-line down-mouse-1] 'mldrag-drag-mode-line)
;;;(global-set-key [vertical-line down-mouse-1] 'mldrag-drag-vertical-line)
;;;(global-set-key [vertical-scroll-bar S-down-mouse-1]
;;;                'mldrag-drag-vertical-line)
;;;(require 'mldrag)

;; I took this out because of an "obsolete" warning.  Add it back and
;; and then debug when you need to use it.
;; (setq compilation-finish-function 'v4-build-compilation-finish)

(if (or (eq window-system 'x)
        (eq window-system 'mac)
        (eq window-system 'ns))
    (progn
      (require 'x-stuff)
      (setup-x)))

(if (eq window-system 'ns)
    (progn
      (global-set-key [?\M-h] 'ns-do-hide-emacs)
      (global-set-key [?\M-\s-h] 'ns-do-hide-others)))


;; Put these lines uncommmented in your .emacs if you want C-r to refresh
;; ange-ftp's cache whilst doing filename completion.
;;
(define-key minibuffer-local-completion-map "\C-r" 'ange-ftp-re-read-dir)
(define-key minibuffer-local-must-match-map "\C-r" 'ange-ftp-re-read-dir)

(add-to-list 'auto-mode-alist '("\\.[n0-9]$" . nroff-mode))
(add-to-list 'auto-mode-alist '("pmrorder" . pmrorder-mode))

;; Not sure what this use to do but server-find-file is no longer
;; defined (that I can find)
;;
;; (defun server-ediff (f1 f2)
;;   (delete-other-windows)
;;   (server-find-file f2)
;;   (ediff-buffers (get-file-buffer f1) (current-buffer)))

(setq gnus-select-methods '(nntp "ausnews.austin.ibm.com"))

(load "myloaddefs")
(display-time)

(defun unix-find ( dir &optional filter dont-add-self)
  "Acts similar to the unix find command.  Starting from DIR,
  recursively descends the file system calling FILTER.  Returns a list
  of file entries like directory-files-and-attributes returns.  FILTER
  is called with each file entry.  If it returns true, the file entry
  is added to the list that is returned.  This is a recursive
  function.  A third argument, if false, tests and adds DIR to the
  result list. FILTER defaults to t (return all files)"
  ;; Copyright Perry Smith, 2007
  ;; Aug 19, 2007

  ;; Default filter is to return everything
  (unless filter
    (setq filter (function (lambda (file) t))))
  
  ;; Set result to dir plus its attributes if appropriate
  (let* ((temp-file (unless dont-add-self
		      (cons dir (file-attributes dir))))
	 (result (unless (or dont-add-self
			     (not (funcall filter temp-file)))
		   (list temp-file))))

    ;; For each file in the directory, we call the lambda function
    (mapc
     (function (lambda (file)
		 ;; pick out file-name and is-dir.  Create full-name
		 ;; which is "dir/file-name"
		 (let* ((file-name (nth 0 file))
			(full-name (concat dir "/" file-name))
			(is-dir (nth 1 file)))

		   ;; for . and .. we do nothing
		   (unless (or (string-equal file-name ".")
			       (string-equal file-name ".."))

		     ;; call filter to see if file should be added to
		     ;; the result list.  We add a modified version of
		     ;; file by changing the file name to be the full
		     ;; path relative to the origin.
		     (if (funcall filter file)
			 (setq result (cons (cons full-name 
						  (cdr file))
					    result)))

		     ;; If file is a directory, recursively call
		     ;; ourselves.  We pass t as the third argument
		     ;; because we have already added this file to the
		     ;; result list.  We append what the recursive
		     ;; calls returns with the results we have so far.
		     (if is-dir
			 (setq result (append result
					      (unix-find full-name filter t))))))))
     (directory-files-and-attributes dir nil nil t))
    ;; return the result
    result))

(global-set-key "\C-x/" 'point-to-register)
(global-set-key "\C-xj" 'jump-to-register)

;; Should not use replace-string non-interactively -- also, can't find
;; where this is used.
;;
;; (defun cleanup-grep ()
;;   (replace-string "\004" "" nil (point-min) (point-max)))

(require 'osf-dce)

(provide 'pedz)
