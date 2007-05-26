;;
;; I'm, thinking this is not used anywhere
;;

(fmakunbound 'c-mode)
(makunbound  'c-mode-map)
(fmakunbound 'c++-mode)
(makunbound  'c++-mode-map)
(makunbound  'c-style-alist)
(autoload 'c++-mode  "cc-mode" "C++ Editing Mode" t)
(autoload 'c-mode    "cc-mode" "C Editing Mode" t)
(autoload 'objc-mode "cc-mode" "Objective-C Editing Mode" t)
(setq c-mode-common-hook (function
			  (lambda ()
			    (c-set-style "BSD"))))
(provide 'pedz-cc)
