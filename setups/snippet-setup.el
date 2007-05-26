
(require 'snippet)

(add-hook 'snippet-cleanup-hook 'llasram/mmm-parse-buffer-maybe)
(defun llasram/mmm-parse-buffer-maybe ()
  (when mmm-mode
    (mmm-parse-buffer)))

(provide 'snippet-setup)
