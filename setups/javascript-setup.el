(autoload 'js2-mode "js2-mode" "Major mode for editing JavaScript code." t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))

;(autoload #'js-mode "js" "Start js-mode" t)
;(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(provide 'javascript-setup)
