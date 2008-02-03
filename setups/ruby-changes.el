;;
;; This function recognizes Ruby strings (or, that is the hope
;; anyway).
;;
;; ruby strings are more complex than can be matched by regular
;; expressions.  In particular, they can nest.  So, this is a string:
;; %( this is ( one ) string )
;;
;; Counting nestings requires a PDA, not a DFA.
;;
;; 1) "double quote string" # #{foo} expanded. \t, etc treated special
;; 2) 'single quote string' # #{foo} not expanded. \t, etc not treated special
;; 3) %w/ array of single quote strings /
;; 4) %W/ array of double quote string /
;; 5) %/ a double quoted string /
;; 6) %Q/ a double quoted string /
;; 7) %q/ a single quoted string /
;; 8) %x/ expanded text to execute /
;; 9) %r/ expanded text as regular expression /
;;
;; In forms 3 through 9, the / can be any character including
;; backslash and newline.  It can also be {, (, or [ which makes the
;; closing / be the matching }, ), or ] respectively.  And, in this
;; case, they nest (as described above).
;;
;; Forms 1, 4, 5, 6, 8, and 9 expand #{foo} to what foo evaluates to
;; and also converts \t, \r, etc to control characters.  The other
;; forms so not do this.  This may or may not be important in the code
;; that follows.  I don't know yet.
;;
;; The #{...} is a general expression which can have quoted strings
;; inside of it.  e.g. (>> are lines input to irb and the => is the
;; result)
;; >> foo = "hi"
;; >> "this is a string #{ foo + " there"} that is complex"
;; => "this is a string hi there that is complex"
;; But the 2, 3, and 7 forms still parse the pattern.  They just don't
;; expand it:
;; >> %q/this is a string #{ foo + " there"} that is complex/
;; => "this is a string \#{ foo + \" there\"} that is complex"
;;
;; Right now, it is two states represented by two functions.  The
;; start/stop state is represented by `ruby-string-start-matcher'.
;; The interim state is represented by `ruby-string-interim-matcher'
;;
;;                   ------------
;;		     |		 |
;;		  ---|  start /	 |<--
;;		  |  |	stop   	 |  |
;;		  |  |  	 |  |
;;		  |  ------------   |
;;     	       	{ |   	  ^    |    | #{
;;      pop state |   	" |    | "  | push state
;;		  |   	  |    V    |
;;		  |  ------------   |
;;		  |  |	       	 |  |
;;		  -->|  interim  |---
;;		     |		 |
;;		     ------------
;;
;; The double quote character above which moves from the start state
;; to interim state represent any of the sequences that start a Ruby
;; string.  This regular expression will be called
;; `ruby-string-beg-re'.
;;
;; The double quote character which moves from the interim state to
;; the start state is actually the proper matching character.
;;
;; While in the interim state, if the quote is a nesting type
;; character, i.e. <, (, {, or [, then open-paren and close-paren will
;; be set and interim will count the opens and closes and transition
;; to the start/stop state only when count is zero and the closing
;; paren is found.
;;
;; The function `ruby-string-vector' will be called at the time the
;; start state transitions to the interim state.  It will return a
;; three element vector [ closing quote, open paren, close paren ].
;;
;; If a #{ sequence is found while in the interim state, the current
;; state (represented by the current vector) will be pushed and the
;; state moved to the start/stop state.  This state begins fresh by
;; scanning looking for the `ruby-string-beg-re' but also knows to
;; look for the matching '}' character (while in this state).  If the
;; '}' character is found, the state machines will pop the current
;; state and move to the interim state.
;;
;; There is a special exception to the search for #{.  If the original
;; quote character is #, ie %#this is a string#, then the #{ pattern is
;; not recognized.
;;
;; When the transition from the interim state to the start/stop state
;; is done due to a matching quote, the function will return success
;; if the stack of states is empty.

(defconst ruby-string-beg-re
  "[\"'`]\\|%[rxwWqQ]?\\(?:\n\\|.\\)"
  "Regular expression that matches the start of a Ruby string")

