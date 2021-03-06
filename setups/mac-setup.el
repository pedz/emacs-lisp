;;
;; Addition so that the txmt scheme is recognized.  This allows the
;; URLs that Merb puts in its stack trace back to work properly.
;;
(require 'url)

(defun mac-ae-get-url (event)
  "Open the URL specified by the Apple event EVENT.
Currently the `mailto' and `txmt' schemes are supported."
  (interactive "e")
  (let* ((ae (mac-event-ae event))
	 (the-text (mac-ae-text ae))
	 (parsed-url (url-generic-parse-url the-text))
	 (the-url-type (url-type parsed-url)))
    (case (intern the-url-type)
      (mailto
       (progn
	 (url-mailto parsed-url)
	 (select-frame-set-input-focus (selected-frame))))
      (txmt
       (let* ((not-used (string-match "txmt://open\\?url=file://\\([^&]*\\)\\(&line=\\([0-9]*\\)\\)?" the-text))
	      (file-name (match-string 1 the-text))
	      (lineno (match-string 3 the-text)))
	 (if (null file-name)
	     (message "Bad txmt URL: %s" the-text)
	   (find-file file-name)
	   (goto-char (point-min))
	   (if lineno
	       (forward-line (1- (string-to-number lineno))))
	   (select-frame-set-input-focus (selected-frame)))))
      (t (mac-resume-apple-event ae t)))))

(define-key global-map "\M-\`" 'ns-next-frame)
(define-key global-map "\M-~" 'ns-prev-frame)

(eval-after-load 'grep
  '(setq find-program "gfind"))

(provide 'mac-setup)
