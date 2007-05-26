
(setq old-load-path load-path
      inhibit-startup-message t)

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

;; Enable this if you develop in semantic, or develop grammars
;; (semantic-load-enable-semantic-debugging-helpers)

;; '(ecb-process-non-semantic-files nil)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.33beta1")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup (quote ("Please_add_wget_to_your_path_or_set_the_fullpath_to_wget" . other)))
 '(inhibit-splash-screen t)
 '(shell-prompt-pattern ".+@.+<[0-9]+> on .*
")
 '(tool-bar-mode nil)
 '(user-full-name "Perry Smith"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(require 'flyspell)
(require 'align)
(require 'cedet-setup)
(require 'ecb-setup)
(require 'nxml-setup)
(require 'mmm-setup)
(require 'find-recursive)
(require 'snippet-setup)
(require 'ruby-setup)
(require 'rails-setup)
(require 'css-setup)
;; (require 'wisent-setup)
(require 'pedz)
