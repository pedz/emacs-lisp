
;; nxhtml likds to set debug-on-error -- which I've grown to really
;; hate.
(let ((saved-debug-on-error debug-on-error))
  (load "~/.emacs.d/nxhtml-834/main/autostart.el")
  (setq debug-on-error saved-debug-on-error))

;; Added in rails-setup
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

(add-hook 'nxml-mode-hook 
	  (function (lambda()
		      (require 'whattf-dt)
		      )))

(provide 'nxhtml-setup)
