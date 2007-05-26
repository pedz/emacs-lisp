;; ---------------------------------------------------------------------------
;; XML/SGML - PSGML
;;
;;   First, we'll just set up PSGML. Then we'll create a derived mode for
;;   (X)HTML using mmm-mode for fancy (X)HTML/CSS/Javascript/PHP coding

(autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t )
(autoload 'xml-mode "psgml" "Major mode to edit XML files." t)

(setq auto-mode-alist
  (append
  (list
    '("\\.sgm$" . sgml-mode)
    '("\\.sgml$" . sgml-mode)
    '("\\.xml$" . xml-mode)
    )
  auto-mode-alist))

;; Enable editing help with mouse-3 in all sgml files

(defun go-bind-markup-menu-to-mouse3 ()
        (define-key sgml-mode-map [(down-mouse-3)] 'sgml-tags-menu))
(add-hook 'sgml-mode-hook 'go-bind-markup-menu-to-mouse3)

;; Syntax Highlighting
;; xxml.el for better syntax highlighting (although we won't use xxml.el's
;; html-mode, but will define our own).

; (autoload 'html-mode "xxml" "Major mode to edit HTML files." t)
(autoload 'xxml-mode-routine "xxml")
(add-hook 'sgml-mode-hook 'xxml-mode-routine)
(add-hook 'xml-mode-hook 'xxml-mode-routine)

;; create faces to assign to markup categories

(make-face 'sgml-comment-face)
(make-face 'sgml-start-tag-face)
(make-face 'sgml-end-tag-face)
(make-face 'sgml-entity-face)
(make-face 'sgml-doctype-face) ; DOCTYPE data
(make-face 'sgml-ignored-face) ; data ignored by PSGML
(make-face 'sgml-ms-start-face) ; marked sections start
(make-face 'sgml-ms-end-face) ; end of marked section
(make-face 'sgml-pi-face) ; processing instructions
(make-face 'sgml-sgml-face) ; the SGML declaration
(make-face 'sgml-shortref-face) ; short references

;; assign faces to markup categories

(setq sgml-markup-faces '
  (
  (comment . sgml-comment-face)
  (start-tag . sgml-start-tag-face)
  (end-tag . sgml-end-tag-face)
  (entity . sgml-entity-face)
  (doctype . sgml-doctype-face)
  (ignored . sgml-ignored-face)
  (ms-start . sgml-ms-start-face)
  (ms-end . sgml-ms-end-face)
  (pi . sgml-pi-face)
  (sgml . sgml-sgml-face)
  (shortref . sgml-shortref-face)
  ))

;; tell PSGML to pay attention to face settings

(setq sgml-set-face t)

;; Set up "DTD->Insert DTD" menu.

(setq sgml-custom-dtd
  '(
    ( "HTML 4.01 Strict"
      "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01//EN\"\n \"http://www.w3.org/TR/html4/strict.dtd\">"
      sgml-declaration "~/emacs/lib/DTD/html401/HTML4.decl"
      sgml-default-dtd-file "~/emacs/lib/DTD/html401/strict.ced"
      mode sgml-html )
    ( "HTML 4.01 Transitional"
      "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"\n \"http://www.w3.org/TR/html4/loose.dtd\">"
      sgml-declaration "~/emacs/lib/DTD/html401/HTML4.decl"
      sgml-default-dtd-file "~/emacs/lib/DTD/html401/loose.ced" 
      mode sgml-html )
    ( "HTML 4.01 Frameset"
      "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\"\n \"http://www.w3.org/TR/html4/frameset.dtd\">"
      sgml-declaration "~/emacs/lib/DTD/html401/HTML4.decl"
      sgml-default-dtd-file "~/emacs/lib/DTD/html401/frameset.ced" 
      mode sgml-html )
    ( "XHTML 1.0 Strict"
      "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\"\n \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"
      sgml-default-dtd-file "~/emacs/lib/DTD/xhtml1/xhtml1-strict.ced" 
      mode xml-html )
    ( "XHTML 1.0 Transitional"
      "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\"\n \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"
      sgml-default-dtd-file "~/emacs/lib/DTD/xhtml1/xhtml1-transitional.ced" 
      mode xml-html )
    ( "XHTML 1.0 Frameset"
      "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\"\n \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">"
      sgml-default-dtd-file "~/emacs/lib/DTD/xhtml1/xhtml1-frameset.ced" 
      mode xml-html )
    ( "XHTML 1.1"
      "<?xml version=\"1.0\"?>\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"\n \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">"
      sgml-default-dtd-file "~/emacs/lib/DTD/xhtml11/xhtml11.ced" 
      mode xml-html )
  )
)
    
;; ecat support

(setq sgml-ecat-files
  (list
    (expand-file-name "~/emacs/lib/DTD/ecatalog")
  )
)

;; ---------------------------------------------------------------------------
;; (X)HTML - PSGML with MMM Mode for CSS, Javascript and PHP support

(define-derived-mode xml-html-mode xml-mode "XHTML"
  "This version of html mode is just a wrapper around xml mode."
  (make-local-variable 'sgml-declaration)
  (make-local-variable 'sgml-default-doctype-name)
  (setq
   sgml-default-doctype-name    "html"
   sgml-declaration             "/usr/share/sgml/xml.dcl"
   sgml-always-quote-attributes t
   sgml-indent-step             2
   sgml-indent-data             t
   sgml-minimize-attributes     nil
   sgml-omittag                 nil
   sgml-shorttag                nil
   )
  )

(define-derived-mode sgml-html-mode sgml-mode "HTML"
  "This version of html mode is just a wrapper around sgml mode."
  (make-local-variable 'sgml-declaration)
  (make-local-variable 'sgml-default-doctype-name)
  (setq
   sgml-default-doctype-name    "html"
   sgml-declaration             "~/emacs/lib/DTD/html401/HTML4.decl"
   sgml-always-quote-attributes t
   sgml-indent-step             2
   sgml-indent-data             t
   sgml-minimize-attributes     nil
   sgml-omittag                 nil
   sgml-shorttag                nil
   )
  )

;; PHP-Mode
(require 'php-mode)
(add-hook 'php-mode-user-hook 'turn-on-font-lock)

;; CSS-Mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-indent-level '2)

;; javascript-generic-mode
(require 'generic-x)

;; MMM-Mode
(require 'mmm-auto)
(setq mmm-global-mode 'maybe)

;; Set up an mmm group for fancy html editing
(mmm-add-group
 'fancy-html
 '(
         (html-php-embedded
                :submode php-mode
                :face mmm-output-submode-face
                :front "<[?]php"
                :back "[?]>")
         (html-css-embedded
                :submode css-mode
                :face mmm-declaration-submode-face
                :front "<style\[^>\]*>"
                :back "</style>")
         (html-css-attribute
                :submode css-mode
                :face mmm-declaration-submode-face
                :front "\\bstyle=\\s-*\""
                :back "\"")
         (html-javascript-embedded
                :submode javascript-generic-mode
                :face mmm-code-submode-face
                :front "<script\[^>\]*>"
                :back "</script>")
         (html-javascript-attribute
                :submode javascript-generic-mode
                :face mmm-code-submode-face
                :front "\\bon\\w+=\\s-*\""
                :back "\"")
   )
)

;; What files to invoke the new html-mode for?
;;   HTML and XHTML tend to have the same file extensions. However, XHTML
;;   hopefully has either one or both of <?xml or W3C//DTD XHTML near the
;;   beginning. So we default to sgml-html-mode and then add a hook to
;;   sgml-html-mode to check for either of those strings and switch to
;;   xml-html-mode if it finds them.

(add-to-list 'auto-mode-alist '("\\.inc\\'" . sgml-html-mode))
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'" . sgml-html-mode))
(add-to-list 'auto-mode-alist '("\\.[sj]?html?\\'" . sgml-html-mode))

(add-hook 'sgml-html-mode-hook 'guess-xhtml-hook t)

(defun guess-xhtml-hook ()
  "Guess whether the current buffer is XHTML."
  (when 
    (save-excursion 
      (search-forward-regexp "<[?]xml\\|//W3C//DTD XHTML" 80 t))
    (xml-html-mode)
    ))

;; Make smgl-html-mode and xml-html-mode use fancy-html
(add-to-list 'mmm-mode-ext-classes-alist '(sgml-html-mode nil fancy-html))
(add-to-list 'mmm-mode-ext-classes-alist '(xml-html-mode nil fancy-html))

;; Use tidy.el to provide support for tidy
(autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)
(autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)
(autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)
(autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)
(add-hook 'sgml-html-mode-hook #'(lambda () (tidy-build-menu sgml-html-mode-map)))
(add-hook 'xml-html-mode-hook #'(lambda () (tidy-build-menu xml-html-mode-map)))

;; Customizing

(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(sgml-always-quote-attributes t t)
 '(sgml-angle-distance 4000 t)
 '(sgml-auto-activate-dtd t t)
 '(sgml-auto-insert-required-elements t t)
 '(sgml-balanced-tag-edit t t)
 '(sgml-buggy-subst-char-in-region nil t)
 '(sgml-custom-markup nil t)
 '(sgml-declaration "~/emacs/lib/DTD/html401/HTML4.decl" t)
 '(sgml-default-doctype-name nil t)
 '(sgml-default-dtd-file nil t)
 '(sgml-doctype nil t)
 '(sgml-exposed-tags nil t)
 '(sgml-general-insert-case (quote lower) t)
 '(sgml-ignore-undefined-elements nil t)
 '(sgml-indent-data t t)
 '(sgml-indent-step 2 t)
 '(sgml-insert-defaulted-attributes nil t)
 '(sgml-insert-end-tag-on-new-line nil t)
 '(sgml-insert-missing-element-comment nil t)
 '(sgml-leave-point-after-insert nil t)
 '(sgml-live-element-indicator t t)
 '(sgml-local-catalogs nil t)
 '(sgml-local-ecat-files nil t)
 '(sgml-max-menu-size 48 t)
 '(sgml-minimize-attributes nil t)
 '(sgml-namecase-general t t)
 '(sgml-normalize-trims t t)
 '(sgml-offer-save t t)
 '(sgml-omittag nil t)
 '(sgml-omittag-transparent t t)
 '(sgml-parent-document nil t)
 '(sgml-range-indicator-max-length 9 t)
 '(sgml-recompile-out-of-date-cdtd (quote ask) t)
 '(sgml-set-face t t)
 '(sgml-shorttag nil t)
 '(sgml-slash-distance 1000 t)
 '(sgml-system-identifiers-are-preferred nil t)
 '(sgml-tag-region-if-active nil t)
 '(sgml-trace-entity-lookup nil t)
 '(sgml-validate-command "nsgmls -s %s %s")
 '(sgml-warn-about-undefined-elements t t)
 '(sgml-warn-about-undefined-entities t t)
 '(sgml-xml-declaration "/usr/share/sgml/xml.dcl" t)
 '(sgml-xml-validate-command "nsgmls -wxml -s %s %s" t)
 '(sgml-catalog-files "~/emacs/lib/DTD/catalog")
)

(provide 'psgml-setup)
