
;; nxhtml likds to set debug-on-error -- which I've grown to really
;; hate.
(let ((saved-debug-on-error debug-on-error))
  (load "~/.emacs.d/nxhtml/autostart.el")
  (setq debug-on-error saved-debug-on-error))

;; Added in rails-setup
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo))

(provide 'nxhtml-setup)
