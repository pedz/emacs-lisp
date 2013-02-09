;; Hook to trigger yasnappits and jasmine mode within the spec.js
;; files.

(defun jasmine-mode ()
  "Not really a 'mode'"
  (interactive)
  (js-mode)
  (yas/minor-mode t)
  (setq yas/mode-symbol 'jasmine))

(eval-after-load "rinari" '(progn
			     (require 'cucumber-mode-compilation)
			     (require 'ruby-compilation-rspec)
			     (require 'feature-mode)
			     (require 'rspec-mode)
			     (add-to-list 'yas/root-directory "~/.emacs.d/ruby/cucumber/snippets/")
			     (yas/reload-all)))

(add-hook 'rinari-minor-mode-hook
	  (lambda ()
	    (if (and buffer-file-name
		     (string-match-p ".*[Ss]pec\.js" buffer-file-name))
		(jasmine-mode))))

(eval-after-load 'grep
  '(add-to-list 'grep-files-aliases (cons "rails" "*.rb *.erb *.js *.css *.scss")))

(add-to-list 'auto-mode-alist '("\\.scss\\'"      . css-mode))
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(add-hook 'feature-mode-hook
	  (lambda ()
	    (yas/minor-mode t)))

(provide 'rails-setup)
