;; Hook to trigger yasnappits and jasmine mode within the spec.js
;; files.

(require 'grep)

(defun jasmine-mode ()
  "Not really a 'mode'"
  (interactive)
  (js-mode)
  (yas/minor-mode t)
  (setq yas/mode-symbol 'jasmine))

(add-hook 'rinari-minor-mode-hook
	  #'(lambda ()
	      (if (and buffer-file-name
		       (string-match-p ".*[Ss]pec\.js" buffer-file-name))
		  (jasmine-mode))
	      (require 'nxhtml-setup)
	      (require 'cucumber-mode-compilation)
	      (require 'ruby-compilation-rspec)))

;; Used by rgrep.  Now you can say "rails" for the files prompt and
;; get the files with these suffixs
(add-to-list 'grep-files-aliases (cons "rails" "*.rb *.erb *.js *.css *.scss"))

(add-to-list 'auto-mode-alist '("\\.scss\\'"      . css-mode))
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(add-hook 'feature-mode-hook
	  '(lambda ()
	     (add-to-list 'yas/root-directory "~/.emacs.d/ruby/cucumber/snippets/")
	     (yas/reload-all)
	     (yas/minor-mode t)))

(provide 'rails-setup)
