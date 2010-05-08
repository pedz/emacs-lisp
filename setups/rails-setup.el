
(require 'rails)

(autoload 'speedbar-make-specialized-keymap "speedbar")

(defvar rails-project-stop-regexp
  "\\`/\\.\\.\\./\\'"
  "Regexp that will stop the search up the directory tree for
  config/environment.rb")

(defun rails-project:root ()
  "Return RAILS_ROOT if this file is a part of a Rails application,
else return nil"
  (let ((curdir (expand-file-name default-directory))
        (max 10)
        (found nil))
    (while (and (not found)
		(> max 0)
		(not (string-match rails-project-stop-regexp curdir)))
      (progn
        (if (file-exists-p (concat curdir "config/environment.rb"))
            (progn
              (setq found t))
          (progn
            (setq curdir (expand-file-name (concat curdir "../")))
            (setq max (- max 1))))))
    (if found (expand-file-name curdir))))

(defun load-log-file ()
  (interactive)
  (widen)
  (ansi-color-apply-on-region (point-min) (point-max))
  (not-modified)
  (toggle-read-only t))

;;; The require rails above pulls in ruby mode and tons of other
;;; stuff.  I load my changes to ruby-mode at this time.
;;; (load "ruby-changes")

;;;  
;;;  (setq ri-ruby-script (expand-file-name "~/.emacs.d/ruby/ri-emacs/ri-emacs.rb"))
;;;  (autoload 'ri "ri-ruby" nil t)
;;;  
;;;  (autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)
;;;  (setq auto-mode-alist  (cons '("\\.rhtml$" . html-mode) auto-mode-alist))
;;;  
;;;  (modify-coding-system-alist 'file "\\.rb$" 'utf-8)
;;;  (modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)
;;;  
;;;  ;; Ruby mode
;;;  ;; (require 'ruby-mode)
;;;  ;; (require 'ruby-electric)
;;;  ;; (require 'inf-ruby)
;;;  ;; (require 'rubydb)
;;;  ;; (load "ri-ruby")
;;;  
;;;  ;; Set those modes!
;;;  (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
;;;  (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
;;;  (add-to-list 'auto-mode-alist '("\\(?:^\\|/\\)Rakefile$" . ruby-mode))
;;;  (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
;;;  (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
;;;  
;;;  ;; Like c-in-literal, only for Ruby
;;;  (defun ruby-in-literal ()
;;;    (let* ((here (point))
;;;           (state (save-excursion
;;;                    (ruby-beginning-of-defun)
;;;                    (parse-partial-sexp (point) here))))
;;;      (or (nth 3 state)
;;;          (nth 4 state)
;;;          nil)))
;;;  
;;;  ;; Like c-electric-backspace, only for Ruby
;;;  (defun ruby-electric-backspace (arg)
;;;    (interactive "*P")
;;;    (if (or arg (ruby-in-literal))
;;;        (backward-delete-char-untabify (prefix-numeric-value arg))
;;;      (let ((here (point)))
;;;        (skip-chars-backward " \t\n")
;;;        (if (/= (point) here)
;;;            (delete-region (point) here)
;;;          (backward-delete-char-untabify 1)))))
;;;  
;;;  (defun ruby-electric-delete (arg)
;;;    (interactive "*P")
;;;    (if (or arg (ruby-in-literal))
;;;        (backward-delete-char-untabify (- (prefix-numeric-value arg)))
;;;      (let ((here (point)))
;;;        (skip-chars-forward " \t\n")
;;;        (if (/= (point) here)
;;;            (delete-region (point) here)
;;;          (backward-delete-char-untabify -1)))))
;;;  
;;;  ;; Pipe the current buffer through mfp's xmpfilter
;;;  (defun ruby-annotate-buffer ()
;;;    "Send the current current buffer to the annotation filter."
;;;    (interactive "*")
;;;    (let ((initial-line (count-lines (point-min) (point)))
;;;          (initial-char (- (point) (point-at-bol))))
;;;      (shell-command-on-region (point-min) (point-max) "xmpfilter.rb -a" nil t)
;;;      (goto-line initial-line)
;;;      (forward-char initial-char)))
;;;  
;;;  ;; Redefine this ruby-electric function so that we can use
;;;  ;; ruby-electric-space w/o the minor mode (which doesn't play nice w/
;;;  ;; multiple major modes).
;;;  (defun ruby-electric-code-at-point-p()
;;;    (let* ((properties (text-properties-at (point))))
;;;      (and (null (memq 'font-lock-string-face properties))
;;;           (null (memq 'font-lock-comment-face properties)))))
;;;  
;;;  ;; Continuation lines should be indented.  Make it so, commander.
;;;  (defadvice ruby-calculate-indent
;;;    (after ruby-indent-continuation-lines activate)
;;;    "Advise ruby-mode to further indent continuation lines."
;;;    (save-excursion
;;;      (goto-char (point-at-bol))
;;;      (skip-chars-backward " \t\n")
;;;      (when (eq ?\\ (char-before))
;;;        (setq ad-return-value (+ ruby-indent-level ad-return-value)))))
;;;  
;;;  ;; Add the Unit::Test output to the list of regexps understood by the
;;;  ;; compile buffer
;;;  (add-to-list 'compilation-error-regexp-alist
;;;               '("\\(\\./[^:]*\\):\\([0-9]*\\)" 1 2))
;;;  ;; (REGEXP FILE-IDX LINE-IDX
;;;  ;(setq compilation-error-regexp-alist (cdr compilation-error-regexp-alist))
;;;  
;;;  ;; MMM class for working with erb
;;;  (mmm-add-classes
;;;   '((erb-code
;;;      :submode ruby-mode
;;;      :match-face (("<%#" . mmm-comment-submode-face)
;;;                   ("<%=" . mmm-output-submode-face)
;;;                   ("<%"  . mmm-code-submode-face))
;;;      :front "<%[#=]?" 
;;;      :back "-?%>" 
;;;      :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
;;;               (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
;;;               (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @)))))
;;;  
;;;  ;; Use MMM mode in here-docs [not for now]
;;;  ;;;(mmm-add-mode-ext-class 'ruby-mode "\\.rb$" 'here-doc)
;;;  
;;;  ;; Hide-show
;;;  (add-to-list 'hs-special-modes-alist
;;;    (list 'ruby-mode
;;;          (concat "\\(^\\s-*"
;;;                  ruby-electric-simple-keywords-re
;;;                  "\\|{\\|\\[\\)")
;;;          "end\\|\\]\\|}" "#"
;;;          'ruby-forward-sexp nil))
;;;  
;;;  ;; Alignment
;;;  (add-to-list 'align-rules-list
;;;               '(ruby-comma-delimiter
;;;                 (regexp . ",\\(\\s-*\\)[^# \t\n]")
;;;                 (repeat . t)
;;;                 (modes  . '(ruby-mode))))
;;;  (add-to-list 'align-rules-list
;;;               '(ruby-hash-literal
;;;                 (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
;;;                 (repeat . t)
;;;                 (modes  . '(ruby-mode))))
;;;  
;;;  ;; Snippets
;;;  (eval-and-compile
;;;    (snippet-with-abbrev-table
;;;     'ruby-mode-abbrev-table
;;;     ("inj" . "$>inject($${[]}) do |$${memo}, $${item}|\n$>$.\nend$>")
;;;     ("def" . "$>def $${method}($${*args})\n$>$.\nend$>")
;;;     ("dt"  . "$>def test_$${method}\n$>$.\nend$>")))
;;;  
;;;  ;; Some ruby-specific key-bindings
;;;  (add-hook 'ruby-mode-hook 'llasram/ruby-extra-keys)
;;;  (defun llasram/ruby-extra-keys ()
;;;    (define-key ruby-mode-map "\C-m"      'newline-and-indent)
;;;    (define-key ruby-mode-map " "         'ruby-electric-space)
;;;    ;
;;;    ; I think you're nuts to redefine C-h
;;;    ;
;;;    ; (define-key ruby-mode-map [backspace] 'ruby-electric-backspace)
;;;    ; (define-key ruby-mode-map "\C-h"      'ruby-electric-backspace)
;;;    (define-key ruby-mode-map [delete]    'ruby-electric-delete)
;;;    (define-key ruby-mode-map "\C-d"      'ruby-electric-delete)
;;;    (define-key ruby-mode-map "\C-c\C-a"  'ruby-annotate-buffer))
;;;  

(provide 'rails-setup)
