
;; For now, lets just enable doxymacs all the time.

(require 'doxymacs)

(add-hook 'c-mode-common-hook 'doxymacs-mode)

;; - If you want Doxygen keywords fontified use M-x doxymacs-font-lock.
;;   To do it automatically, add the following to your .emacs:
;;
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
;;
;;   This will add the Doxygen keywords to c-mode and c++-mode only.
;;

(provide 'doxygen-setup)
