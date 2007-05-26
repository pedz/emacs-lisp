
(require 'retain)

;;;###autoload
(defun Defect ( num arg )
  "Gets the long version of a defect number"
  (interactive (append (find-pmr "Defect: ") (list current-prefix-arg )))
  (retain-common (concat "Defect " num) "Defect" (list "-view" num "-long" )
		 num arg))

;;;###autoload
(defun Feature ( num arg )
  "Gets the long version of a feature number"
  (interactive (append (find-pmr "Feature: ") (list current-prefix-arg )))
  (retain-common (concat "Feature " num) "Feature" (list "-view" num "-long" )
		 num arg))

;;;###autoload
(defun Apar ( num arg )
  "Gets the long version of a apar number"
  (interactive (append (find-pmr "Apar: ") (list current-prefix-arg )))
  (retain-common (concat "Apar " num) "A" (list num ) num arg))

;;;###autoload
(defun Track ( num arg )
  "Gets the long version of the tracks for a defect"
  (interactive (append (find-pmr "Track: ") (list current-prefix-arg )))
  (retain-common (concat "Track " num) "Track"
		 (list "-view" "-defect" num "-long") num arg))

;;;###autoload
(defun Changes ( num arg )
  "Gets the changes for a defect"
  (interactive (append (find-pmr "Changes: ") (list current-prefix-arg )))
  (retain-common (concat "Changes " num) "Changes" (list num ) num arg))

;;;###autoload
(defun Prs ( fname arg )
  "Gets the changes for a file"
  (interactive (append (find-pmr "Prs: ") (list current-prefix-arg )))
  (retain-common (concat "Prs " fname) "Prs" (list fname ) fname arg))

(provide 'orbit)