(defconst ruby-backslash-re
  "\\(\\=\\|[^\\\\]\\)\\(\\\\\\\\\\)*"
  "Pattern that matches an even number (including 0) back slashes.
The logic is the pattern in the first parens matches either the
beginning of the line or something that is not a backslash.  The
second pattern matches pairs of back slashes.")

(defconst ruby-pushed-re
  (format "%s\\(%s\\|}\\)" ruby-backslash-re ruby-string-beg-re)
  "Pattern to search for in start state if stack is non-nil")

(defconst ruby-start-re
  (format "%s\\(%s\\)" ruby-backslash-re ruby-string-beg-re)
  "Pattern to search for in start state if stack is nil")

(defun ruby-buffer-match ( match-data nth )
  (buffer-substring (elt match-data (* 2 nth))
		    (elt match-data (+ (* 2 nth) 1))))

(defun ruby-string-vector ( substr )
  "Returns a list.  element 0 is the close quote character to match.
  This will be the closing matching paren.  element 1 is the
matching open paren if any.  element 2 is the regular expression
to use in the search"
  (let ((first-char (string-to-char substr)))
    (case first-char
      ;; For the normal quote characters
      ((?' ?\" ?`)
       ;; 0 is quote char, 1 is ni, the re is the quote or the #{
       ;; sequence.  Note that in all cases, the re has the
       ;; ruby-backslah-re prefixed so we properly understand a
       ;; sequence of backslashes.
       (list first-char nil (format "%s\\(%s\\|#{\\)" ruby-backslash-re substr)))
      ;; for the %/ type sequences...
      (t
       ;; For the other cases, the quote char is what is at the end of
       ;; substr.  The close paren we figure out or set to nil.  And
       ;; the re has three choices.  For quote char of # it is just
       ;; the quote char (#{ is not matched).  For quotes that nest,
       ;; the re is the quote char, the matching char, or #{.  And for
       ;; other characters it is the quote char or #{.
       (let* ((open-quote
	       (string-to-char (substring substr -1)))
	      (close-quote
	       (case open-quote
		 (?{ ?})
		 (?[ ?])
		 (?( ?))
		 (?< ?>)
		 (t nil)))
	      (re (if (eq open-quote ?#)
		      (format "%s\\(#\\)" ruby-backslash-re)
		    (if close-quote
			(format "%s\\(%c\\|%c\\|#{\\)"
				ruby-backslash-re open-quote close-quote)
		      (format "%s\\(%c\\|#{\\)"
			      ruby-backslash-re open-quote)))))
	 (if close-quote
	     (list close-quote open-quote re)
	   (list open-quote nil re)))))))

(defvar debug-count 0 "how many times to log trace to *Messages*")

(defun ruby-string-matcher ( limit )
  "Wrapper function to drive the state machine.  The states
described above are implemented as two functions.  (At least,
thats what I think I'm going to do)"
  (let* ((p (point))
	 (do-debug (if (> debug-count 0)
		       (progn
			 (setq debug-count (1- debug-count))
			 t)))
	 (result (if (ruby-string-start-matcher limit nil)
		     t
		   (goto-char p)
		   nil)))
    (if do-debug
	(progn
	  (message "string-matcher called: start-point=%s end-point=%s limit=%s result=%s match-data=%s" p (point) limit result (match-data))))
    result))

(defun ruby-string-start-matcher (limit state)
  "Represents the start/stop state as described above.  LIMIT is
the limit as passed to the matcher.  STATE is initial nil and t
when the function is called from `ruby-string-interim-matcher'
When STATE is true, the return value will be nil if the matching
} is not found and its position if it is found.  When STATE if
nil, the return is nil if a complete string is not found or the
end of the string when it is found.  We also set match-data
properly on the way out."
  (let ((result nil))
    (if state
	(while (and (null result)
		    (re-search-forward ruby-pushed-re limit t))
	  (let ((substr (match-string 3)))
	    ;; If we are in a pushed state and we find the matching },
	    ;; then set result to its position which will cause us to
	    ;; return
	    (if (string-equal substr "}")
		(setq result (match-end 3))
	      ;; Otherwise, we have found the start of a new string.
	      ;; We call interim matcher to find it.  If it returns
	      ;; null, it could not find the matching end.  In that
	      ;; case, move point to limit which will cause the next
	      ;; match to fail and we will return nil.  If interim
	      ;; finds the match, we just loop around and go again.
	      (if (null (ruby-string-interim-matcher limit substr))
		  (goto-char limit)))))
      ;; Not in a pushed state.  We want to return what the interim
      ;; state returns.  We do this by calling it and setting result
      ;; to its value.  We also move point to limit which will kick us
      ;; out of the loop in either case.
      (if (re-search-forward ruby-start-re limit t)
	  (let ((start-pos (match-beginning 3))
		(substr (match-string 3)))
	    (if (setq result (ruby-string-interim-matcher limit substr))
		;; happy return so set up match-data
		(store-match-data
		 (list start-pos result
		       start-pos (1+ start-pos) 
		       (1- result) result
		       (current-buffer)))))))
      ;; Return result
    result))

(defun ruby-string-interim-matcher ( limit quote-str )
  "Represents the interim state as described above.  This will
return nil if the matching quote was not found and will return
its position if it is."
  (let* ((open-count 0)
	(vector (ruby-string-vector quote-str))
	(close-quote (elt vector 0))
	(open-quote (elt vector 1))
	(re (elt vector 2))
	(result nil))
    (while (and (null result)
		(re-search-forward re limit t))
      (let* ((substr (match-string 3))
	     (first-char (string-to-char substr)))
	(cond
	 ;; If we matched #{, we push the state and call
	 ;; start-matcher.  If it returns null, we want to get out of
	 ;; the loop so we goto limit.  If it returns happy, we want to
	 ;; just keep looping looking for the end of the string.
	 ((string-equal substr "#{")
	  (if (null (ruby-string-start-matcher limit t))
	      (goto-char limit)))

	 ;; See if we found the close quote character.  If we did, we
	 ;; return happy if open-count is 0, otherwise, we decrement the
	 ;; open-count and keep searching.
	 ((eql close-quote first-char)
	  (if (eql open-count 0)
	      (setq result (match-end 3))
	    (setq open-count (1- open-count))))
	 ;; If we find the open quote, we increment the open open-count
	 ((eql open-quote first-char)
	  (setq open-count (1+ open-count))))))
    ;; Return result
    result))

;;;
;;; Now muck with the font lock variables to get this to work.
;;;

(setq ruby-font-lock-syntactic-keywords nil)
	;;;  ;; #{ }, #$hoge, #@foo are not comments
	;;;  ("\\(#\\)[{$@]" 1 (1 . nil))
	;;;  ;; the last $', $", $` in the respective string is not variable
	;;;  ;; the last ?', ?", ?` in the respective string is not ascii code
	;;;  ("\\(^\\|[\[ \t\n<+\(,=]\\)\\(['\"`]\\)\\(\\\\.\\|\\2\\|[^'\"`\n\\\\]\\)*?\\\\?[?$]\\(\\2\\)"
	;;;   (2 (7 . nil))
	;;;   (4 (7 . nil)))
	;;;  ;; $' $" $` .... are variables
	;;;  ;; ?' ?" ?` are ascii codes
	;;;  ("\\(^\\|[^\\\\]\\)\\(\\\\\\\\\\)*[?$]\\([#\"'`]\\)" 3 (1 . nil))
	;;;  ;; regexps
	;;;  ("\\(^\\|[=(,~?:;<>]\\|\\(^\\|\\s \\)\\(if\\|elsif\\|unless\\|while\\|until\\|when\\|and\\|or\\|&&\\|||\\)\\|g?sub!?\\|scan\\|split!?\\)\\s *\\(/\\)[^/\n\\\\]*\\(\\\\.[^/\n\\\\]*\\)*\\(/\\)"
	;;;   (4 (7 . ?/))
	;;;   (6 (7 . ?/)))
	;;;   ("^\\(=\\)begin\\(\\s \\|$\\)" 1 (7 . nil))
	;;;   ("^\\(=\\)end\\(\\s \\|$\\)" 1 (7 . nil))))

(setq ruby-font-lock-keywords
    (list
     ;; functions
     '("^\\s *def\\s +\\([^( \t\n]+\\)"
       1 font-lock-function-name-face)
     ;; keywords
     (cons (concat
	    "\\(^\\|[^_:.@$]\\|\\.\\.\\)\\b\\(defined\\?\\|\\("
	    (mapconcat
	     'identity
	     '("alias"
	       "and"
	       "begin"
	       "break"
	       "case"
	       "catch"
	       "class"
	       "def"
	       "do"
	       "elsif"
	       "else"
	       "fail"
	       "ensure"
	       "for"
	       "end"
	       "if"
	       "in"
	       "module"
	       "next"
	       "not"
	       "or"
	       "raise"
	       "redo"
	       "rescue"
	       "retry"
	       "return"
	       "then"
	       "throw"
	       "super"
	       "unless"
	       "undef"
	       "until"
	       "when"
	       "while"
	       "yield"
	       )
	     "\\|")
	    "\\)\\>\\)")
	   2)
     ;; variables
     '("\\(^\\|[^_:.@$]\\|\\.\\.\\)\\b\\(nil\\|self\\|true\\|false\\)\\>"
       2 font-lock-variable-name-face)
     ;; variables
     '("\\(\\$\\([^a-zA-Z0-9 \n]\\|[0-9]\\)\\)\\W"
       1 font-lock-variable-name-face)
     '("\\(\\$\\|@\\|@@\\)\\(\\w\\|_\\)+"
       0 font-lock-variable-name-face)
     ;; embedded document
     '(ruby-font-lock-docs
       0 font-lock-comment-face t)
     '(ruby-font-lock-maybe-docs
       0 font-lock-comment-face t)
     ;; "here" document
     '(ruby-font-lock-here-docs
       0 font-lock-string-face t)
     '(ruby-font-lock-maybe-here-docs
       0 font-lock-string-face t)
     `(,ruby-here-doc-beg-re
       0 font-lock-string-face t)
     ;; general delimited string
     '("\\(^\\|[[ \t\n<+(,=]\\)\\(%[xrqQwW]?\\([^<[{(a-zA-Z0-9 \n]\\)[^\n\\\\]*\\(\\\\.[^\n\\\\]*\\)*\\(\\3\\)\\)"
       (2 font-lock-string-face))
     ;; constants
     '("\\(^\\|[^_]\\)\\b\\([A-Z]+\\(\\w\\|_\\)*\\)"
       2 font-lock-type-face)
     ;; symbols
     '("\\(^\\|[^:]\\)\\(:\\([-+~]@?\\|[/%&|^`]\\|\\*\\*?\\|<\\(<\\|=>?\\)?\\|>[>=]?\\|===?\\|=~\\|\\[\\]=?\\|\\(\\w\\|_\\)+\\([!?=]\\|\\b_*\\)\\|#{[^}\n\\\\]*\\(\\\\.[^}\n\\\\]*\\)*}\\)\\)"
       2 font-lock-reference-face)
     ;; expression expansion
     '("#\\({[^}\n\\\\]*\\(\\\\.[^}\n\\\\]*\\)*}\\|\\(\\$\\|@\\|@@\\)\\(\\w\\|_\\)+\\)"
       0 font-lock-variable-name-face t)
     ;; my new string thingy
     '(ruby-string-matcher 0 font-lock-string-face t)
     ;; warn lower camel case
     ;'("\\<[a-z]+[a-z0-9]*[A-Z][A-Za-z0-9]*\\([!?]?\\|\\>\\)"
     ;  0 font-lock-warning-face)
     ))

(defun temp-debug ( )
  (interactive)
  (if (ruby-string-matcher (point-max))
      (princ (match-data))
    (princ nil)))

(defun temp-get-face ()
  (interactive)
  (message "%s" (text-properties-at (point))))
