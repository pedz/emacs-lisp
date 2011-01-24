;; To update the myautoloads file, you need to do this:  (note that
;; the line breaks need to be removed)

;; find . -type f -name '*.el' -print | \
;;     egrep -v '/\.git' | \
;;     xargs egrep -l '# *autoload' | \
;;     xargs /Applications/Emacs.app/Contents/MacOS/Emacs \
;;         -batch \
;;         -l q.el \
;;         -l autoload \
;;         -f batch-update-my-autoloads
;;
(add-to-list 'load-path "~/.emacs.d/pedz")
(require 'autoload)
(require 'bytecomp)
(require 'util)
(defun batch-update-my-autoloads (&optional file)
  (defvar command-line-args-left)	;Avoid 'free variable' warning
  (let ((generated-autoload-file "~/.emacs.d/pedz/myloaddefs.el")
	(temp command-line-args-left))
    (while temp
      (update-file-autoloads (car temp))
      (setq temp (cdr temp)))
    (save-some-buffers t)))

;; This is invoked like:
;; /Applications/Emacs.app/Contents/MacOS/Emacs -batch -l q.el -f batch-byte-recompile-directory-all
;;
(defun batch-byte-recompile-directory-all ()
  (batch-byte-recompile-directory 0))
