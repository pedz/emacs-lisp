
;;; RAILS init begin
;; Some of the emacs-rails stuff
(require 'rails-lib)
(require 'rails-ui)
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

(provide 'rails-setup)
