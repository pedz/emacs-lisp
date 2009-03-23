;;
;; File to hook in to emacs' find file hooks to be used when working
;; in a OSF's DCE build tree.  If a file is not found, it will walk up
;; the directory to find a "link".  If found, it will try to open the
;; same file down that link.
;;
;; We are going to walk up the tree much like the version control
;; does.  So, we'll use its pattern (called vc-ignore-dir-regexp) as a
;; pattern to stop us walking up futher.
;;

(require 'vc-hooks)

(defun osf-dce-file-not-found-hook ()
  (let* ((base (file-name-directory buffer-file-name))
	 (base-directory (directory-file-name base))
	 (rest (file-name-nondirectory buffer-file-name))
	 (found nil)
	 new-path)
    ;; walk up the directory looking for link.  base is the directory
    ;; (that ends in a slash), base-directory is base sans the slash,
    ;; rest is the rest of the original path.
    (while (and (not (string-equal base "/"))
		(not (string-match vc-ignore-dir-regexp base))
		(not (file-symlink-p (concat base "link"))))
      (setq rest (concat (file-name-as-directory
			  (file-name-nondirectory base-directory)) rest))
      (setq base (file-name-directory base-directory))
      (setq base-directory (directory-file-name base)))

    ;; We now append "link" to the base and see if that link exists.
    ;; If it does we see if the file exists there.  We set found to
    ;; true if we find it and new-path is the path of the new file.
    (while (and (file-symlink-p (setq base-directory (concat base "link")))
		(not (setq found
			   (file-exists-p (setq new-path
						(concat (setq base
							      (file-name-as-directory
							       base-directory))
							rest)))))))
    ;; If we found something, we now need to set everything up right.
    (if found
	(find-alternate-file new-path))))

(add-hook 'find-file-not-found-functions 'osf-dce-file-not-found-hook)

(provide 'osf-dce)
