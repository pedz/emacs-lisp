
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Basic concept stolen from Tim Visher
;; https://github.com/timvisher/.emacs.d/blob/master/timvisher/timvisher_package.el

(defvar pedz/my-packages '(yasnippet
			   magit
			   auto-complete))
(defun pedz/install-package-list (package-list)
  (dolist (p package-list)
    (when (not (package-installed-p p))
      (package-install p))))

(pedz/install-package-list pedz/my-packages)

(provide 'package-setup)
