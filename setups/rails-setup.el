
;;; RAILS init begin
;; Some of the emacs-rails stuff
(require 'pedz)
(require 'rails-lib)
(require 'rails-ui)
(require 'rails-server)
;;; (require 'rails)

;; rhtml --> html
(add-to-list 'auto-mode-alist '("\\.rhtml$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.rxml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))

;; Add erb foo to HTML files
(mmm-add-mode-ext-class 'html-mode nil 'erb-code)
(mmm-add-mode-ext-class 'nxml-mode nil 'erb-code)

;; And YAML files while we're at it
(mmm-add-mode-ext-class 'yaml-mode nil 'erb-code)


(defun set-ri-ruby-paths (rails-root)
  "Given RAILS-ROOT, sets ri-ruby-paths to RAILS-ROOT/*/ri directories"
  (interactive "D")
  (let* ((file-list (unix-find rails-root
			       (function
				(lambda (file)
				  (and (string-equal "ri" (nth 0 file)) (nth 1 file))))))
	 (temp nil))
    (mapc (function
	   (lambda (file)
	     (let ((full-path (expand-file-name (nth 0 file) rails-root)))
	       (if temp
		   (setq temp (concat temp ":" full-path))
		 (setq temp full-path)))))
	  file-list)
    (setq ri-ruby-paths (or temp ""))))

(provide 'rails-setup)
