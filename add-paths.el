(defun recursively-add-dir-to-load-path ( dir )
  (add-to-list 'load-path dir)
  (let ((file-list (directory-files-and-attributes dir))
        file file-name is-dir)
    (while file-list
      (setq file (car file-list))
      (setq file-list (cdr file-list))
      (setq file-name (nth 0 file))
      (setq is-dir (nth 1 file))
      (if (and (eq is-dir t)
               (not (or (eq (compare-strings file-name 0 nil "." 0 nil) t)
                        (eq (compare-strings file-name 0 nil ".." 0 nil) t))))
          (recursively-add-dir-to-load-path (concat dir "/" file-name))))))

(recursively-add-dir-to-load-path "~/.emacs.d")

(provide 'add-paths)
