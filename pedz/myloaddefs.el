;;; myloaddefs.el --- automatically extracted autoloads
;;
;;; Code:

;;;### (autoloads (amrita-mode) "amrita" "../nxhtml/related/amrita.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/amrita.el

(autoload 'amrita-mode "amrita" "\
A major mode for editing Amrita files.

\(fn)" t nil)

;;;***

;;;### (autoloads (cancel-secondary-selection set-secondary-selection
;;;;;;  anchored-transpose) "anchored-transpose" "../nxhtml/util/anchored-transpose.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/anchored-transpose.el

(autoload 'anchored-transpose "anchored-transpose" "\
Transpose portions of the region around an anchor phrase.

`this phrase but not that word'    can be transposed into
`that word but not this phrase'

I want this phrase but not that word.
       |----------------------------|. .This is the entire phrase.
                  |-------|. . . . . . .This is the anchor phrase.

First select the entire phrase and type \\[anchored-transpose].
This set the secondary selection.

Then select the anchor phrase and type \\[anchored-transpose]
again.  Alternatively you can do the selections like this:

I want this phrase but not that word.
       |----------|       |---------|   Separate phrase selection.

By default the anchor phrase will automatically include
any surrounding whitespace even if you don't explicitly select
it.  Also, it won't include certain trailing punctuation.  See
`anchored-transpose-do-fuzzy' for details.  A prefix arg prior to
either selection means `no fuzzy logic, use selections
literally'.

You can select the regions to be swapped separately in any
order.

After swapping both primary and secondary selection are still
active.  They will be canceled after second next command if you
do not swap regions again.  (Second because this allow you to
adjust the regions and try again.)

You can also swap text between different buffers this way.

Typing \\[anchored-transpose] with nothing selected clears any
prior selection, ie secondary selection.

\(fn BEG1 END1 FLG1 &optional BEG2 END2 FLG2 WIN2)" t nil)

(autoload 'set-secondary-selection "anchored-transpose" "\
Set the secondary selection to the current region.
This must be bound to a mouse drag event.

\(fn BEG END)" t nil)

(autoload 'cancel-secondary-selection "anchored-transpose" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (appmenu-mode appmenu-add appmenu) "appmenu" "../nxhtml/util/appmenu.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/appmenu.el

(let ((loads (get 'appmenu 'custom-loads))) (if (member '"appmenu" loads) nil (put 'appmenu 'custom-loads (cons '"appmenu" loads))))

(autoload 'appmenu-add "appmenu" "\
Add entry to `appmenu-alist'.
Add an entry to this list with ID, PRIORITY, TEST, TITLE and
DEFINITION as explained there.

\(fn ID PRIORITY TEST TITLE DEFINITION)" nil nil)

(defvar appmenu-mode nil "\
Non-nil if Appmenu mode is enabled.
See the command `appmenu-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `appmenu-mode'.")

(custom-autoload 'appmenu-mode "appmenu" nil)

(autoload 'appmenu-mode "appmenu" "\
Use a context sensitive popup menu.
AppMenu (appmenu.el) is a framework for creating cooperative
context sensitive popup menus with commands from different major
and minor modes. Using this different modes may cooperate about
the use of popup menus.

There is also the command `appmenu-as-help' that shows the key
bindings at current point in the help buffer.

The popup menu and the help buffer version are on these keys:

\\{appmenu-mode-map}

The variable `appmenu-alist' is where the popup menu entries
comes from.

If there is a `keymap' property at point then relevant bindings
from this is also shown in the popup menu.

You can write functions that use whatever information you want in
Emacs to construct these entries. Since this information is only
collected when the popup menu is shown you do not have to care as
much about computation time as for entries in the menu bar.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (as-external-mode as-external-for-wiki as-external-for-el-files
;;;;;;  as-external-check-contents as-external-for-mail-mode as-external-for-xhtml
;;;;;;  as-external) "as-external" "../nxhtml/util/as-external.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/as-external.el

(let ((loads (get 'as-external 'custom-loads))) (if (member '"as-external" loads) nil (put 'as-external 'custom-loads (cons '"as-external" loads))))

(autoload 'as-external-for-xhtml "as-external" "\
Setup for Firefox addon It's All Text to edit XHTML.
It's All Text is a Firefox add-on for editing textareas with an
external editor.
See URL `https://addons.mozilla.org/en-US/firefox/addon/4125'.

In this case Emacs is used to edit textarea fields on a web page.
The text will most often be part of a web page later, like on a
blog.  Therefore turn on these:

- `nxhtml-mode' since some XHTML tags may be allowed.
- `nxhtml-validation-header-mode' since it is not a full page.
- `wrap-to-fill-column-mode' to see what you are writing.
- `html-write-mode' to see it even better.

Also bypass the question for line end conversion when using
emacsw32-eol.

\(fn)" t nil)

(autoload 'as-external-for-mail-mode "as-external" "\
Setup for Firefox addon It's All Text to edit mail.
Set normal mail comment markers in column 1 (ie >).

Set `fill-column' to 90 and enable `wrap-to-fill-column-mode' so
that it will look similar to how it will look in the sent plain
text mail.

See also `as-external-mode'.

\(fn)" t nil)

(autoload 'as-external-check-contents "as-external" "\
Try to guess the file contents.

\(fn)" nil nil)

(autoload 'as-external-for-el-files "as-external" "\
Setup for Firefox addon It's All Text to edit MediaWikis.

\(fn)" t nil)

(autoload 'as-external-for-wiki "as-external" "\
Setup for Firefox addon It's All Text to edit MediaWikis.

\(fn)" t nil)

(defvar as-external-mode nil "\
Non-nil if As-External mode is enabled.
See the command `as-external-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `as-external-mode'.")

(custom-autoload 'as-external-mode "as-external" nil)

(autoload 'as-external-mode "as-external" "\
If non-nil check if Emacs is called as external editor.
When Emacs is called as an external editor for example to edit
text areas on a web page viewed with Firefox this library tries
to help to setup the buffer in a useful way. It may for example
set major and minor modes for the buffer.

This can for example be useful when blogging or writing comments
on blogs.

See `as-external-alist' for more information.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (buffer-bg-set-color) "buffer-bg" "../nxhtml/util/buffer-bg.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/buffer-bg.el

(autoload 'buffer-bg-set-color "buffer-bg" "\
Add an overlay with background color COLOR to buffer BUFFER.
If COLOR is nil remove previously added overlay.

\(fn COLOR BUFFER)" t nil)

;;;***

;;;### (autoloads (chartg-make-chart chartg-complete) "chartg" "../nxhtml/util/chartg.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/chartg.el

(autoload 'chartg-complete "chartg" "\
Not documented

\(fn)" t nil)

(autoload 'chartg-make-chart "chartg" "\
Try to make a new chart.
If region is active then make a new chart from data in the
selected region.

Else if current buffer is in `chartg-mode' then do it from the
chart specifications in this buffer.  Otherwise create a new
buffer and initialize it with `chartg-mode'.

If the chart specifications are complete enough to make a chart
then do it and show the resulting chart image.  If not then tell
user what is missing.

NOTE: This is beta, no alpha code. It is not ready.

Below are some examples.  To test them mark an example and do

  M-x chartg-make-chart

* Example, simple x-y chart:

  Output-file: \"~/temp-chart.png\"
  Size: 200 200
  Data: 3 8 5 | 10 20 30
  Type: line-chartg-xy

* Example, pie:

  Output-file: \"~/temp-depression.png\"
  Size: 400 200
  Data:
  2,160,000
  3,110,000
  1,510,000
  73,600
  775,000
  726,000
  8,180,000
  419,000
  Type: pie-3-dimensional
  Chartg-title: \"Depression hits on Google\"
  Legends:
  \"SSRI\"
  | \"Psychotherapy\"
  | \"CBT\"
  | \"IPT\"
  | \"Psychoanalysis\"
  | \"Mindfulness\"
  | \"Meditation\"
  | \"Exercise\"


* Example, pie:

  Output-file: \"~/temp-panic.png\"
  Size: 400 200
  Data:
  979,000
  969,000
  500,000
  71,900
  193,000
  154,000
  2,500,000
  9,310,000
  Type: pie-3-dimensional
  Chartg-title: \"Depression hits on Google\"
  Legends:
  \"SSRI\"
  | \"Psychotherapy\"
  | \"CBT\"
  | \"IPT\"
  | \"Psychoanalysis\"
  | \"Mindfulness\"
  | \"Meditation\"
  | \"Exercise\"


* Example using raw:

  Output-file: \"~/temp-chartg-slipsen-kostar.png\"
  Size: 400 130
  Data: 300 1000 30000
  Type: bar-chartg-horizontal
  Chartg-title: \"Vad killen i slips tjänar jämfört med dig och mig\"
  Google-chartg-raw: \"&chds=0,30000&chco=00cd00|ff4500|483d8b&chxt=y,x&chxl=0:|Killen+i+slips|Partiledarna|Du+och+jag&chf=bg,s,ffd700\"


\(fn)" t nil)

;;;***

;;;### (autoloads (x-cscope-no-op x-c-mode-cscope-func x-c-mode-cscope-sym
;;;;;;  x-cscope-view-from-list x-cscope-goto-from-list-other-window
;;;;;;  x-cscope-goto-from-list cscope-find-goodies cscope-format
;;;;;;  cscope-wait cscope-init-process cscope-new-process cscope-bananas-are-fun
;;;;;;  cscope-ipf-process cscope-61F-process cscope-61D-process
;;;;;;  cscope-61B-process cscope-610-process cscope-53S-process
;;;;;;  cscope-53Q-process cscope-53N-process cscope-53L-process
;;;;;;  cscope-53J-process cscope-53H-process cscope-53E-process
;;;;;;  cscope-53D-process cscope-53A-process cscope-530-process
;;;;;;  cscope-52S-process cscope-52Q-process cscope-52M-process
;;;;;;  cscope-52L-process cscope-52I-process cscope-52H-process
;;;;;;  cscope-52F-process cscope-52B-process cscope-520-process
;;;;;;  cscope-view-from-list cscope-goto-from-list cscope-get-line-number
;;;;;;  cscope-find-assignment cscope-find-file-include cscope-find-file
;;;;;;  cscope-find-pattern cscope-find-string cscope-find-func-call
;;;;;;  cscope-find-functions-called cscope-find-func cscope-find-symbol
;;;;;;  cscope-mode) "cscope" "cscope.el" (19769 54246))
;;; Generated autoloads from cscope.el

(autoload 'cscope-mode "cscope" "\
Major mode used to look at the cscope output stuff

Type:
  n to go to the next line
  Space to go to the next line
  p to go to the previous line
  Rubout to go to the previous line
  v to view the file and line
  q to delete the cscope window
  e to edit the file at the line

\(fn)" nil nil)

(autoload 'cscope-find-symbol "cscope" "\
Find all references to the SYMBOL.

\(fn STRING)" t nil)

(autoload 'cscope-find-func "cscope" "\
Find a function declaration (or a #define) using the cscope stuff

\(fn STRING)" t nil)

(autoload 'cscope-find-functions-called "cscope" "\
Find all functions called by this function

\(fn STRING)" t nil)

(autoload 'cscope-find-func-call "cscope" "\
Find all calls to the function

\(fn STRING)" t nil)

(autoload 'cscope-find-string "cscope" "\
Find string using cscope stuff

\(fn STRING)" t nil)

(autoload 'cscope-find-pattern "cscope" "\
Finds egrep patter in cscope stuff

\(fn STRING)" t nil)

(autoload 'cscope-find-file "cscope" "\
Finds files matching PATTERN

\(fn STRING)" t nil)

(autoload 'cscope-find-file-include "cscope" "\
Find the files which include the file matching PATTERN

\(fn STRING)" t nil)

(autoload 'cscope-find-assignment "cscope" "\
Find assignments to variables and fields matching PATTERN

\(fn STRING)" t nil)

(autoload 'cscope-get-line-number "cscope" "\
Returns the \"line number\" out of a cscope output buffer

\(fn)" nil nil)

(autoload 'cscope-goto-from-list "cscope" "\
Point is in a buffer pointing to a line produced by
cscope-list-line. This routine plops into the file at the appropriate
spot

\(fn ARG)" t nil)

(autoload 'cscope-view-from-list "cscope" "\
Point is in a buffer pointing to a line produced by
cscope-list-line. This routine plops into the file at the appropriate
spot

\(fn)" t nil)

(autoload 'cscope-520-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-00 'cscope-520-process)

(autoload 'cscope-52B-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-01 'cscope-52B-process)

(autoload 'cscope-52F-process "cscope" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-52H-process "cscope" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-52I-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-05 'cscope-52I-process)

(defalias 'cscope-5200-06 'cscope-52I-process)

(autoload 'cscope-52L-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-07 'cscope-52L-process)

(autoload 'cscope-52M-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-08 'cscope-52M-process)

(autoload 'cscope-52Q-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-09 'cscope-52Q-process)

(autoload 'cscope-52S-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5200-10 'cscope-52S-process)

(autoload 'cscope-530-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-00 'cscope-530-process)

(autoload 'cscope-53A-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-01 'cscope-53A-process)

(autoload 'cscope-53D-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-03 'cscope-53D-process)

(autoload 'cscope-53E-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-04 'cscope-53E-process)

(autoload 'cscope-53H-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-05 'cscope-53H-process)

(autoload 'cscope-53J-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-06 'cscope-53J-process)

(autoload 'cscope-53L-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-07 'cscope-53L-process)

(autoload 'cscope-53N-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-08 'cscope-53N-process)

(autoload 'cscope-53Q-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-09 'cscope-53Q-process)

(autoload 'cscope-53S-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-5300-10 'cscope-53S-process)

(autoload 'cscope-610-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-6100-00 'cscope-610-process)

(autoload 'cscope-61B-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-6100-01 'cscope-61B-process)

(autoload 'cscope-61D-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-6100-02 'cscope-61D-process)

(autoload 'cscope-61F-process "cscope" "\
Not documented

\(fn)" t nil)

(defalias 'cscope-6100-03 'cscope-61F-process)

(autoload 'cscope-ipf-process "cscope" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-bananas-are-fun "cscope" "\
Not documented

\(fn BASE BUILD)" nil nil)

(autoload 'cscope-new-process "cscope" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-init-process "cscope" "\
Not documented

\(fn CSCOPE-OUT DBNAME)" nil nil)

(autoload 'cscope-wait "cscope" "\
Waits for the cscope process to finish

\(fn)" nil nil)

(autoload 'cscope-format "cscope" "\
Formats the output of cscope to be pretty

\(fn)" nil nil)

(autoload 'cscope-find-goodies "cscope" "\
Calls the cscope program and sends it STRING, plops into the buffer
and puts the buffer into cscope-mode

\(fn STRING)" t nil)

(autoload 'x-cscope-goto-from-list "cscope" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload 'x-cscope-goto-from-list-other-window "cscope" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload 'x-cscope-view-from-list "cscope" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload 'x-c-mode-cscope-sym "cscope" "\
Find symbol via cscope that mouse is pointing at

\(fn CLICK)" t nil)

(autoload 'x-c-mode-cscope-func "cscope" "\
Find function via cscope that mouse is pointing at

\(fn CLICK)" t nil)

(autoload 'x-cscope-no-op "cscope" "\
Function which does nothing

\(fn CLICK)" t nil)

;;;***

;;;### (autoloads (cscope-51G-process cscope-51F-process cscope-510-process
;;;;;;  cscope-43X-process cscope-43V-process cscope-43S-process
;;;;;;  cscope-43K-process cscope-42G-process cscope-41M-process)
;;;;;;  "cscope-old" "cscope-old.el" (19769 54246))
;;; Generated autoloads from cscope-old.el

(autoload 'cscope-41M-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-42G-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-43K-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-43S-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-43V-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-43X-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-510-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-51F-process "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload 'cscope-51G-process "cscope-old" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (csharp-mode csharp-mode-hook) "csharp-mode" "../nxhtml/related/csharp-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/csharp-mode.el

(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

(defvar csharp-mode-hook nil "\
*Hook called by `csharp-mode'.")

(custom-autoload 'csharp-mode-hook "csharp-mode" t)

(autoload 'csharp-mode "csharp-mode" "\
Major mode for editing C# code. This mode is derived from CC Mode to
support C#.

The hook `c-mode-common-hook' is run with no args at mode
initialization, then `csharp-mode-hook'.

This mode will automatically add a symbol and regexp to the
`compilation-error-regexp-alist' and `compilation-error-regexp-alist-alist'
respectively, for Csc.exe error and warning messages.

Key bindings:
\\{csharp-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (css-color-test css-color-global-mode css-color-mode
;;;;;;  css-color) "css-color" "../nxhtml/util/css-color.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/css-color.el

(let ((loads (get 'css-color 'custom-loads))) (if (member '"css-color" loads) nil (put 'css-color 'custom-loads (cons '"css-color" loads))))

(autoload 'css-color-mode "css-color" "\
Show hex color literals with the given color as background.
In this mode hexadecimal colour specifications like #6600ff are
displayed with the specified colour as background.

Certain keys are bound to special colour editing commands when
point is at a hexadecimal colour:

\\{css-color-map}

\(fn &optional ARG)" t nil)

(defvar css-color-global-mode nil "\
Non-nil if Css-Color-Global mode is enabled.
See the command `css-color-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `css-color-global-mode'.")

(custom-autoload 'css-color-global-mode "css-color" nil)

(autoload 'css-color-global-mode "css-color" "\
Toggle Css-Color mode in every possible buffer.
With prefix ARG, turn Css-Color-Global mode on if and only if
ARG is positive.
Css-Color mode is enabled in all buffers where
`css-color-turn-on-in-buffer' would do it.
See `css-color-mode' for more information on Css-Color mode.

\(fn &optional ARG)" t nil)

(autoload 'css-color-test "css-color" "\
Test colors interactively.
The colors are displayed in the echo area. You can specify the
colors as any viable css color.  Example:

  red
  #f00
  #0C0
  #b0ff00
  hsla(100, 50%, 25%)
  rgb(255,100,120)

\(fn FG-COLOR BG-COLOR)" t nil)

;;;***

;;;### (autoloads (css-palette-global-mode css-palette css-palette-mode)
;;;;;;  "css-palette" "../nxhtml/util/css-palette.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/css-palette.el

(autoload 'css-palette-mode "css-palette" "\
Minor mode for palettes in CSS.

The mode `css-palette-mode' acts on the first COLORS declaration in your
  file of the form:

COLORS:
\(
c0 \"#6f5d25\"	;tainted sand
c1 \"#000000\"	;Black
c2 \"#cca42b\"	;goldenslumber
c3 \"#6889cb\"	;far off sky
c4 \"#fff\"	;strange aeons
)

Such declarations should appear inside a block comment, in order
  to be parsed properly by the LISP reader.

Type \\[css-palette-update-all], and any occurence of

  color: #f55; /*[c3]*/

will be updated with

  color: #6899cb; /*[c3]*/

The following commands are available to insert key-value pairs
  and palette declarations:
  \\{css-palette-mode-map}

You can extend or redefine the types of palettes by defining a
  new palette specification of the form (PATTERN REGEXP
  REF-FOLLOWS-VALUE), named according to the naming scheme
  css-palette:my-type, where

PATTERN is a pattern containing two (%s) format directives which
  will be filled in with the variable and its value,

REGEXP is a regular expression to match a value - variable
  pattern,

and REF-FOLLOWS-VALUE defined whether or not the reference comes
  after the value. This allows for more flexibility.

Note that, although the w3c spec at URL
  `http://www.w3.org/TR/CSS2/syndata.html#comments' says that
  comments \" may occur anywhere between tokens, and their
  contents have no influence on the rendering\", Internet
  Explorer does not think so. Better keep all your comments after
  a \"statement\", as per the default. This means `css-palette'
  is ill-suited for use within shorthands.

See variable `css-palette:colors' for an example of a palette
  type.

The extension mechanism means that palette types can be used to
  contain arbitrary key-value mappings.

Besides the colors palette, css-palette defines the palette
  definition variables `css-palette:colors-outside' and
  `css-palette:files', for colors with the reference outside and
  for file url()'s respectively.

You can fine-control which palette types css-palette should look
  at via the variable `css-palette-types'.

\(fn &optional ARG)" t nil)

(let ((loads (get 'css-palette 'custom-loads))) (if (member '"css-palette" loads) nil (put 'css-palette 'custom-loads (cons '"css-palette" loads))))

(defvar css-palette-global-mode nil "\
Non-nil if Css-Palette-Global mode is enabled.
See the command `css-palette-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `css-palette-global-mode'.")

(custom-autoload 'css-palette-global-mode "css-palette" nil)

(autoload 'css-palette-global-mode "css-palette" "\
Toggle Css-Palette mode in every possible buffer.
With prefix ARG, turn Css-Palette-Global mode on if and only if
ARG is positive.
Css-Palette mode is enabled in all buffers where
`css-palette-turn-on-in-buffer' would do it.
See `css-palette-mode' for more information on Css-Palette mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (cucumber-compilation-run cucumber-compilation-this-scenario
;;;;;;  cucumber-compilation-this-buffer) "cucumber-mode-compilation"
;;;;;;  "../ruby/rinari/util/cucumber-mode-compilation.el" (19772
;;;;;;  45255))
;;; Generated autoloads from ../ruby/rinari/util/cucumber-mode-compilation.el

(autoload 'cucumber-compilation-this-buffer "cucumber-mode-compilation" "\
Run the current buffer's scenarios through cucumber.

\(fn)" t nil)

(autoload 'cucumber-compilation-this-scenario "cucumber-mode-compilation" "\
Run the scenario at point through cucumber.

\(fn)" t nil)

(autoload 'cucumber-compilation-run "cucumber-mode-compilation" "\
Run a cucumber process, dumping output to a compilation buffer.

\(fn CMD)" t nil)

;;;***

;;;### (autoloads (cusnu-export-my-skin-options customize-for-new-user)
;;;;;;  "cus-new-user" "../nxhtml/util/cus-new-user.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/cus-new-user.el

(autoload 'customize-for-new-user "cus-new-user" "\
Show special customization page for new user.

\(fn &optional NAME)" t nil)

(autoload 'cusnu-export-my-skin-options "cus-new-user" "\
Export to file FILE custom options in `cusnu-my-skin-options'.
The options is exported to elisp code that other users can run to
set the options that you have added to `cusnu-my-skin-options'.

For more information about this see `cusnu-export-cust-group'.

\(fn FILE)" t nil)

;;;***

;;;### (autoloads (django-mode) "django" "../nxhtml/related/django.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/django.el

(autoload 'django-mode "django" "\
Simple Django mode for use with mumamo.
This mode only provides syntax highlighting.

\(fn)" t nil)

;;;***

;;;### (autoloads (ediff-url) "ediff-url" "../nxhtml/util/ediff-url.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/ediff-url.el

(autoload 'ediff-url "ediff-url" "\
Compare current buffer to a web URL using `ediff-buffers'.
Check URL using `ediff-url-redirects' before fetching the file.

This is for checking downloaded file.  A the file may have a comment
telling the download URL of thise form in the header:

   ;; URL: http://the-server.net/the-path/the-file.el

If not the user is asked for the URL.

\(fn URL)" t nil)

;;;***

;;;### (autoloads (ert-run-tests-interactively ert-deftest) "ert"
;;;;;;  "../ruby/rinari/util/test/ert/ert.el" (19772 45398))
;;; Generated autoloads from ../ruby/rinari/util/test/ert/ert.el

(autoload 'ert-deftest "ert" "\
Define NAME (a symbol) as a test.

\(fn NAME () [:documentation DOCSTRING] [:expected-result TYPE] BODY...)" nil (quote macro))

(autoload 'ert-run-tests-interactively "ert" "\
Run the tests specified by SELECTOR and display the results in a buffer.

\(fn SELECTOR &optional OUTPUT-BUFFER-NAME MESSAGE-FN)" t nil)

;;;***

;;;### (autoloads (espresso-mode) "espresso" "../others/espresso.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../others/espresso.el

(autoload 'espresso-mode "espresso" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{espresso-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (ffip-find-file-in-dirtree ffip-set-current-project)
;;;;;;  "ffip" "../nxhtml/util/ffip.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/ffip.el

(autoload 'ffip-set-current-project "ffip" "\
Setup ffip project NAME with top directory ROOT of type TYPE.
ROOT can either be just a directory or a list of directory where
the first used just for prompting purposes and the files in the
rest are read into the ffip project.

Type is a type in `ffip-project-file-types'.

\(fn NAME ROOT TYPE)" nil nil)

(autoload 'ffip-find-file-in-dirtree "ffip" "\
Find files in directory tree ROOT.

\(fn ROOT)" t nil)

;;;***

;;;### (autoloads (flymake-css-load) "flymake-css" "../nxhtml/related/flymake-css.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/flymake-css.el

(autoload 'flymake-css-load "flymake-css" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (flymake-java-1-load) "flymake-java-1" "../nxhtml/related/flymake-java-1.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/flymake-java-1.el

(autoload 'flymake-java-1-load "flymake-java-1" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (flymake-js-load flymake-js) "flymake-js" "../nxhtml/related/flymake-js.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/flymake-js.el

(let ((loads (get 'flymake-js 'custom-loads))) (if (member '"flymake-js" loads) nil (put 'flymake-js 'custom-loads (cons '"flymake-js" loads))))

(autoload 'flymake-js-load "flymake-js" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (fold-dwim-turn-on-outline-and-hide-all fold-dwim-turn-on-hs-and-hide
;;;;;;  fold-dwim-unhide-hs-and-outline fold-dwim-mode fold-dwim-toggle
;;;;;;  fold-dwim) "fold-dwim" "../nxhtml/util/fold-dwim.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/fold-dwim.el

(let ((loads (get 'fold-dwim 'custom-loads))) (if (member '"fold-dwim" loads) nil (put 'fold-dwim 'custom-loads (cons '"fold-dwim" loads))))

(autoload 'fold-dwim-toggle "fold-dwim" "\
Toggle visibility or some other visual things.
Try toggling different visual things in this order:

- Images shown at point with `inlimg-mode'
- Text at point prettified by `html-write-mode'.

For the rest it unhides if possible, otherwise hides in this
order:

- `org-mode' header or something else using that outlines.
- Maybe `fold-dwim-toggle-selective-display'.
- `Tex-fold-mode' things.
- In html if `outline-minor-mode' and after heading hide content.
- `hs-minor-mode' things.
- `outline-minor-mode' things. (Turns maybe on this.)

It uses `fold-dwim-show' to show any hidden text at point; if no
hidden fold is found, try `fold-dwim-hide' to hide the
construction at the cursor.

Note: Also first turn on `fold-dwim-mode' to get the keybinding
for this function from it.

\(fn)" t nil)

(defvar fold-dwim-mode nil "\
Non-nil if Fold-Dwim mode is enabled.
See the command `fold-dwim-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `fold-dwim-mode'.")

(custom-autoload 'fold-dwim-mode "fold-dwim" nil)

(autoload 'fold-dwim-mode "fold-dwim" "\
Key binding for `fold-dwim-toggle'.

\(fn &optional ARG)" t nil)

(autoload 'fold-dwim-unhide-hs-and-outline "fold-dwim" "\
Unhide everything hidden by Hide/Show and Outline.
Ie everything hidden by `hs-minor-mode' and
`outline-minor-mode'.

\(fn)" t nil)

(autoload 'fold-dwim-turn-on-hs-and-hide "fold-dwim" "\
Turn on minor mode `hs-minor-mode' and hide.
If major mode is derived from `nxml-mode' call `hs-hide-block'
else call `hs-hide-all'.

\(fn)" t nil)

(autoload 'fold-dwim-turn-on-outline-and-hide-all "fold-dwim" "\
Turn on `outline-minor-mode' and call `hide-body'.

\(fn)" t nil)

;;;***

;;;### (autoloads (foldit-global-mode foldit-mode foldit) "foldit"
;;;;;;  "../nxhtml/util/foldit.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/foldit.el

(let ((loads (get 'foldit 'custom-loads))) (if (member '"foldit" loads) nil (put 'foldit 'custom-loads (cons '"foldit" loads))))

(autoload 'foldit-mode "foldit" "\
Minor mode providing visual aids for folding.
Shows some hints about what you have hidden and how to reveal it.

Supports `hs-minor-mode', `outline-minor-mode' and major modes
derived from `outline-mode'.

\(fn &optional ARG)" t nil)

(defvar foldit-global-mode nil "\
Non-nil if Foldit-Global mode is enabled.
See the command `foldit-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `foldit-global-mode'.")

(custom-autoload 'foldit-global-mode "foldit" nil)

(autoload 'foldit-global-mode "foldit" "\
Toggle Foldit mode in every possible buffer.
With prefix ARG, turn Foldit-Global mode on if and only if
ARG is positive.
Foldit mode is enabled in all buffers where
`(lambda nil (foldit-mode 1))' would do it.
See `foldit-mode' for more information on Foldit mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (gimpedit-can-edit gimpedit-edit-buffer gimpedit-edit-file
;;;;;;  gimpedit) "gimpedit" "../nxhtml/util/gimpedit.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/gimpedit.el

(let ((loads (get 'gimpedit 'custom-loads))) (if (member '"gimpedit" loads) nil (put 'gimpedit 'custom-loads (cons '"gimpedit" loads))))

(autoload 'gimpedit-edit-file "gimpedit" "\
Edit IMAGE-FILE with GIMP.
See also `gimpedit-edit-file'.

\(fn IMAGE-FILE &optional EXTRA-ARGS)" t nil)

(autoload 'gimpedit-edit-buffer "gimpedit" "\
Edit image file in current buffer with GIMP.
See also `gimpedit-edit-file'.

You may also be interested in gimpedit-mode with which you can edit
gimp files from within Emacs using GIMP's scripting
possibilities. See

  URL `http://www.emacswiki.org/emacs/GimpMode'

\(fn)" t nil)

(autoload 'gimpedit-can-edit "gimpedit" "\
Not documented

\(fn FILE-NAME)" nil nil)

;;;***

;;;### (autoloads (gpl-mode) "gpl" "../nxhtml/util/gpl.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/gpl.el

(autoload 'gpl-mode "gpl" "\
Mode for font-locking and editing color palettes of the GPL format.

Such palettes are used and produced by free software applications
such as the GIMP, Inkscape, Scribus, Agave and on-line tools such
as http://colourlovers.com.

You can also use
URL `http://niels.kicks-ass.org/public/elisp/css-palette.el' to import
such palette into a css-file as hexadecimal color palette.

\(fn)" t nil)

;;;***

;;;### (autoloads (hfyview-frame hfyview-window hfyview-region hfyview-buffer
;;;;;;  hfyview-quick-print-in-files-menu) "hfyview" "../nxhtml/util/hfyview.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/hfyview.el

(defvar hfyview-quick-print-in-files-menu nil "\
Add Quick print entries to File menu if non-nil.
If you set this to nil you have to restart Emacs to get rid of
the Quick Print entry.")

(custom-autoload 'hfyview-quick-print-in-files-menu "hfyview" nil)

(autoload 'hfyview-buffer "hfyview" "\
Convert buffer to html preserving faces and show in web browser.
With command prefix ARG also show html source in other window.

\(fn ARG)" t nil)

(autoload 'hfyview-region "hfyview" "\
Convert region to html preserving faces and show in web browser.
With command prefix ARG also show html source in other window.

\(fn ARG)" t nil)

(autoload 'hfyview-window "hfyview" "\
Convert window to html preserving faces and show in web browser.
With command prefix ARG also show html source in other window.

\(fn ARG)" t nil)

(autoload 'hfyview-frame "hfyview" "\
Convert frame to html preserving faces and show in web browser.
Make an XHTML view of the current Emacs frame. Put it in a buffer
named *hfyview-frame* and show that buffer in a web browser.

If WHOLE-BUFFERS is non-nil then the whole content of the buffers
is shown in the XHTML page, otherwise just the part that is
visible currently on the frame.

If you turn on the minor mode `hfyview-frame-mode' you can also
get the minibuffer/echo area in the output. See this mode for
details.

With command prefix also show html source in other window.

\(fn WHOLE-BUFFERS)" t nil)

;;;***

;;;### (autoloads (hl-needed-mode hl-needed) "hl-needed" "../nxhtml/util/hl-needed.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/hl-needed.el

(let ((loads (get 'hl-needed 'custom-loads))) (if (member '"hl-needed" loads) nil (put 'hl-needed 'custom-loads (cons '"hl-needed" loads))))

(defvar hl-needed-mode nil "\
Non-nil if Hl-Needed mode is enabled.
See the command `hl-needed-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `hl-needed-mode'.")

(custom-autoload 'hl-needed-mode "hl-needed" nil)

(autoload 'hl-needed-mode "hl-needed" "\
Try to highlight current line and column when needed.
This is a global minor mode.  It can operate in some different
ways:

- Highlighting can be on always, see `hl-needed-always'.

Or, it can be turned on depending on some conditions.  In this
case highlighting is turned off after each command and turned on
again in the current window when either:

- A new window was selected, see `hl-needed-on-new-window'.
- A new buffer was selected, see `hl-needed-on-new-buffer'.
- Window configuration was changed, see `hl-needed-on-config-change'.
- Buffer was scrolled see `hl-needed-on-scrolling'.
- A window was clicked with the mouse, see `hl-needed-on-mouse'.

After this highlighting may be turned off again, normally after a
short delay, see `hl-needed-flash'.

If either highlighting was not turned on or was turned off again
it will be turned on when

- Emacs has been idle for `hl-needed-idle-time' seconds.

See also `hl-needed-not-in-modes' and `hl-needed-currently-fun'.

Note 1: For columns to be highlighted vline.el must be available.

Note 2: This mode depends on `hl-line-mode' and `vline-mode' and
tries to cooperate with them. If you turn on either of these that
overrides the variables for turning on the respective
highlighting here.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (html-chklnk) "html-chklnk" "../nxhtml/nxhtml/html-chklnk.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/html-chklnk.el

(let ((loads (get 'html-chklnk 'custom-loads))) (if (member '"html-chklnk" loads) nil (put 'html-chklnk 'custom-loads (cons '"html-chklnk" loads))))

;;;***

;;;### (autoloads (html-pagetoc-rebuild-toc html-pagetoc-insert-toc
;;;;;;  html-pagetoc) "html-pagetoc" "../nxhtml/nxhtml/html-pagetoc.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/html-pagetoc.el

(let ((loads (get 'html-pagetoc 'custom-loads))) (if (member '"html-pagetoc" loads) nil (put 'html-pagetoc 'custom-loads (cons '"html-pagetoc" loads))))

(autoload 'html-pagetoc-insert-toc "html-pagetoc" "\
Inserts a table of contents for the current html file.
The html header tags h1-h6 found in the file are inserted into
this table.  MIN-LEVEL and MAX-LEVEL specifies the minimum and
maximum level of h1-h6 to include.  They should be integers.

\(fn &optional MIN-LEVEL MAX-LEVEL)" t nil)

(autoload 'html-pagetoc-rebuild-toc "html-pagetoc" "\
Update the table of contents inserted by `html-pagetoc-insert-toc'.

\(fn)" t nil)

(defconst html-pagetoc-menu-map (let ((map (make-sparse-keymap))) (define-key map [html-pagetoc-rebuild-toc] (list 'menu-item "Update Page TOC" 'html-pagetoc-rebuild-toc)) (define-key map [html-pagetoc-insert-style-guide] (list 'menu-item "Insert CSS Style for Page TOC" 'html-pagetoc-insert-style-guide)) (define-key map [html-pagetoc-insert-toc] (list 'menu-item "Insert Page TOC" 'html-pagetoc-insert-toc)) map))

;;;***

;;;### (autoloads (html-site-query-replace html-site-rgrep html-site-find-file
;;;;;;  html-site-dired-current html-site-set-site html-site-buffer-or-dired-file-name
;;;;;;  html-site) "html-site" "../nxhtml/nxhtml/html-site.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/nxhtml/html-site.el

(let ((loads (get 'html-site 'custom-loads))) (if (member '"html-site" loads) nil (put 'html-site 'custom-loads (cons '"html-site" loads))))

(autoload 'html-site-buffer-or-dired-file-name "html-site" "\
Return buffer file name or file pointed to in dired.

\(fn)" nil nil)

(autoload 'html-site-set-site "html-site" "\
Not documented

\(fn NAME)" t nil)

(autoload 'html-site-dired-current "html-site" "\
Open `dired' in current site top directory.

\(fn)" t nil)

(autoload 'html-site-find-file "html-site" "\
Find file in current site.

\(fn)" t nil)

(autoload 'html-site-rgrep "html-site" "\
Search current site's files with `rgrep'.
See `rgrep' for the arguments REGEXP and FILES.

\(fn REGEXP FILES)" t nil)

(autoload 'html-site-query-replace "html-site" "\
Query replace in current site's files.

\(fn FROM TO FILE-REGEXP DELIMITED)" t nil)

;;;***

;;;### (autoloads (html-toc) "html-toc" "../nxhtml/nxhtml/html-toc.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/html-toc.el

(let ((loads (get 'html-toc 'custom-loads))) (if (member '"html-toc" loads) nil (put 'html-toc 'custom-loads (cons '"html-toc" loads))))

(defconst html-toc-menu-map (let ((map (make-sparse-keymap))) (define-key map [html-toc-browse-frames-file] (list 'menu-item "Browse Frames File" 'html-toc-browse-frames-file)) (define-key map [html-toc-write-frames-file] (list 'menu-item "Write Frames File" 'html-toc-write-frames-file)) (define-key map [html-toc-write-toc-file] (list 'menu-item "Write TOC File for Frames" 'html-toc-write-toc-file)) (define-key map [html-toc-sep1] (list 'menu-item "--")) (define-key map [html-toc-edit-pages-file] (list 'menu-item "Edit List of Pages for TOC" 'html-site-edit-pages-file)) (define-key map [html-toc-create-pages-file] (list 'menu-item "Write List of Pages for TOC" 'html-toc-create-pages-file)) map))

;;;***

;;;### (autoloads (html-upl-ediff-file html-upl-edit-remote-file-with-toc
;;;;;;  html-upl-edit-remote-file html-upl-upload-file html-upl-remote-dired
;;;;;;  html-upl-upload-site html-upl-upload-site-with-toc html-upl)
;;;;;;  "html-upl" "../nxhtml/nxhtml/html-upl.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/html-upl.el

(let ((loads (get 'html-upl 'custom-loads))) (if (member '"html-upl" loads) nil (put 'html-upl 'custom-loads (cons '"html-upl" loads))))

(autoload 'html-upl-upload-site-with-toc "html-upl" "\
Not documented

\(fn)" t nil)

(autoload 'html-upl-upload-site "html-upl" "\
Not documented

\(fn)" t nil)

(autoload 'html-upl-remote-dired "html-upl" "\
Start dired for remote directory or its parent/ancestor.

\(fn DIRNAME)" t nil)

(autoload 'html-upl-upload-file "html-upl" "\
Upload a single file in a site.
For the definition of a site see `html-site-current'.

\(fn FILENAME)" t nil)

(autoload 'html-upl-edit-remote-file "html-upl" "\
Not documented

\(fn)" t nil)

(autoload 'html-upl-edit-remote-file-with-toc "html-upl" "\
Not documented

\(fn)" t nil)

(autoload 'html-upl-ediff-file "html-upl" "\
Run ediff on local and remote file.
FILENAME could be either the remote or the local file.

\(fn FILENAME)" t nil)

;;;***

;;;### (autoloads (html-write-mode html-write) "html-write" "../nxhtml/util/html-write.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/html-write.el

(let ((loads (get 'html-write 'custom-loads))) (if (member '"html-write" loads) nil (put 'html-write 'custom-loads (cons '"html-write" loads))))

(autoload 'html-write-mode "html-write" "\
Minor mode for convenient display of some HTML tags.
When this mode is on a tag in `html-write-tag-list' is displayed as
the inner text of the tag with a face corresponding to the tag.
By default for example <i>...</i> is displayed as italic and
<a>...</a> is displayed as an underlined clickable link.

Only non-nested tags are hidden.  The idea is just that it should
be easier to read and write, not that it should look as html
rendered text.

See the customization group `html-write' for more information about
faces.

The following keys are defined when you are on a tag handled by
this minor mode:

\\{html-write-keymap}

IMPORTANT: Most commands you use works also on the text that is
hidden.  The movement commands is an exception, but as soon as
you edit the buffer you may also change the hidden parts.

Hint: Together with `wrap-to-fill-column-mode' this can make it
easier to see what text you are actually writing in html parts of
a web file.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (html-wtoc) "html-wtoc" "../nxhtml/nxhtml/html-wtoc.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/html-wtoc.el

(let ((loads (get 'html-wtoc 'custom-loads))) (if (member '"html-wtoc" loads) nil (put 'html-wtoc 'custom-loads (cons '"html-wtoc" loads))))

;;;***

;;;### (autoloads (run-ruby inf-ruby inf-ruby-keys) "inf-ruby" "../ruby/rinari/util/inf-ruby.el"
;;;;;;  (19772 45255))
;;; Generated autoloads from ../ruby/rinari/util/inf-ruby.el

(autoload 'inf-ruby-keys "inf-ruby" "\
Set local key defs to invoke inf-ruby from ruby-mode.

\(fn)" nil nil)

(autoload 'inf-ruby "inf-ruby" "\
Run an inferior Ruby process in a buffer.
With prefix argument, prompts for which Ruby implementation
\(from the list `inf-ruby-implementations') to use. Runs the
hooks `inf-ruby-mode-hook' (after the `comint-mode-hook' is
run).

\(fn &optional IMPL)" t nil)

(autoload 'run-ruby "inf-ruby" "\
Run an inferior Ruby process, input and output via buffer *ruby*.
If there is a process already running in `*ruby*', switch to that buffer.
With argument, allows you to edit the command line (default is value
of `ruby-program-name').  Runs the hooks `inferior-ruby-mode-hook'
\(after the `comint-mode-hook' is run).
\(Type \\[describe-mode] in the process buffer for a list of commands.)

\(fn &optional COMMAND NAME)" t nil)

(eval-after-load 'ruby-mode '(add-hook 'ruby-mode-hook 'inf-ruby-keys))

;;;***

;;;### (autoloads (pluralize-string singularize-string) "inflections"
;;;;;;  "../ruby/rinari/util/jump/inflections.el" (19772 45397))
;;; Generated autoloads from ../ruby/rinari/util/jump/inflections.el

(autoload 'singularize-string "inflections" "\
Not documented

\(fn STR)" nil nil)

(autoload 'pluralize-string "inflections" "\
Not documented

\(fn STR)" nil nil)

;;;***

;;;### (autoloads (kill-inherited-variables setup-inheritance inherit-from-buffer
;;;;;;  make-variable-buffer-inherited) "inherit" "inherit.el" (19769
;;;;;;  54246))
;;; Generated autoloads from inherit.el

(autoload 'make-variable-buffer-inherited "inherit" "\
Make symbol A be inherited -- this implies that it is buffer local

\(fn A)" nil nil)

(autoload 'inherit-from-buffer "inherit" "\
Set all inherited variables of current buffer to those values of BUF

\(fn BUF)" t nil)

(autoload 'setup-inheritance "inherit" "\
Sets up inheritance from the buffer that we are currently doing a find file from

\(fn)" nil nil)

(autoload 'kill-inherited-variables "inherit" "\
Sets all inherited variables to nil

\(fn)" t nil)

;;;***

;;;### (autoloads (inlimg-toggle-slicing inlimg-toggle-display inlimg-global-mode
;;;;;;  inlimg-mode inlimg) "inlimg" "../nxhtml/util/inlimg.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/inlimg.el

(let ((loads (get 'inlimg 'custom-loads))) (if (member '"inlimg" loads) nil (put 'inlimg 'custom-loads (cons '"inlimg" loads))))

(autoload 'inlimg-mode "inlimg" "\
Display images inline.
Search buffer for image tags.  Display found images.

Image tags are setup per major mode in `inlimg-mode-specs'.

Images are displayed on a line below the tag referencing them.
The whole image or a slice of it may be displayed, see
`inlimg-slice'.  Margins relative text are specified in
`inlimg-margins'.

See also the commands `inlimg-toggle-display' and
`inlimg-toggle-slicing'.

Note: This minor mode uses `font-lock-mode'.

\(fn &optional ARG)" t nil)

(defvar inlimg-global-mode nil "\
Non-nil if Inlimg-Global mode is enabled.
See the command `inlimg-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `inlimg-global-mode'.")

(custom-autoload 'inlimg-global-mode "inlimg" nil)

(autoload 'inlimg-global-mode "inlimg" "\
Toggle Inlimg mode in every possible buffer.
With prefix ARG, turn Inlimg-Global mode on if and only if
ARG is positive.
Inlimg mode is enabled in all buffers where
`inlimg--global-turn-on' would do it.
See `inlimg-mode' for more information on Inlimg mode.

\(fn &optional ARG)" t nil)

(autoload 'inlimg-toggle-display "inlimg" "\
Toggle display of image at point POINT.
See also the command `inlimg-mode'.

\(fn POINT)" t nil)

(autoload 'inlimg-toggle-slicing "inlimg" "\
Toggle slicing of image at point POINT.
See also the command `inlimg-mode'.

\(fn POINT)" t nil)

;;;***

;;;### (autoloads (iss-mode) "iss-mode" "../nxhtml/related/iss-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/iss-mode.el

(autoload 'iss-mode "iss-mode" "\
Major mode for editing InnoSetup script files. Upon startup iss-mode-hook is run.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "iss-mumamo" "../nxhtml/related/iss-mumamo.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/iss-mumamo.el

(define-mumamo-multi-major-mode iss-mumamo-mode "Turn on multiple major modes Inno Setup .iss files.\nThe main major mode will be `iss-mode'.\nThe [code] section, if any, will be in `pascal-mode'." ("Inno ISS Family" iss-mode (mumamo-chunk-iss-code)))

;;;***

;;;### (autoloads (javascript-mode) "javascript-mozlab" "../nxhtml/alts/javascript-mozlab.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/alts/javascript-mozlab.el

(autoload 'javascript-mode "javascript-mozlab" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{javascript-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (js-mode) "js" "../others/js.el" (19769 54246))
;;; Generated autoloads from ../others/js.el

(autoload 'js-mode "js" "\
Major mode for editing JavaScript.

Key bindings:

\\{js-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (defjump) "jump" "../ruby/rinari/util/jump/jump.el"
;;;;;;  (19772 45397))
;;; Generated autoloads from ../ruby/rinari/util/jump/jump.el

(autoload 'defjump "jump" "\
Define NAME as a function with behavior determined by SPECS.
SPECS should be a list of cons cells of the form

   (jump-from-spec . jump-to-spec)

NAME will then try subsequent jump-from-specs until one succeeds,
at which point any resulting match information, along with the
related jump-to-spec will be used to jump to the intended buffer.
See `jump-to' and `jump-from' for information on spec
construction.

ROOT should specify the root of the project in which all jumps
take place, it can be either a string directory path, or a
function returning

Optional argument DOC specifies the documentation of the
resulting function.

Optional argument MAKE can be used to specify that missing files
should be created.  If MAKE is a function then it will be called
with the file path as it's only argument.  After possibly calling
MAKE `find-file' will be used to open the path.

Optional argument METHOD-COMMAND overrides the function used to
find the current method which defaults to `which-function'.

\(fn NAME SPECS ROOT &optional DOC MAKE METHOD-COMMAND)" nil nil)

;;;***

;;;### (autoloads (key-cat-help) "key-cat" "../nxhtml/util/key-cat.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/key-cat.el

(autoload 'key-cat-help "key-cat" "\
Display reference sheet style help for common commands.
See also `key-cat-cmd-list'.

\(fn)" t nil)

;;;***

;;;### (autoloads (majmodpri majmodpri-apply-priorities majmodpri-apply
;;;;;;  majmodpri-sort-lists) "majmodpri" "../nxhtml/util/majmodpri.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/majmodpri.el

(autoload 'majmodpri-sort-lists "majmodpri" "\
Sort the list used when selecting major mode.
Only sort those lists choosen in `majmodpri-lists-to-sort'.
Sort according to priorities in `majmodpri-mode-priorities'.
Keep the old order in the list otherwise.

The lists can be sorted when loading elisp libraries, see
`majmodpri-sort-after-load'.

See also `majmodpri-apply-priorities'.

\(fn)" t nil)

(autoload 'majmodpri-apply "majmodpri" "\
Sort major mode lists and apply to existing buffers.
Note: This function is suitable to add to
`desktop-after-read-hook'. It will restore the multi major modes
in buffers.

\(fn)" nil nil)

(autoload 'majmodpri-apply-priorities "majmodpri" "\
Apply major mode priorities.
First run `majmodpri-sort-lists' and then if CHANGE-MODES is
non-nil apply to existing file buffers.  If interactive ask
before applying.

\(fn CHANGE-MODES)" t nil)

(let ((loads (get 'majmodpri 'custom-loads))) (if (member '"majmodpri" loads) nil (put 'majmodpri 'custom-loads (cons '"majmodpri" loads))))

;;;***

;;;### (autoloads (markchars-global-mode markchars-mode markchars)
;;;;;;  "markchars" "../nxhtml/util/markchars.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/markchars.el

(let ((loads (get 'markchars 'custom-loads))) (if (member '"markchars" loads) nil (put 'markchars 'custom-loads (cons '"markchars" loads))))

(autoload 'markchars-mode "markchars" "\
Mark special characters.
Which characters to mark are defined by `markchars-keywords'.

The default is to mark non-IDN, non-ascii chars with a magenta
underline.

For information about IDN chars see `idn-is-recommended'.

If you change anything in the customization group `markchars' you
must restart this minor mode for the changes to take effect.

\(fn &optional ARG)" t nil)

(defvar markchars-global-mode nil "\
Non-nil if Markchars-Global mode is enabled.
See the command `markchars-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `markchars-global-mode'.")

(custom-autoload 'markchars-global-mode "markchars" nil)

(autoload 'markchars-global-mode "markchars" "\
Toggle Markchars mode in every possible buffer.
With prefix ARG, turn Markchars-Global mode on if and only if
ARG is positive.
Markchars mode is enabled in all buffers where
`(lambda nil (markchars-mode 1))' would do it.
See `markchars-mode' for more information on Markchars mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (mlinks-global-mode mlinks-mode mlinks) "mlinks"
;;;;;;  "../nxhtml/util/mlinks.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/mlinks.el

(let ((loads (get 'mlinks 'custom-loads))) (if (member '"mlinks" loads) nil (put 'mlinks 'custom-loads (cons '"mlinks" loads))))

(autoload 'mlinks-mode "mlinks" "\
Recognizes certain parts of a buffer as hyperlinks.
The hyperlinks are created in different ways for different major
modes with the help of the functions in the list
`mlinks-mode-functions'.

The hyperlinks can be hilighted when point is over them.  Use
`mlinks-toggle-hilight' to toggle this feature for the current
buffer.

All keybindings in this mode are by default done under the prefi§x
key

  C-c RET

which is supposed to be a kind of mnemonic for link (alluding to
the RET key commonly used in web browser to follow a link).
\(Unfortunately this breaks the rules in info node `Key Binding
Conventions'.) Below are the key bindings defined by this mode:

\\{mlinks-mode-map}

For some major modes `mlinks-backward-link' and
`mlinks-forward-link' will take you to the previous/next link.
By default the link moved to will be active, see
`mlinks-active-links'.

\(fn &optional ARG)" t nil)

(defvar mlinks-global-mode nil "\
Non-nil if Mlinks-Global mode is enabled.
See the command `mlinks-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `mlinks-global-mode'.")

(custom-autoload 'mlinks-global-mode "mlinks" nil)

(autoload 'mlinks-global-mode "mlinks" "\
Toggle Mlinks mode in every possible buffer.
With prefix ARG, turn Mlinks-Global mode on if and only if
ARG is positive.
Mlinks mode is enabled in all buffers where
`mlinks-turn-on-in-buffer' would do it.
See `mlinks-mode' for more information on Mlinks mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (inferior-moz-mode moz-minor-mode) "moz" "../nxhtml/related/moz.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/moz.el

(autoload 'moz-minor-mode "moz" "\
MozRepl minor mode for interaction with Firefox.
With no argument, this command toggles the mode.
Non-null prefix argument turns on the mode.
Null prefix argument turns off the mode.

When this minor mode is enabled, some commands become available
to send current code area (as understood by c-mark-function) or
region or buffer to an inferior MozRepl process (which will be
started as needed).

The following keys are bound in this minor mode:

\\{moz-minor-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'inferior-moz-mode "moz" "\
Major mode for interacting with Firefox via MozRepl.

\(fn)" t nil)

;;;***

;;;### (autoloads (global-mozadd-mirror-mode mozadd-mirror-mode global-mozadd-refresh-edited-on-save-mode
;;;;;;  mozadd-refresh-edited-on-save-mode) "mozadd" "../nxhtml/related/mozadd.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/mozadd.el

(autoload 'mozadd-refresh-edited-on-save-mode "mozadd" "\
Refresh mozadd edited file in Firefox when saving file.
The mozadd edited file is the file in the last buffer visited in
`mozadd-mirror-mode'.

You can use this for example when you edit CSS files.

The mozadd edited file must be shown in Firefox and visible.

\(fn &optional ARG)" t nil)

(defvar global-mozadd-refresh-edited-on-save-mode nil "\
Non-nil if Global-Mozadd-Refresh-Edited-On-Save mode is enabled.
See the command `global-mozadd-refresh-edited-on-save-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-mozadd-refresh-edited-on-save-mode'.")

(custom-autoload 'global-mozadd-refresh-edited-on-save-mode "mozadd" nil)

(autoload 'global-mozadd-refresh-edited-on-save-mode "mozadd" "\
Toggle Mozadd-Refresh-Edited-On-Save mode in every possible buffer.
With prefix ARG, turn Global-Mozadd-Refresh-Edited-On-Save mode on if and only if
ARG is positive.
Mozadd-Refresh-Edited-On-Save mode is enabled in all buffers where
`(lambda nil (when (or (derived-mode-p (quote css-mode)) (mozadd-html-buffer-file-p)) (mozadd-refresh-edited-on-save-mode 1)))' would do it.
See `mozadd-refresh-edited-on-save-mode' for more information on Mozadd-Refresh-Edited-On-Save mode.

\(fn &optional ARG)" t nil)

(autoload 'mozadd-mirror-mode "mozadd" "\
Mirror content of current file buffer immediately in Firefox.
When you turn on this mode the file will be opened in Firefox.
Every change you make in the buffer will trigger a redraw in
Firefox - regardless of if you save the file or not.

For the mirroring to work the edited file must be shown in
Firefox and visible.

If `nxml-where-mode' is on the marks will also be shown in
Firefox as CSS outline style.  You can customize the style
through the option `mozadd-xml-path-outline-style'.

See also `mozadd-refresh-edited-on-save-mode'.

\(fn &optional ARG)" t nil)

(defvar global-mozadd-mirror-mode nil "\
Non-nil if Global-Mozadd-Mirror mode is enabled.
See the command `global-mozadd-mirror-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-mozadd-mirror-mode'.")

(custom-autoload 'global-mozadd-mirror-mode "mozadd" nil)

(autoload 'global-mozadd-mirror-mode "mozadd" "\
Toggle Mozadd-Mirror mode in every possible buffer.
With prefix ARG, turn Global-Mozadd-Mirror mode on if and only if
ARG is positive.
Mozadd-Mirror mode is enabled in all buffers where
`(lambda nil (when (mozadd-html-buffer-file-p) (mozadd-mirror-mode 1)))' would do it.
See `mozadd-mirror-mode' for more information on Mozadd-Mirror mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (mumamo-multi-major-modep mumamo-guess-multi-major
;;;;;;  mumamo-list-defined-multi-major-modes mumamo-mark-for-refontification
;;;;;;  mumamo-hi-lock-faces mumamo mumamo-add-to-defined-multi-major-modes
;;;;;;  define-mumamo-multi-major-mode) "mumamo" "../nxhtml/util/mumamo.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/mumamo.el

(autoload 'define-mumamo-multi-major-mode "mumamo" "\
Define a function that turn on support for multiple major modes.
Define a function FUN-SYM that set up to divide the current
buffer into chunks with different major modes.

The documentation string for FUN-SYM should contain the special
documentation in the string SPEC-DOC, general documentation for
functions of this type and information about chunks.

The new function will use the definitions in CHUNKS (which is
called a \"chunk family\") to make the dividing of the buffer.

The function FUN-SYM can be used to setup a buffer instead of a
major mode function:

- The function FUN-SYM can be called instead of calling a major
  mode function when you want to use multiple major modes in a
  buffer.

- The defined function can be used instead of a major mode
  function in for example `auto-mode-alist'.

- As the very last thing FUN-SYM will run the hook FUN-SYM-hook,
  just as major modes do.

- There is also a general hook, `mumamo-turn-on-hook', which is
  run when turning on mumamo with any of these functions.  This
  is run right before the hook specific to any of the functions
  above that turns on the multiple major mode support.

- The multi major mode FUN-SYM has a keymap named FUN-SYM-map.
  This overrides the major modes' keymaps since it is handled as
  a minor mode keymap.

- There is also a special mumamo keymap, `mumamo-map' that is
  active in every buffer with a multi major mode.  This is also
  handled as a minor mode keymap and therefor overrides the major
  modes' keymaps.

- However when this support for multiple major mode is on the
  buffer is divided into chunks, each with its own major mode.

- The chunks are fontified according the major mode assigned to
  them for that.

- Indenting is also done according to the major mode assigned to
  them for that.

- The actual major mode used in the buffer is changed to the one
  in the chunk when moving point between these chunks.

- When major mode is changed the hooks for the new major mode,
  `after-change-major-mode-hook' and `change-major-mode-hook' are
  run.

- There will be an alias for FUN-SYM called mumamo-alias-FUN-SYM.
  This can be used to check whic multi major modes have been
  defined.

** A little bit more technical description:

The name of the function is saved in in the buffer local variable
`mumamo-multi-major-mode' when the function is called.

All functions defined by this macro is added to the list
`mumamo-defined-multi-major-modes'.

Basically Mumamo handles only major modes that uses jit-lock.
However as a special effort also `nxml-mode' and derivatives
thereof are handled.  Since it seems impossible to me to restrict
those major modes fontification to only a chunk without changing
`nxml-mode' the fontification is instead done by
`html-mode'/`sgml-mode' for chunks using `nxml-mode' and its
derivates.

CHUNKS is a list where each entry have the format

  (CHUNK-DEF-NAME MAIN-MAJOR-MODE SUBMODE-CHUNK-FUNCTIONS)

CHUNK-DEF-NAME is the key name by which the entry is recognized.
MAIN-MAJOR-MODE is the major mode used when there is no chunks.
If this is nil then `major-mode' before turning on this mode will
be used.

SUBMODE-CHUNK-FUNCTIONS is a list of the functions that does the
chunk division of the buffer.  They are tried in the order they
appear here during the chunk division process.

If you want to write new functions for chunk divisions then
please see `mumamo-possible-chunk-forward'.  You can perhaps also
use `mumamo-quick-chunk-forward' which is more easy-to-use
alternative.  See also the file mumamo-chunks.el where there are
many routines for chunk division and the file mumamo-fun where
many multi major modes are defined.

When you write those new functions you may want to use some of
the functions for testing chunks in the file

   `nxhtml/tests/mumamo-test.el'

\(fn FUN-SYM SPEC-DOC CHUNKS)" nil (quote macro))

(autoload 'mumamo-add-to-defined-multi-major-modes "mumamo" "\
Not documented

\(fn ENTRY)" nil nil)

(let ((loads (get 'mumamo 'custom-loads))) (if (member '"mumamo" loads) nil (put 'mumamo 'custom-loads (cons '"mumamo" loads))))

(let ((loads (get 'mumamo-hi-lock-faces 'custom-loads))) (if (member '"mumamo" loads) nil (put 'mumamo-hi-lock-faces 'custom-loads (cons '"mumamo" loads))))

(autoload 'mumamo-mark-for-refontification "mumamo" "\
Mark region between MIN and MAX for refontification.

\(fn MIN MAX)" nil nil)

(autoload 'mumamo-list-defined-multi-major-modes "mumamo" "\
List currently defined multi major modes.
If SHOW-DOC is non-nil show the doc strings added when defining
them. (This is not the full doc string. To show the full doc
string you can click on the multi major mode in the list.)

If SHOW-CHUNKS is non-nil show the names of the chunk dividing
functions each multi major mode uses.

If MATCH then show only multi major modes whos names matches.

See also `mumamo-guess-multi-major'.

\(fn SHOW-DOC SHOW-CHUNKS MATCH)" t nil)

(autoload 'mumamo-guess-multi-major "mumamo" "\
Find and apply a multi major mode fitting current buffer.
Choose from a list of multi major modes which chunk dividing routines
seems to be able to find chunks in the current buffer.

If REGEXP is given limit the choice to multi major mode with
names matching REGEXP.  Interactively prompt for REGEXP.

See also `mumamo-list-defined-multi-major-modes'.

\(fn REGEXP)" t nil)

(autoload 'mumamo-multi-major-modep "mumamo" "\
Return t if VALUE is a multi major mode function.

\(fn VALUE)" nil nil)

;;;***

;;;### (autoloads (mumamo-noweb2 mumamo-define-html-file-wide-keys)
;;;;;;  "mumamo-chunks" "../nxhtml/util/mumamo-chunks.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/mumamo-chunks.el

(autoload 'mumamo-define-html-file-wide-keys "mumamo-chunks" "\
Define keys in multi major mode keymap for html files.

\(fn)" nil nil)

(let ((loads (get 'mumamo-noweb2 'custom-loads))) (if (member '"mumamo-chunks" loads) nil (put 'mumamo-noweb2 'custom-loads (cons '"mumamo-chunks" loads))))

;;;***

;;;### (autoloads (mumamo-cmirr-get-mirror) "mumamo-cmirr" "../nxhtml/util/mumamo-cmirr.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/mumamo-cmirr.el

(autoload 'mumamo-cmirr-get-mirror "mumamo-cmirr" "\
Get the mirror rec.

\(fn MAJOR FOR-BUFFER)" nil nil)

;;;***

;;;### (autoloads nil "mumamo-fun" "../nxhtml/util/mumamo-fun.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/mumamo-fun.el

(define-mumamo-multi-major-mode html-mumamo-mode "Turn on multiple major modes for (X)HTML with main mode `html-mode'.\nThis covers inlined style and javascript and PHP." ("HTML Family" html-mode (mumamo-chunk-xml-pi mumamo-chunk-alt-php mumamo-chunk-alt-php= mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode nxml-mumamo-mode "Turn on multiple major modes for (X)HTML with main mode `nxml-mode'.\nThis covers inlined style and javascript and PHP.\n\nSee also `mumamo-alt-php-tags-mode'." ("nXml Family" nxml-mode (mumamo-chunk-xml-pi mumamo-chunk-alt-php mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode mason-html-mumamo-mode "Turn on multiple major modes for Mason using main mode `html-mode'.\nThis covers inlined style and javascript." ("Mason html Family" html-mode (mumamo-chunk-mason-perl-line mumamo-chunk-mason-perl-single mumamo-chunk-mason-perl-block mumamo-chunk-mason-perl-init mumamo-chunk-mason-perl-once mumamo-chunk-mason-perl-cleanup mumamo-chunk-mason-perl-shared mumamo-chunk-mason-simple-comp mumamo-chunk-mason-compcont mumamo-chunk-mason-args mumamo-chunk-mason-doc mumamo-chunk-mason-text mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode embperl-html-mumamo-mode "Turn on multiple major modes for Embperl files with main mode `html-mode'.\nThis also covers inlined style and javascript." ("Embperl HTML Family" html-mode (mumamo-chunk-embperl-<- mumamo-chunk-embperl-<+ mumamo-chunk-embperl-<! mumamo-chunk-embperl-<$ mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode django-html-mumamo-mode "Turn on multiple major modes for Django with main mode `html-mode'.\nThis also covers inlined style and javascript." ("Django HTML Family" html-mode (mumamo-chunk-django4 mumamo-chunk-django mumamo-chunk-django2 mumamo-chunk-django3 mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode genshi-html-mumamo-mode "Turn on multiple major modes for Genshi with main mode `html-mode'.\nThis also covers inlined style and javascript." ("Genshi HTML Family" html-mode (mumamo-chunk-genshi$ mumamo-chunk-py:= mumamo-chunk-py:match mumamo-chunk-xml-pi mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode mjt-html-mumamo-mode "Turn on multiple major modes for MJT with main mode `html-mode'.\nThis also covers inlined style and javascript." ("MJT HTML Family" html-mode (mumamo-chunk-mjt$ mumamo-chunk-xml-pi mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode smarty-html-mumamo-mode "Turn on multiple major modes for Smarty with main mode `html-mode'.\nThis also covers inlined style and javascript." ("Smarty HTML Family" html-mode (mumamo-chunk-xml-pi mumamo-chunk-style= mumamo-chunk-onjs= mumamo-chunk-smarty-literal mumamo-chunk-smarty-t mumamo-chunk-smarty-comment mumamo-chunk-smarty)))

(define-mumamo-multi-major-mode ssjs-html-mumamo-mode "Turn on multiple major modes for SSJS with main mode `html-mode'.\nThis covers inlined style and javascript." ("HTML Family" html-mode (mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-inlined-ssjs mumamo-chunk-ssjs-% mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode gsp-html-mumamo-mode "Turn on multiple major modes for GSP with main mode `html-mode'.\nThis also covers inlined style and javascript." ("GSP HTML Family" html-mode (mumamo-chunk-gsp mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode jsp-html-mumamo-mode "Turn on multiple major modes for JSP with main mode `html-mode'.\nThis also covers inlined style and javascript." ("JSP HTML Family" html-mode (mumamo-chunk-jsp mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode eruby-html-mumamo-mode "Turn on multiple major modes for eRuby with main mode `html-mode'.\nThis also covers inlined style and javascript." ("eRuby Html Family" html-mode (mumamo-chunk-eruby-comment mumamo-chunk-eruby= mumamo-chunk-eruby mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode eruby-javascript-mumamo-mode "Turn on multiple major modes for eRuby with main mode `javascript-mode'." ("eRuby Html Family" javascript-mode (mumamo-chunk-eruby-comment mumamo-chunk-eruby=quoted mumamo-chunk-eruby)))

(define-mumamo-multi-major-mode sh-heredoc-mumamo-mode "Turn on multiple major modes for sh heredoc document.\nSee `mumamo-heredoc-modes' for how to specify heredoc major modes." ("SH HereDoc" sh-mode (mumamo-chunk-sh-heredoc)))

(define-mumamo-multi-major-mode php-heredoc-mumamo-mode "Turn on multiple major modes for PHP heredoc document.\nSee `mumamo-heredoc-modes' for how to specify heredoc major modes." ("PHP HereDoc" php-mode (mumamo-chunk-php-heredoc)))

(define-mumamo-multi-major-mode perl-heredoc-mumamo-mode "Turn on multiple major modes for Perl heredoc document.\nSee `mumamo-heredoc-modes' for how to specify heredoc major modes." ("Perl HereDoc" perl-mode (mumamo-chunk-perl-heredoc)))

(define-mumamo-multi-major-mode cperl-heredoc-mumamo-mode "Turn on multiple major modes for Perl heredoc document.\nSee `mumamo-heredoc-modes' for how to specify heredoc major modes." ("Perl HereDoc" cperl-mode (mumamo-chunk-perl-heredoc)))

(define-mumamo-multi-major-mode python-heredoc-mumamo-mode "Turn on multiple major modes for Perl heredoc document.\nSee `mumamo-heredoc-modes' for how to specify heredoc major modes." ("Python HereDoc" python-mode (mumamo-chunk-python-heredoc)))

(define-mumamo-multi-major-mode ruby-heredoc-mumamo-mode "Turn on multiple major modes for Ruby heredoc document.\nSee `mumamo-heredoc-modes' for how to specify heredoc major modes." ("Ruby HereDoc" ruby-mode (mumamo-chunk-ruby-heredoc)))

(define-mumamo-multi-major-mode metapost-mumamo-mode "Turn on multiple major modes for MetaPost." ("MetaPost TeX Family" metapost-mode (mumamo-chunk-textext mumamo-chunk-verbatimtex)))

(define-mumamo-multi-major-mode laszlo-nxml-mumamo-mode "Turn on multiple major modes for OpenLaszlo." ("OpenLaszlo Family" nxml-mode (mumamo-chunk-inlined-script mumamo-chunk-inlined-lzx-method mumamo-chunk-inlined-lzx-handler)))

(define-mumamo-multi-major-mode csound-sgml-mumamo-mode "Turn on mutiple major modes for CSound orc/sco Modes." ("CSound orc/sco Modes" sgml-mode (mumamo-chunk-csound-sco mumamo-chunk-csound-orc)))

(define-mumamo-multi-major-mode noweb2-mumamo-mode "Multi major mode for noweb files." ("noweb Family" latex-mode (mumamo-noweb2-code-chunk)))

(define-mumamo-multi-major-mode asp-html-mumamo-mode "Turn on multiple major modes for ASP with main mode `html-mode'.\nThis also covers inlined style and javascript." ("ASP Html Family" html-mode (mumamo-chunk-asp% mumamo-chunk-asp-server-script mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode org-mumamo-mode "Turn on multiple major modes for `org-mode' files with main mode `org-mode'.\n** Note about HTML subchunks:\nUnfortunately this only allows `html-mode' (not `nxhtml-mode') in\nsub chunks." ("Org Mode + Html" org-mode (mumamo-chunk-org-html mumamo-chunk-org-src)))

(define-mumamo-multi-major-mode mako-html-mumamo-mode "Turn on multiple major modes for Mako with main mode `html-mode'.\nThis also covers inlined style and javascript." ("Mako HTML Family" html-mode (mumamo-chunk-mako-one-line-comment mumamo-chunk-mako-<%doc mumamo-chunk-mako-<%include mumamo-chunk-mako-<%inherit mumamo-chunk-mako-<%namespace mumamo-chunk-mako-<%page mumamo-chunk-mako-<%def mumamo-chunk-mako-<% mumamo-chunk-mako-% mumamo-chunk-mako$ mumamo-chunk-xml-pi mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode xsl-nxml-mumamo-mode "Turn on multi major mode for XSL with main mode `nxml-mode'.\nThis covers inlined style and javascript." ("XSL nXtml Family" nxml-mode (mumamo-chunk-inlined-style mumamo-chunk-inlined-script)))

(define-mumamo-multi-major-mode xsl-sgml-mumamo-mode "Turn on multi major mode for XSL with main mode `sgml-mode'.\nThis covers inlined style and javascript." ("XSL SGML Family" sgml-mode (mumamo-chunk-inlined-style mumamo-chunk-inlined-script)))

(define-mumamo-multi-major-mode markdown-html-mumamo-mode "Turn on multi major markdown mode in buffer.\nMain major mode will be `markdown-mode'.\nInlined html will be in `html-mode'.\n\nYou need `markdown-mode' which you can download from URL\n`http://jblevins.org/projects/markdown-mode/'." ("Markdown HTML Family" markdown-mode (mumamo-chunk-markdown-html)))

(define-mumamo-multi-major-mode latex-clojure-mumamo-mode "Turn on multi major mode latex+clojure.\nMain major mode will be `latex-mode'.\nSubchunks will be in `clojure-mode'.\n\nYou will need `clojure-mode' which you can download from URL\n`http://github.com/jochu/clojure-mode/tree'." ("Latex+clojur Family" latex-mode (mumamo-latex-closure-chunk)))

(define-mumamo-multi-major-mode latex-haskell-mumamo-mode "Turn on multi major mode latex+haskell.\nMain major mode will be `latex-mode'.\nSubchunks will be in `haskell-mode'.\n\nYou will need `haskell-mode' which you can download from URL\n`http://projects.haskell.org/haskellmode-emacs/'." ("Latex+haskell Family" latex-mode (mumamo-latex-haskell-chunk)))

(define-mumamo-multi-major-mode python-rst-mumamo-mode "Turn on multiple major modes for Python with RestructuredText docstrings." ("Python ReST Family" python-mode (mumamo-python-rst-long-string-chunk)))

(define-mumamo-multi-major-mode amrita-mumamo-mode "Turn on multiple major modes for Amrita.\nFix-me: This does not yet take care of inner chunks." ("Amrita Family" amrita-mode (mumamo-chunk-amrita-fold)))

;;;***

;;;### (autoloads (mumamo-add-region-from-string mumamo-add-region)
;;;;;;  "mumamo-regions" "../nxhtml/util/mumamo-regions.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/mumamo-regions.el

(autoload 'mumamo-add-region "mumamo-regions" "\
Add a mumamo region from selection.
Mumamo regions are like another layer of chunks above the normal chunks.
They does not affect the normal chunks, but they overrides them.

To create a mumamo region first select a visible region and then
call this function.

If the buffer is not in a multi major mode a temporary multi
major mode will be created applied to the buffer first.
To get out of this and get back to a single major mode just use

  M-x normal-mode

\(fn)" t nil)

(autoload 'mumamo-add-region-from-string "mumamo-regions" "\
Add a mumamo region from string at point.
Works as `mumamo-add-region' but for string or comment at point.

Buffer must be fontified.

\(fn)" t nil)

;;;***

;;;### (autoloads (n-back-game n-back) "n-back" "../nxhtml/util/n-back.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/n-back.el

(let ((loads (get 'n-back 'custom-loads))) (if (member '"n-back" loads) nil (put 'n-back 'custom-loads (cons '"n-back" loads))))

(autoload 'n-back-game "n-back" "\
Emacs n-Back game.
This game is supposed to increase your working memory and fluid
intelligence.

In this game something is shown for half a second on the screen
and maybe a sound is played.  You should then answer if parts of
it is the same as you have seen or heard before.  This is
repeated for about 20 trials.

You answer with the keys shown in the bottom window.

In the easiest version of the game you should answer if you have
just seen or heard what is shown now.  By default the game gets
harder as you play it with success.  Then first the number of
items presented in a trial grows.  After that it gets harder by
that you have to somehow remember not the last item, but the item
before that (or even earlier). That is what \"n-Back\" stands
for.

Note that remember does not really mean remember clearly.  The
game is for training your brain getting used to keep those things
in the working memory, maybe as a cross-modal unit.  You are
supposed to just nearly be able to do what you do in the game.
And you are supposed to have fun, that is what your brain like.

You should probably not overdue this. Half an hour a day playing
might be an optimal time according to some people.

The game is shamelessly modeled after Brain Workshop, see URL
`http://brainworkshop.sourceforge.net/' just for the fun of
getting it into Emacs.  The game resembles but it not the same as
that used in the report by Jaeggi mentioned at the above URL.

Not all features in Brain Workshop are implemented here, but some
new are maybe ... - and you have it available here in Emacs.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxhtml-features-check nxhtml-customize nxhtml)
;;;;;;  "nxhtml" "../nxhtml/nxhtml/nxhtml.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/nxhtml.el

(let ((loads (get 'nxhtml 'custom-loads))) (if (member '"nxhtml" loads) nil (put 'nxhtml 'custom-loads (cons '"nxhtml" loads))))

(autoload 'nxhtml-customize "nxhtml" "\
Customize nXhtml.

\(fn)" t nil)

(autoload 'nxhtml-features-check "nxhtml" "\
Check if external modules used by nXhtml are found.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxhtml-report-bug) "nxhtml-bug" "../nxhtml/nxhtml/nxhtml-bug.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/nxhtml-bug.el

(autoload 'nxhtml-report-bug "nxhtml-bug" "\
Report a bug in nXhtml.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxhtml-overview nxhtml-menu-mode nxhtml-browse-region
;;;;;;  nxhtml-browse-file nxhtml-edit-with-gimp mumamo-switch-to-other-html)
;;;;;;  "nxhtml-menu" "../nxhtml/nxhtml/nxhtml-menu.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/nxhtml-menu.el

(autoload 'mumamo-switch-to-other-html "nxhtml-menu" "\
Not documented

\(fn)" t nil)

(autoload 'nxhtml-edit-with-gimp "nxhtml-menu" "\
Edit with GIMP buffer or file at point.

\(fn)" t nil)

(autoload 'nxhtml-browse-file "nxhtml-menu" "\
View file in web browser.

\(fn FILE)" t nil)

(autoload 'nxhtml-browse-region "nxhtml-menu" "\
View region in web browser.

\(fn)" t nil)

(defvar nxhtml-menu-mode nil "\
Non-nil if Nxhtml-Menu mode is enabled.
See the command `nxhtml-menu-mode' for a description of this minor mode.")

(custom-autoload 'nxhtml-menu-mode "nxhtml-menu" nil)

(autoload 'nxhtml-menu-mode "nxhtml-menu" "\
Minor mode to turn on some key and menu bindings.
See `nxhtml-mode' for more information.

This minor mode adds the entry 'nXhtml' to the menu bar.  This
submenu gives easy access to most of the important features of
nXhtml.

To see an (incomplete) overview in html format do
\\[nxhtml-overview].

* Note: Please observe that when loading nXhtml some file
  associations are done, see `nxhtml-setup-file-assoc'.

Here are some important features:

- multiple major modes, see `define-mumamo-multi-major-mode'
- easy uploading and viewing of files, see for example
  `html-upl-upload-file'

- validation in XHTML part for php etc, see
  `nxhtml-validation-header-mode' (you probably also want to know
  about `nxhtml-toggle-visible-warnings' for this!)

- converting of html to xhtml, see `tidy-buffer'

Some smaller, useful, but easy-to-miss features:

* Following links. The href and src attribute names are
  underlined and a special keymap is bound to
  them:\\<mlinks-mode-map>

    \\[mlinks-backward-link], \\[mlinks-forward-link] Move
        between underlined href/src attributes

    \\[mlinks-goto], Mouse-1 Follow link inside Emacs
        (if possible)

  It is even a little bit quicker when the links are in an active
  state (marked with the face `isearch'):\\<mlinks-active-hilight-keymap>

    \\[mlinks-backward-link], \\[mlinks-forward-link] Move
        between underlined href/src attributes
    \\[mlinks-goto], Mouse-1  Follow link inside Emacs (if possible)

  If the link is not into a file that you can edit (a mailto link
  for example) you will be prompted for an alternative action.

* Creating links. To make it easier to create links to id/name
  attribute in different files there are two special
  functions:\\<nxhtml-mode-map>

    \\[nxhtml-save-link-to-here] copy link to id/name (you must
        be in the tag to get the link)
    \\[nxhtml-paste-link-as-a-tag] paste this as an a-tag.

This minor mode also adds some bindings:

\\{nxhtml-menu-mode-map}

---------
* Note: Some of the features supported are optional and available
  only if other Emacs modules are found.  Use
  \\[nxhtml-features-check] to get a list of these optional
  features and modules needed. You should however have no problem
  with this if you have followed the installation instructions
  for nXhtml.

\(fn &optional ARG)" t nil)

(autoload 'nxhtml-overview "nxhtml-menu" "\
Show a HTML page with an overview of nXhtml.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxhtml-validation-header-mode nxhtml-short-tag-help
;;;;;;  nxhtml-mode) "nxhtml-mode" "../nxhtml/nxhtml/nxhtml-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/nxhtml-mode.el

(autoload 'nxhtml-mode "nxhtml-mode" "\
Major mode for editing XHTML documents.
It is based on `nxml-mode' and adds some features that are useful
when editing XHTML files.\\<nxhtml-mode-map>

The XML menu contains functionality added by `nxml-mode' (on
which this major mode is based).  There is also a popup menu
added to the [apps] key.

The most important features are probably completion and
validation, which is inherited from `nxml-mode' with some small
addtions.  In very many situation you can use completion. To
access it type \\[nxml-complete]. Completion has been enhanced in
the following way:

- If region is active and visible then completion will surround the
  region with the chosen tag's start and end tag.  However only the
  starting point is checked for validity. If something is wrong after
  insertion you will however immediately see it if you have validation
  on.
- It can in some cases give assistance with attribute values.
- Completion can be customized, see the menus XHTML - Completion:
  * You can use a menu popup style completion.
  * You can have alternatives grouped.
  * You can get a short help text shown for each alternative.
- There does not have to be a '<' before point for tag name
  completion. (`nxml-mode' requires a '<' before point for tag name
  completion.)
- Completes xml version and encoding.
- Completes in an empty buffer, ie inserts a skeleton.

Here are all key bindings in nxhtml-mode itself:

\\{nxhtml-mode-map}

Notice that other minor mode key bindings may also be active, as
well as emulation modes. Do \\[describe-bindings] to get a list
of all active key bindings. Also, *VERY IMPORTANT*, if mumamo is
used in the buffer each mumamo chunk has a different major mode
with different key bindings. You can however still see all
bindings with \\[describe-bindings], but you have to do that with
point in the mumamo chunk you want to know the key bindings in.

\(fn)" t nil)

(autoload 'nxhtml-short-tag-help "nxhtml-mode" "\
Display description of tag TAG.  If TAG is omitted, try tag at point.

\(fn TAG)" t nil)

(autoload 'nxhtml-validation-header-mode "nxhtml-mode" "\
If on use a Fictive XHTML Validation Header for the buffer.
See `nxhtml-set-validation-header' for information about Fictive XHTML Validation Headers.

This mode may be turned on automatically in two ways:
- If you try to do completion of a XHTML tag or attribute then
  `nxthml-mode' may ask you if you want to turn this mode on if
  needed.
- You can also choose to have it turned on automatically whenever
  a mumamo multi major mode is used, see
  `nxhtml-validation-header-if-mumamo' for further information.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "nxhtml-mumamo" "../nxhtml/nxhtml/nxhtml-mumamo.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/nxhtml-mumamo.el

(define-mumamo-multi-major-mode nxhtml-mumamo-mode "Turn on multiple major modes for (X)HTML with main mode `nxhtml-mode'.\nThis covers inlined style and javascript and PHP.\n\nSee also `mumamo-alt-php-tags-mode'." ("nXhtml Family" nxhtml-mode (mumamo-chunk-xml-pi mumamo-chunk-alt-php mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode embperl-nxhtml-mumamo-mode "Turn on multiple major modes for Embperl files with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("Embperl nXhtml Family" nxhtml-mode (mumamo-chunk-embperl-<- mumamo-chunk-embperl-<+ mumamo-chunk-embperl-<! mumamo-chunk-embperl-<$ mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode django-nxhtml-mumamo-mode "Turn on multiple major modes for Django with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("Django nXhtml Family" nxhtml-mode (mumamo-chunk-django4 mumamo-chunk-django mumamo-chunk-django2 mumamo-chunk-django3 mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode mason-nxhtml-mumamo-mode "Turn on multiple major modes for Mason using main mode `nxhtml-mode'.\nThis covers inlined style and javascript." ("Mason nxhtml Family" nxhtml-mode (mumamo-chunk-mason-perl-line mumamo-chunk-mason-perl-single mumamo-chunk-mason-perl-block mumamo-chunk-mason-perl-init mumamo-chunk-mason-perl-once mumamo-chunk-mason-perl-cleanup mumamo-chunk-mason-perl-shared mumamo-chunk-mason-simple-comp mumamo-chunk-mason-compcont mumamo-chunk-mason-args mumamo-chunk-mason-doc mumamo-chunk-mason-text mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode genshi-nxhtml-mumamo-mode "Turn on multiple major modes for Genshi with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("Genshi HTML Family" nxhtml-genshi-mode (mumamo-chunk-genshi$ mumamo-chunk-py:= mumamo-chunk-py:match mumamo-chunk-xml-pi mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode mjt-nxhtml-mumamo-mode "Turn on multiple major modes for MJT with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("MJT nXhtml Family" nxhtml-mjt-mode (mumamo-chunk-mjt$ mumamo-chunk-xml-pi mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode smarty-nxhtml-mumamo-mode "Turn on multiple major modes for Smarty with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("Smarty nXhtml Family" nxhtml-mode (mumamo-chunk-xml-pi mumamo-chunk-style= mumamo-chunk-onjs= mumamo-chunk-smarty-literal mumamo-chunk-smarty-t mumamo-chunk-smarty-comment mumamo-chunk-smarty)))

(define-mumamo-multi-major-mode gsp-nxhtml-mumamo-mode "Turn on multiple major modes for GSP with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("GSP nXhtml Family" nxhtml-mode (mumamo-chunk-gsp mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode jsp-nxhtml-mumamo-mode "Turn on multiple major modes for JSP with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("JSP nXhtml Family" nxhtml-mode (mumamo-chunk-jsp mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode eruby-nxhtml-mumamo-mode "Turn on multiple major modes for eRuby with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("eRuby nXhtml Family" nxhtml-mode (mumamo-chunk-eruby-comment mumamo-chunk-eruby= mumamo-chunk-eruby mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode asp-nxhtml-mumamo-mode "Turn on multiple major modes for ASP with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("ASP nXhtml Family" nxhtml-mode (mumamo-chunk-asp% mumamo-asp-chunk-inlined-script mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

(define-mumamo-multi-major-mode mako-nxhtml-mumamo-mode "Turn on multiple major modes for Mako with main mode `nxhtml-mode'.\nThis also covers inlined style and javascript." ("Mako nXhtml Family" nxhtml-mode (mumamo-chunk-mako-one-line-comment mumamo-chunk-mako-<%doc mumamo-chunk-mako-<%include mumamo-chunk-mako-<%inherit mumamo-chunk-mako-<%namespace mumamo-chunk-mako-<%page mumamo-chunk-mako-<% mumamo-chunk-mako-% mumamo-chunk-mako$ mumamo-chunk-xml-pi mumamo-chunk-inlined-style mumamo-chunk-inlined-script mumamo-chunk-style= mumamo-chunk-onjs=)))

;;;***

;;;### (autoloads (nxhtml-byte-recompile-file nxhtml-byte-compile-file
;;;;;;  nxhtml-get-missing-files nxhtml-update-existing-files nxhtml-setup-download-all
;;;;;;  nxhtml-setup-auto-download nxhtml-setup-install) "nxhtml-web-vcs"
;;;;;;  "../nxhtml/nxhtml-web-vcs.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml-web-vcs.el

(autoload 'nxhtml-setup-install "nxhtml-web-vcs" "\
Setup and start nXhtml installation.

This is for installation and updating directly from the nXhtml
development sources.

There are two different ways to install:

  (1) Download all at once: `nxhtml-setup-download-all'
  (2) Automatically download part by part: `nxhtml-setup-auto-download'

You can convert between those ways by calling this function again.
You can also do this by setting the option `nxhtml-autoload-web' yourself.

When you have nXhtml installed you can update it:

  (3) Update new files in nXhtml: `nxhtml-update-existing-files'

To learn more about nXhtml visit its home page at URL
`http://www.emacswiki.com/NxhtmlMode/'.

If you want to test auto download (but not use it further) there
is a special function for that, you answer T here:

   (T) Test automatic download part by part: `nxhtml-setup-test-auto-download'

======
*Note*
If you want to download a zip file with latest released version instead then
please see URL `http://ourcomments.org/Emacs/nXhtml/doc/nxhtml.html'.

\(fn WAY)" t nil)

(autoload 'nxhtml-setup-auto-download "nxhtml-web-vcs" "\
Set up to autoload nXhtml files from the web.

This function will download some initial files and then setup to
download the rest when you need them.

Files will be downloaded under the directory root you specify in
DL-DIR.

Note that files will not be upgraded automatically.  The auto
downloading is just for files you are missing. (This may change a
bit in the future.) If you want to upgrade those files that you
have downloaded you can just call `nxhtml-update-existing-files'.

You can easily switch between this mode of downloading or
downloading the whole of nXhtml by once.  To switch just call the
command `nxhtml-setup-install'.

See also the command `nxhtml-setup-download-all'.

Note: If your nXhtml is to old you can't use this function
      directly.  You have to upgrade first, se the function
      above. Version 2.07 or above is good for this.

\(fn DL-DIR)" t nil)

(autoload 'nxhtml-setup-download-all "nxhtml-web-vcs" "\
Download or update all of nXhtml.

You can download all if nXhtml with this command.

To update existing files use `nxhtml-update-existing-files'.

If you want to download only those files you are actually using
then call `nxhtml-setup-auto-download' instead.

See the command `nxhtml-setup-install' for a convenient way to
call these commands.

For more information about auto download of nXhtml files see
`nxhtml-setup-auto-download'.

\(fn DL-DIR)" t nil)

(autoload 'nxhtml-update-existing-files "nxhtml-web-vcs" "\
Update existing nXhtml files from the development sources.
Only files you already have will be updated.

Note that this works both if you have setup nXhtml to auto
download files as you need them or if you have downloaded all of
nXhtml at once.

For more information about installing and updating nXhtml see the
command `nxhtml-setup-install'.

\(fn)" t nil)

(autoload 'nxhtml-get-missing-files "nxhtml-web-vcs" "\
Not documented

\(fn SUB-DIR FILE-NAME-LIST)" nil nil)

(autoload 'nxhtml-byte-compile-file "nxhtml-web-vcs" "\
Not documented

\(fn FILE &optional LOAD)" nil nil)

(autoload 'nxhtml-byte-recompile-file "nxhtml-web-vcs" "\
Byte recompile FILE file if necessary.
For more information see `nxhtml-byte-compile-file'.
Loading is done if recompiled and LOAD is t.

\(fn FILE &optional LOAD)" t nil)

;;;***

;;;### (autoloads (nxhtmlmaint-byte-uncompile-all nxhtmlmaint-byte-recompile
;;;;;;  nxhtmlmaint-start-byte-compilation) "nxhtmlmaint" "../nxhtml/nxhtmlmaint.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtmlmaint.el

(autoload 'nxhtmlmaint-start-byte-compilation "nxhtmlmaint" "\
Start byte compilation of nXhtml in new Emacs instance.
Byte compiling in general makes elisp code run 5-10 times faster
which is quite noticeable when you use nXhtml.

This will also update the file nxhtml-loaddefs.el.

You must restart Emacs to use the byte compiled files.

If for some reason the byte compiled files does not work you can
remove then with `nxhtmlmaint-byte-uncompile-all'.

See also `nxhtmlmaint-byte-recompile'

\(fn)" t nil)

(autoload 'nxhtmlmaint-byte-recompile "nxhtmlmaint" "\
Recompile or compile all nXhtml files in current Emacs.
Byte compile all elisp libraries whose .el files are newer their
.elc files.

\(fn)" t nil)

(autoload 'nxhtmlmaint-byte-uncompile-all "nxhtmlmaint" "\
Delete byte compiled files in nXhtml.
This will also update the file nxhtml-loaddefs.el.

See `nxhtmlmaint-start-byte-compilation' for byte compiling.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxhtmltest-run-Q) "nxhtmltest-Q" "../nxhtml/tests/nxhtmltest-Q.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/tests/nxhtmltest-Q.el

(autoload 'nxhtmltest-run-Q "nxhtmltest-Q" "\
Run all tests defined for nXhtml in fresh Emacs.
See `nxhtmltest-run' for more information about the tests.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxhtmltest-run nxhtmltest-run-indent) "nxhtmltest-suites"
;;;;;;  "../nxhtml/tests/nxhtmltest-suites.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/tests/nxhtmltest-suites.el

(autoload 'nxhtmltest-run-indent "nxhtmltest-suites" "\
Run indentation tests.

\(fn)" t nil)

(autoload 'nxhtmltest-run "nxhtmltest-suites" "\
Run all tests defined for nXhtml.
Currently there are only tests using ert.el defined.

Note that it is currently expected that the following tests will
fail (they corresponds to known errors in nXhtml/Emacs):

  `nxhtml-ert-nxhtml-changes-jump-back-10549'
  `nxhtml-ert-nxhtml-changes-jump-back-7014'

\(fn)" t nil)

;;;***

;;;### (autoloads (rng-find-schema-file-other-window rng-find-schema-file-other-frame
;;;;;;  rng-find-schema-file) "nxml-mode-os-additions" "../nxhtml/util/nxml-mode-os-additions.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/nxml-mode-os-additions.el

(autoload 'rng-find-schema-file "nxml-mode-os-additions" "\
Edit the current schema file.

\(fn)" t nil)

(autoload 'rng-find-schema-file-other-frame "nxml-mode-os-additions" "\
Edit the current schema in another frame.

\(fn)" t nil)

(autoload 'rng-find-schema-file-other-window "nxml-mode-os-additions" "\
Edit the current schema in another window.

\(fn)" t nil)

;;;***

;;;### (autoloads (nxml-where-global-mode nxml-where-mode nxml-where)
;;;;;;  "nxml-where" "../nxhtml/nxhtml/nxml-where.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/nxml-where.el

(let ((loads (get 'nxml-where 'custom-loads))) (if (member '"nxml-where" loads) nil (put 'nxml-where 'custom-loads (cons '"nxml-where" loads))))

(autoload 'nxml-where-mode "nxml-where" "\
Shows path in header line.

\(fn &optional ARG)" t nil)

(defvar nxml-where-global-mode nil "\
Non-nil if Nxml-Where-Global mode is enabled.
See the command `nxml-where-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `nxml-where-global-mode'.")

(custom-autoload 'nxml-where-global-mode "nxml-where" nil)

(autoload 'nxml-where-global-mode "nxml-where" "\
Toggle Nxml-Where mode in every possible buffer.
With prefix ARG, turn Nxml-Where-Global mode on if and only if
ARG is positive.
Nxml-Where mode is enabled in all buffers where
`nxml-where-turn-on-in-nxml-child' would do it.
See `nxml-where-mode' for more information on Nxml-Where mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ocr-user-mode) "ocr-user" "../nxhtml/util/ocr-user.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/ocr-user.el

(autoload 'ocr-user-mode "ocr-user" "\
Color up digits three by three.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (Prs Changes Track Apar Feature Defect) "orbit"
;;;;;;  "orbit.el" (19769 54246))
;;; Generated autoloads from orbit.el

(autoload 'Defect "orbit" "\
Gets the long version of a defect number

\(fn NUM ARG)" t nil)

(autoload 'Feature "orbit" "\
Gets the long version of a feature number

\(fn NUM ARG)" t nil)

(autoload 'Apar "orbit" "\
Gets the long version of a apar number

\(fn NUM ARG)" t nil)

(autoload 'Track "orbit" "\
Gets the long version of the tracks for a defect

\(fn NUM ARG)" t nil)

(autoload 'Changes "orbit" "\
Gets the changes for a defect

\(fn NUM ARG)" t nil)

(autoload 'Prs "orbit" "\
Gets the changes for a file

\(fn FNAME ARG)" t nil)

;;;***

;;;### (autoloads (ourcomments-warning ourcomments-M-x-menu-mode
;;;;;;  ourcomments-paste-with-convert-mode use-custom-style info-open-file
;;;;;;  replace-read-files rdir-query-replace ldir-query-replace
;;;;;;  grep-query-replace emacs-Q-nxhtml emacs-Q emacs--no-desktop
;;;;;;  emacs--debug-init emacs-buffer-file emacs emacs-restart ourcomments-ido-ctrl-tab
;;;;;;  ourcomments-ido-buffer-raise-frame ourcomments-ido-buffer-other-frame
;;;;;;  ourcomments-ido-buffer-other-window describe-symbol describe-defstruct
;;;;;;  describe-custom-group widen-to-comments-above narrow-to-defun+comments-above
;;;;;;  narrow-to-comment buffer-narrowed-p describe-command ourcomments-ediff-files
;;;;;;  find-emacs-other-file ourcomments-insert-date-and-time describe-timers
;;;;;;  ourcomments-copy+paste-set-point better-fringes-mode describe-key-and-map-briefly
;;;;;;  ourcomments-move-end-of-line ourcomments-move-beginning-of-line
;;;;;;  ourcomments-mark-whole-buffer-or-field fill-dwim unfill-individual-paragraphs
;;;;;;  unfill-region unfill-paragraph define-toggle-old define-toggle
;;;;;;  popup-menu-at-point ourcomments-indirect-fun) "ourcomments-util"
;;;;;;  "../nxhtml/util/ourcomments-util.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/ourcomments-util.el

(autoload 'ourcomments-indirect-fun "ourcomments-util" "\
Get the alias symbol for function FUN if any.

\(fn FUN)" nil nil)

(autoload 'popup-menu-at-point "ourcomments-util" "\
Popup the given menu at point.
This is similar to `popup-menu' and MENU and PREFIX has the same
meaning as there.  The position for the popup is however where
the window point is.

\(fn MENU &optional PREFIX)" nil nil)

(autoload 'define-toggle "ourcomments-util" "\
Declare SYMBOL as a customizable variable with a toggle function.
The purpose of this macro is to define a defcustom and a toggle
function suitable for use in a menu.

The arguments have the same meaning as for `defcustom' with these
restrictions:

- The :type keyword cannot be used.  Type is always 'boolean.
- VALUE must be t or nil.

DOC and ARGS are just passed to `defcustom'.

A `defcustom' named SYMBOL with doc-string DOC and a function
named SYMBOL-toggle is defined.  The function toggles the value
of SYMBOL.  It takes no parameters.

To create a menu item something similar to this can be used:

    (define-key map [SYMBOL]
      (list 'menu-item \"Toggle nice SYMBOL\"
            'SYMBOL-toggle
            :button '(:toggle . SYMBOL)))

\(fn SYMBOL VALUE DOC &rest ARGS)" nil (quote macro))

(autoload 'define-toggle-old "ourcomments-util" "\
Not documented

\(fn SYMBOL VALUE DOC &rest ARGS)" nil (quote macro))

(autoload 'unfill-paragraph "ourcomments-util" "\
Unfill the current paragraph.

\(fn)" t nil)

(autoload 'unfill-region "ourcomments-util" "\
Unfill the current region.

\(fn)" t nil)

(autoload 'unfill-individual-paragraphs "ourcomments-util" "\
Unfill individual paragraphs in the current region.

\(fn)" t nil)

(autoload 'fill-dwim "ourcomments-util" "\
Fill or unfill paragraph or region.
With prefix ARG fill only current line.

\(fn ARG)" t nil)

(autoload 'ourcomments-mark-whole-buffer-or-field "ourcomments-util" "\
Mark whole buffer or editable field at point.

\(fn)" t nil)

(autoload 'ourcomments-move-beginning-of-line "ourcomments-util" "\
Move point to beginning of line or indentation.
See `beginning-of-line' for ARG.

If `line-move-visual' is non-nil then the visual line beginning
is first tried.

If in a widget field stay in that.

\(fn ARG)" t nil)

(autoload 'ourcomments-move-end-of-line "ourcomments-util" "\
Move point to end of line or after last non blank char.
See `end-of-line' for ARG.

Similar to `ourcomments-move-beginning-of-line' but for end of
line.

\(fn ARG)" t nil)

(autoload 'describe-key-and-map-briefly "ourcomments-util" "\
Try to print names of keymap from which KEY fetch its definition.
Look in current active keymaps and find keymap variables with the
same value as the keymap where KEY is bound.  Print a message
with those keymap variable names.  Return a list with the keymap
variable symbols.

When called interactively prompt for KEY.

INSERT and UNTRANSLATED should normall be nil (and I am not sure
what they will do ;-).

\(fn &optional KEY INSERT UNTRANSLATED)" t nil)

(defvar better-fringes-mode nil "\
Non-nil if Better-Fringes mode is enabled.
See the command `better-fringes-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `better-fringes-mode'.")

(custom-autoload 'better-fringes-mode "ourcomments-util" nil)

(autoload 'better-fringes-mode "ourcomments-util" "\
Choose another fringe bitmap color and bottom angle.

\(fn &optional ARG)" t nil)

(autoload 'ourcomments-copy+paste-set-point "ourcomments-util" "\
Set point for copy+paste here.
Enable temporary minor mode `ourcomments-copy+paste-mode'.
However if point for copy+paste already is set then cancel it and
disable the minor mode.

The purpose of this command is to make it easy to grab a piece of
text and paste it at current position.  After this command you
should select a piece of text to copy and then call the command
`ourcomments-copy+paste'.

\(fn)" t nil)

(autoload 'describe-timers "ourcomments-util" "\
Show timers with readable time format.

\(fn)" t nil)

(autoload 'ourcomments-insert-date-and-time "ourcomments-util" "\
Insert date and time.
See option `ourcomments-insert-date-and-time' for how to
customize it.

\(fn)" t nil)

(autoload 'find-emacs-other-file "ourcomments-util" "\
Find corresponding file to source or installed elisp file.
If you have checked out and compiled Emacs yourself you may have
Emacs lisp files in two places, the checked out source tree and
the installed Emacs tree.  If buffer contains an Emacs elisp file
in one of these places then find the corresponding elisp file in
the other place. Return the file name of this file.

Rename current buffer using your `uniquify-buffer-name-style' if
it is set.

When DISPLAY-FILE is non-nil display this file in other window
and go to the same line number as in the current buffer.

\(fn DISPLAY-FILE)" t nil)

(autoload 'ourcomments-ediff-files "ourcomments-util" "\
In directory DEF-DIR run `ediff-files' on files FILE-A and FILE-B.
The purpose of this function is to make it eaiser to start
`ediff-files' from a shell through Emacs Client.

This is used in EmacsW32 in the file ediff.cmd where Emacs Client
is called like this:

  @%emacs_client% -e \"(setq default-directory \\\"%emacs_cd%\\\")\"
  @%emacs_client% -n  -e \"(ediff-files \\\"%f1%\\\" \\\"%f2%\\\")\"

It can of course be done in a similar way with other shells.

\(fn DEF-DIR FILE-A FILE-B)" nil nil)

(autoload 'describe-command "ourcomments-util" "\
Like `describe-function', but prompts only for interactive commands.

\(fn COMMAND)" t nil)

(autoload 'buffer-narrowed-p "ourcomments-util" "\
Return non-nil if the current buffer is narrowed.

\(fn)" nil nil)

(autoload 'narrow-to-comment "ourcomments-util" "\
Narrow to current comments.

\(fn)" t nil)

(autoload 'narrow-to-defun+comments-above "ourcomments-util" "\
Like `narrow-to-defun' but include comments above.
See also `widen-to-comments-above'.

\(fn)" t nil)

(autoload 'widen-to-comments-above "ourcomments-util" "\
Widen to include comments above current narrowing.
See also `narrow-to-defun+comments-above'.

\(fn)" t nil)

(autoload 'describe-custom-group "ourcomments-util" "\
Describe customization group SYMBOL.

\(fn SYMBOL)" t nil)

(autoload 'describe-defstruct "ourcomments-util" "\
Not documented

\(fn SYMBOL)" t nil)

(autoload 'describe-symbol "ourcomments-util" "\
Show information about SYMBOL.
Show SYMBOL plist and whether is is a variable or/and a
function.

\(fn SYMBOL)" t nil)

(autoload 'ourcomments-ido-buffer-other-window "ourcomments-util" "\
Show buffer in other window.

\(fn)" t nil)

(autoload 'ourcomments-ido-buffer-other-frame "ourcomments-util" "\
Show buffer in other frame.

\(fn)" t nil)

(autoload 'ourcomments-ido-buffer-raise-frame "ourcomments-util" "\
Raise frame showing buffer.

\(fn)" t nil)

(defvar ourcomments-ido-ctrl-tab nil "\
Non-nil if Ourcomments-Ido-Ctrl-Tab mode is enabled.
See the command `ourcomments-ido-ctrl-tab' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ourcomments-ido-ctrl-tab'.")

(custom-autoload 'ourcomments-ido-ctrl-tab "ourcomments-util" nil)

(autoload 'ourcomments-ido-ctrl-tab "ourcomments-util" "\
Enable buffer switching using C-Tab with function `ido-mode'.
This changes buffer switching with function `ido-mode' the
following way:

- You can use C-Tab.

- You can show the selected buffer in three ways independent of
  how you entered function `ido-mode' buffer switching:

  * S-return: other window
  * C-return: other frame
  * M-return: raise frame

Those keys are selected to at least be a little bit reminiscent
of those in for example common web browsers.

\(fn &optional ARG)" t nil)

(autoload 'emacs-restart "ourcomments-util" "\
Restart Emacs and start `server-mode' if on before.

\(fn)" t nil)

(autoload 'emacs "ourcomments-util" "\
Start a new Emacs with default parameters.
Additional ARGS are passed to the new Emacs.

See also `ourcomments-started-emacs-use-output-buffer'.

\(fn &rest ARGS)" t nil)

(autoload 'emacs-buffer-file "ourcomments-util" "\
Start a new Emacs showing current buffer file.
Go to the current line and column in that file.
If there is no buffer file then instead start with `dired'.

This calls the function `emacs' with argument --no-desktop and
the file or a call to dired.

\(fn &rest ARGS)" t nil)

(autoload 'emacs--debug-init "ourcomments-util" "\
Start a new Emacs with --debug-init parameter.
This calls the function `emacs' with added arguments ARGS.

\(fn &rest ARGS)" t nil)

(autoload 'emacs--no-desktop "ourcomments-util" "\
Start a new Emacs with --no-desktop parameter.
This calls the function `emacs' with added arguments ARGS.

\(fn &rest ARGS)" t nil)

(autoload 'emacs-Q "ourcomments-util" "\
Start a new Emacs with -Q parameter.
Start new Emacs without any customization whatsoever.
This calls the function `emacs' with added arguments ARGS.

\(fn &rest ARGS)" t nil)

(autoload 'emacs-Q-nxhtml "ourcomments-util" "\
Start new Emacs with -Q and load nXhtml.
This calls the function `emacs' with added arguments ARGS.

\(fn &rest ARGS)" t nil)

(autoload 'grep-query-replace "ourcomments-util" "\
Do `query-replace-regexp' of FROM with TO, on all files in *grep*.
Third arg DELIMITED (prefix arg) means replace only word-delimited matches.
If you exit (\\[keyboard-quit], RET or q), you can resume the query replace
with the command \\[tags-loop-continue].

\(fn FROM TO &optional DELIMITED)" t nil)

(autoload 'ldir-query-replace "ourcomments-util" "\
Replace FROM with TO in FILES in directory DIR.
This runs `query-replace-regexp' in files matching FILES in
directory DIR.

See `tags-query-replace' for DELIMETED and more information.

\(fn FROM TO FILES DIR &optional DELIMITED)" t nil)

(autoload 'rdir-query-replace "ourcomments-util" "\
Replace FROM with TO in FILES in directory tree ROOT.
This runs `query-replace-regexp' in files matching FILES in
directory tree ROOT.

See `tags-query-replace' for DELIMETED and more information.

\(fn FROM TO FILE-REGEXP ROOT &optional DELIMITED)" t nil)

(autoload 'replace-read-files "ourcomments-util" "\
Read files arg for replace.

\(fn REGEXP &optional REPLACE)" nil nil)

(autoload 'info-open-file "ourcomments-util" "\
Open an info file in `Info-mode'.

\(fn INFO-FILE)" t nil)

(autoload 'use-custom-style "ourcomments-util" "\
Setup like in `Custom-mode', but without things specific to Custom.

\(fn)" nil nil)

(defvar ourcomments-paste-with-convert-mode nil "\
Non-nil if Ourcomments-Paste-With-Convert mode is enabled.
See the command `ourcomments-paste-with-convert-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ourcomments-paste-with-convert-mode'.")

(custom-autoload 'ourcomments-paste-with-convert-mode "ourcomments-util" nil)

(autoload 'ourcomments-paste-with-convert-mode "ourcomments-util" "\
Pasted text may be automatically converted in this mode.
The functions in `ourcomments-paste-with-convert-hook' are run
after commands in `ourcomments-paste-with-convert-commands' if any
of the functions returns non-nil that text is inserted instead of
the original text.

For exampel when this mode is on and you paste an html link in an
`org-mode' buffer it will be directly converted to an org style
link. (This is the default behaviour.)

Tip: The Firefox plugin Copy as HTML Link is handy, see URL
     `https://addons.mozilla.org/en-US/firefox/addon/2617'.

Note: This minor mode will defadvice the paste commands.

\(fn &optional ARG)" t nil)

(defvar ourcomments-M-x-menu-mode nil "\
Non-nil if Ourcomments-M-X-Menu mode is enabled.
See the command `ourcomments-M-x-menu-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `ourcomments-M-x-menu-mode'.")

(custom-autoload 'ourcomments-M-x-menu-mode "ourcomments-util" nil)

(autoload 'ourcomments-M-x-menu-mode "ourcomments-util" "\
Add commands started from Emacs menus to M-x history.
The purpose of this is to make it easier to redo them and easier
to learn how to do them from the command line (which is often
faster if you know how to do it).

Only commands that are not already in M-x history are added.

\(fn &optional ARG)" t nil)

(autoload 'ourcomments-warning "ourcomments-util" "\
Not documented

\(fn FORMAT-STRING &rest ARGS)" nil nil)

;;;***

;;;### (autoloads (major-modep major-or-multi-majorp) "ourcomments-widgets"
;;;;;;  "../nxhtml/util/ourcomments-widgets.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/ourcomments-widgets.el
 (autoload 'command "ourcomments-widgets")

(autoload 'major-or-multi-majorp "ourcomments-widgets" "\
Return t if VALUE is a major or multi major mode function.

\(fn VALUE)" nil nil)

(autoload 'major-modep "ourcomments-widgets" "\
Return t if VALUE is a major mode function.

\(fn VALUE)" nil nil)
 (autoload 'major-mode-function "ourcomments-widgets")

;;;***

;;;### (autoloads (pause-start-in-new-emacs pause-mode pause) "pause"
;;;;;;  "../nxhtml/util/pause.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/pause.el

(let ((loads (get 'pause 'custom-loads))) (if (member '"pause" loads) nil (put 'pause 'custom-loads (cons '"pause" loads))))

(defvar pause-mode nil "\
Non-nil if Pause mode is enabled.
See the command `pause-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `pause-mode'.")

(custom-autoload 'pause-mode "pause" nil)

(autoload 'pause-mode "pause" "\
This minor mode tries to make you take a break.
It will jump up and temporary stop your work - even if you are
not in Emacs.  If you are in Emacs it will however try to be
gentle and wait until you have been idle with the keyboard for a
short while. (If you are not in Emacs it can't be gentle. How
could it?)

Then it will show you a special screen with a link to a yoga
exercise you can do when you pause.

After the pause you continue your work where you were
interrupted.

\(fn &optional ARG)" t nil)

(autoload 'pause-start-in-new-emacs "pause" "\
Start pause with interval AFTER-MINUTES in a new Emacs instance.
The new Emacs instance will be started with -Q.  However if
`custom-file' is non-nil it will be loaded so you can still
customize pause.

One way of using this function may be to put in your .emacs
something like

  ;; for just one Emacs running pause
  (when server-mode (pause-start-in-new-emacs 15))

See `pause-start' for more info.

\(fn AFTER-MINUTES)" t nil)

;;;***

;;;### (autoloads (php-mode php-file-patterns php) "php-mode" "../nxhtml/related/php-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/php-mode.el

(let ((loads (get 'php 'custom-loads))) (if (member '"php-mode" loads) nil (put 'php 'custom-loads (cons '"php-mode" loads))))

(defvar php-file-patterns '("\\.php[s34]?\\'" "\\.phtml\\'" "\\.inc\\'") "\
List of file patterns for which to automatically invoke `php-mode'.")

(custom-autoload 'php-file-patterns "php-mode" nil)

(autoload 'php-mode "php-mode" "\
Major mode for editing PHP code.

\\{php-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (global-pointback-mode pointback-mode) "pointback"
;;;;;;  "../nxhtml/util/pointback.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/pointback.el

(autoload 'pointback-mode "pointback" "\
Restore previous window point when switching back to a buffer.

\(fn &optional ARG)" t nil)

(defvar global-pointback-mode nil "\
Non-nil if Global-Pointback mode is enabled.
See the command `global-pointback-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-pointback-mode'.")

(custom-autoload 'global-pointback-mode "pointback" nil)

(autoload 'global-pointback-mode "pointback" "\
Toggle Pointback mode in every possible buffer.
With prefix ARG, turn Global-Pointback mode on if and only if
ARG is positive.
Pointback mode is enabled in all buffers where
`pointback-on' would do it.
See `pointback-mode' for more information on Pointback mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (popcmp-completing-read popcmp-completion-style
;;;;;;  popcmp) "popcmp" "../nxhtml/util/popcmp.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/popcmp.el

(let ((loads (get 'popcmp 'custom-loads))) (if (member '"popcmp" loads) nil (put 'popcmp 'custom-loads (cons '"popcmp" loads))))

(defvar popcmp-completion-style (cond (t 'popcmp-popup)) "\
Completion style.
The currently available completion styles are:

- popcmp-popup: Use OS popup menus (default).
- emacs-default: Emacs default completion.
- Company Mode completion.
- anything: The Anything elisp lib completion style.

The style of completion set here is not implemented for all
completions.  The scope varies however with which completion
style you have choosen.

For information about Company Mode and how to use it see URL
`http://www.emacswiki.org/emacs/CompanyMode'.

For information about Anything and how to use it see URL
`http://www.emacswiki.org/emacs/Anything'.

See also the options `popcmp-short-help-beside-alts' and
`popcmp-group-alternatives' which are also availabe when popup
completion is available.")

(custom-autoload 'popcmp-completion-style "popcmp" nil)

(autoload 'popcmp-completing-read "popcmp" "\
Read a string in the minubuffer with completion, or popup a menu.
This function can be used instead `completing-read'. The main
purpose is to provide a popup style menu for completion when
completion is tighed to text at point in a buffer. If a popup
menu is used it will be shown at window point. Whether a popup
menu or minibuffer completion is used is governed by
`popcmp-completion-style'.

The variables PROMPT, TABLE, PREDICATE, REQUIRE-MATCH,
INITIAL-INPUT, POP-HIST, DEF and INHERIT-INPUT-METHOD all have the
same meaning is for `completing-read'.

ALT-HELP should be nil or a hash variable or an association list
with the completion alternative as key and a short help text as
value.  You do not need to supply help text for all alternatives.
The use of ALT-HELP is set by `popcmp-short-help-beside-alts'.

ALT-SETS should be nil or an association list that has as keys
groups and as second element an alternative that should go into
this group.

\(fn PROMPT TABLE &optional PREDICATE REQUIRE-MATCH INITIAL-INPUT POP-HIST DEF INHERIT-INPUT-METHOD ALT-HELP ALT-SETS)" nil nil)

;;;***

;;;### (autoloads (x-find-tag get-symbol-non-interactively get-symbol-interactively)
;;;;;;  "ptags" "ptags.el" (19769 54246))
;;; Generated autoloads from ptags.el

(autoload 'get-symbol-interactively "ptags" "\
Used by cscope and others to get a symbol in a tags style interface
and allow for interactive confirmation or changes

\(fn PROMPT)" nil nil)

(autoload 'get-symbol-non-interactively "ptags" "\
Used by cscope and others to get a symbol under the cursor.  Uses
the same mechanism for the default as get-symbol-interactively

\(fn)" nil nil)

(autoload 'x-find-tag "ptags" "\
Find function via TAGS that mouse is pointing at

\(fn CLICK)" t nil)

;;;***

;;;### (autoloads (pgp-insinuate-keys) "rat-pgp" "rat-pgp.el" (19769
;;;;;;  54246))
;;; Generated autoloads from rat-pgp.el

(autoload 'pgp-insinuate-keys "rat-pgp" "\
Call from various mode setup hooks to bind PGP keys.

\(fn)" nil nil)

;;;***

;;;### (autoloads (rebind-keys-mode rebind) "rebind" "../nxhtml/util/rebind.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/rebind.el

(let ((loads (get 'rebind 'custom-loads))) (if (member '"rebind" loads) nil (put 'rebind 'custom-loads (cons '"rebind" loads))))

(defvar rebind-keys-mode nil "\
Non-nil if Rebind-Keys mode is enabled.
See the command `rebind-keys-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `rebind-keys-mode'.")

(custom-autoload 'rebind-keys-mode "rebind" nil)

(autoload 'rebind-keys-mode "rebind" "\
Rebind keys as defined in `rebind-keys'.
The key bindings will override almost all other key bindings
since it is put on emulation level, like for example ``cua-mode'
and `viper-mode'.

This is for using for example C-a to mark the whole buffer (or a
field). There are some predifined keybindings for this.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (kill-retain-buffers find-pmr-in-cs-buffer sanitize-pmr-number
;;;;;;  x-no-op x-get-pmr ppp pmrorder cs put-pmr put-all-pmr find-number
;;;;;;  pmr-search pgrep PTF APAR PMR retain-common wait-for-async-process
;;;;;;  async-call-process process-complete find-pmr pmrorder-mode)
;;;;;;  "retain" "retain.el" (19769 54246))
;;; Generated autoloads from retain.el

(autoload 'pmrorder-mode "retain" "\
Mode to go into when looking at the output of PMR order

\(fn)" nil nil)

(autoload 'find-pmr "retain" "\
Used by the interactive command to pickup the complete pmr number
the cursor is on

\(fn PROMPT)" nil nil)

(autoload 'process-complete "retain" "\
Look for process to enter the exit state and then clean up its
buffer and delete it from the process table

\(fn PROCESS STATE)" nil nil)

(autoload 'async-call-process "retain" "\
Not documented

\(fn PROGRAM INFILE BUFFER DISPLAY &rest ARGS)" nil nil)

(autoload 'wait-for-async-process "retain" "\
Wait for PROC to finish

\(fn PROC)" nil nil)

(autoload 'retain-common "retain" "\
Common routine which creates a buffer called BUFNAME.  If the
buffer already exists then it is used unless FORCE-ERASE (the prefix
arg) is true.  Then call-process using CMD with ARGS.  The buffer is
selected when finished.  Another feature is if this is called inside
the buffer that we are looking for, then we assume the user wants to
refresh the buffer so FORCE-ERASE is set to true

\(fn BUFNAME CMD ARGS NAME &optional FORCE-ERASE)" nil nil)

(autoload 'PMR "retain" "\
Gets a PMR

\(fn NUMBER ARG)" t nil)

(autoload 'APAR "retain" "\
Gets a APAR

\(fn NUMBER ARG)" t nil)

(autoload 'PTF "retain" "\
Gets a PTF

\(fn NUMBER ARG)" t nil)

(autoload 'pgrep "retain" "\
Gets the output of pgrep

\(fn NUMBER ARG)" t nil)

(autoload 'pmr-search "retain" "\
Makes a call to pmrsearch

\(fn PATTERN ARG)" t nil)

(autoload 'find-number "retain" "\
Finds the apar or pmr number from the pmr's text

\(fn)" t nil)

(autoload 'put-all-pmr "retain" "\
Plops the current pmr into the current buffer

\(fn)" t nil)

(autoload 'put-pmr "retain" "\
Plops the current pmr into the current buffer

\(fn)" t nil)

(autoload 'cs "retain" "\
Get the queue from retain

\(fn QUEUE ARG)" t nil)

(autoload 'pmrorder "retain" "\
Get the pmrorder report for QUEUES into a buffer named pmrorder and
set up a local map so that the first mouse button will get the pmr
picked on.

\(fn QUEUES ARG)" t nil)

(autoload 'ppp "retain" "\
Get the pmrorder report for QUEUES into a buffer named pmrorder and
set up a local map so that the first mouse button will get the pmr
picked on.

\(fn)" t nil)

(autoload 'x-get-pmr "retain" "\
Bound to a mouse button, retrieves the pmr, apar, or ptf whose
number is pointed to

\(fn CLICK)" t nil)

(autoload 'x-no-op "retain" "\
Does nothing with a mouse event

\(fn CLICK)" t nil)

(autoload 'sanitize-pmr-number "retain" "\
Returns a sanitized version of the PMR number passed in.  If an
apar number is passed in, the apar to pmr conversion is done.  If the
string begins with \"pmr\", it is stripped of.  Any spaces are
converted to commas

\(fn S)" t nil)

(autoload 'find-pmr-in-cs-buffer "retain" "\
When bound to a mouse event in a \"cs\" buffer, the pmr on the line
clicked on is retrieved

\(fn CLICK)" t nil)

(autoload 'kill-retain-buffers "retain" "\
Kill the PMR, APAR, and cs buffers

\(fn)" t nil)

;;;***

;;;### (autoloads (ri) "ri-ruby" "../ruby/ri-emacs/ri-ruby.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../ruby/ri-emacs/ri-ruby.el

(autoload 'ri "ri-ruby" "\
Execute `ri'.

\(fn KEYW &optional CLASS)" t nil)

;;;***

;;;### (autoloads (rinari-minor-mode rinari-launch) "rinari" "../ruby/rinari/rinari.el"
;;;;;;  (19772 45255))
;;; Generated autoloads from ../ruby/rinari/rinari.el

(autoload 'rinari-launch "rinari" "\
Run `rinari-minor-mode' if inside of a rails projecct,
otherwise turn `rinari-minor-mode' off if it is on.

\(fn)" t nil)

(defvar rinari-major-modes (if (boundp 'rinari-major-modes) rinari-major-modes (list 'find-file-hook 'mumamo-after-change-major-mode-hook 'dired-mode-hook)) "\
Major Modes from which to launch Rinari.")

(dolist (hook rinari-major-modes) (add-hook hook 'rinari-launch))

(autoload 'rinari-minor-mode "rinari" "\
Enable Rinari minor mode providing Emacs support for working
with the Ruby on Rails framework.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (rinari-merb-minor-mode) "rinari-merb" "../ruby/rinari/rinari-merb.el"
;;;;;;  (19772 45255))
;;; Generated autoloads from ../ruby/rinari/rinari-merb.el

(autoload 'rinari-merb-minor-mode "rinari-merb" "\
Enable Rinari-Merb minor mode providing Emacs support for working
with the Ruby on Rails framework.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (rnc-mode) "rnc-mode" "../nxhtml/util/rnc-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/rnc-mode.el

(autoload 'rnc-mode "rnc-mode" "\
Major mode for editing RELAX NG Compact Syntax schemas.
\\{rnc-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (rncdl-update-html5) "rncdl" "../nxhtml/nxhtml/rncdl.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/rncdl.el

(autoload 'rncdl-update-html5 "rncdl" "\
Update and setup (x)html5 rnc files.
Download rnc files from url `http://syntax.whattf.org/relaxng/'.

Those files are needed to edit (x)html5 with `nxml-mode' support.

The schemas will be enabled based on file name extensions
'.html5' and '.xhtml5'.

\(fn)" t nil)

;;;***

;;;### (autoloads (rngalt-set-validation-header) "rngalt" "../nxhtml/nxhtml/rngalt.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/rngalt.el

(autoload 'rngalt-set-validation-header "rngalt" "\
Not documented

\(fn START-OF-DOC)" nil nil)

;;;***

;;;### (autoloads (ruby-compilation-this-buffer ruby-compilation-cap
;;;;;;  ruby-compilation-rake ruby-compilation-run pcomplete/cap
;;;;;;  pcomplete/rake) "ruby-compilation" "../ruby/rinari/util/ruby-compilation.el"
;;;;;;  (19772 45255))
;;; Generated autoloads from ../ruby/rinari/util/ruby-compilation.el

(autoload 'pcomplete/rake "ruby-compilation" "\
Not documented

\(fn)" nil nil)

(autoload 'pcomplete/cap "ruby-compilation" "\
Not documented

\(fn)" nil nil)

(autoload 'ruby-compilation-run "ruby-compilation" "\
Run a ruby process dumping output to a ruby compilation buffer.

\(fn CMD &optional RUBY-OPTIONS)" t nil)

(autoload 'ruby-compilation-rake "ruby-compilation" "\
Run a rake process dumping output to a ruby compilation buffer.

\(fn &optional EDIT TASK ENV-VARS)" t nil)

(autoload 'ruby-compilation-cap "ruby-compilation" "\
Run a capistrano process dumping output to a ruby compilation buffer.

\(fn &optional EDIT TASK ENV-VARS)" t nil)

(autoload 'ruby-compilation-this-buffer "ruby-compilation" "\
Run the current buffer through Ruby compilation.

\(fn)" t nil)

;;;***

;;;### (autoloads (ruby-mode) "ruby-mode" "../ruby/rinari/util/ruby-mode.el"
;;;;;;  (19772 45255))
;;; Generated autoloads from ../ruby/rinari/util/ruby-mode.el

(autoload 'ruby-mode "ruby-mode" "\
Major mode for editing Ruby scripts.
\\[ruby-indent-line] properly indents subexpressions of multi-line
class, module, def, if, while, for, do, and case statements, taking
nesting into account.

The variable ruby-indent-level controls the amount of indentation.
\\{ruby-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("rbx" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("jruby" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby1.9" . ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby1.8" . ruby-mode))

;;;***

;;;### (autoloads (rvm-open-gem rvm-use rvm-activate-corresponding-ruby
;;;;;;  rvm-use-default) "rvm" "../ruby/rvm/rvm.el" (19771 30910))
;;; Generated autoloads from ../ruby/rvm/rvm.el

(autoload 'rvm-use-default "rvm" "\
use the rvm-default ruby as the current ruby version

\(fn)" t nil)

(autoload 'rvm-activate-corresponding-ruby "rvm" "\
activate the corresponding ruby version for the file in the current buffer.
This function searches for an .rvmrc file and actiavtes the configured ruby.
If no .rvmrc file is found, the default ruby is used insted.

\(fn)" t nil)

(autoload 'rvm-use "rvm" "\
switch the current ruby version to any ruby, which is installed with rvm

\(fn NEW-RUBY NEW-GEMSET)" t nil)

(autoload 'rvm-open-gem "rvm" "\
Not documented

\(fn GEMHOME)" t nil)

;;;***

;;;### (autoloads (search-form) "search-form" "../nxhtml/util/search-form.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/search-form.el

(autoload 'search-form "search-form" "\
Display a form for search and replace.

\(fn)" t nil)

;;;***

;;;### (autoloads (sex-mode sex) "sex-mode" "../nxhtml/util/sex-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/sex-mode.el

(let ((loads (get 'sex 'custom-loads))) (if (member '"sex-mode" loads) nil (put 'sex 'custom-loads (cons '"sex-mode" loads))))

(defvar sex-mode nil "\
Non-nil if Sex mode is enabled.
See the command `sex-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `sex-mode'.")

(custom-autoload 'sex-mode "sex-mode" nil)

(autoload 'sex-mode "sex-mode" "\
Open certain files in external programs.
See `sex-get-file-open-cmd' for how to determine which files to
open by external applications.  Note that this selection is
nearly the same as in `org-mode'.  The main difference is that
the fallback always is to open a file in Emacs. (This is
necessary to avoid to disturb many of Emacs operations.)

This affects all functions that opens files, like `find-file',
`find-file-noselect' etc.

However it does not affect files opened through Emacs client.

Urls can also be handled, see `sex-handle-urls'.

When opening a file with the shell a (temporary) dummy buffer is
created in Emacs with major mode `sex-file-mode' and an external
program is called to handle the file.  How this dummy buffer is
handled is governed by `sex-keep-dummy-buffer'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (smarty-mode smarty) "smarty-mode" "../nxhtml/related/smarty-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/smarty-mode.el

(let ((loads (get 'smarty 'custom-loads))) (if (member '"smarty-mode" loads) nil (put 'smarty 'custom-loads (cons '"smarty-mode" loads))))

(autoload 'smarty-mode "smarty-mode" "\
Smarty Mode
***********

Smarty Mode is a GNU XEmacs major mode for editing Smarty templates.

1 Introduction
**************

Smarty-Mode is a mode allowing easy edit of Smarty templates:
highlight, templates, navigation into source files...


Features (new features in bold) :

   * Completion
   * Customizable
   * Highlight
   * Menu
   * Stuttering
   * Templates
        - Built-in Functions
        - User Functions
        - Variable Modifiers
        - Plugin (Functions)
             * BlockRepeatPlugin
             * ClipCache
             * Smarty Formtool
             * Smarty Paginate
             * Smarty Validate
        - Plugin (Variable Modifiers)
             * AlternativeDateModifierPlugin
             * B2Smilies
             * BBCodePlugin
        - Fonctions Non-Smarty



This manual describes Smarty Mode version 0.0.5.

2 Installation
**************

2.1 Requirements
================

Smarty Mode is a XEmacs major mode that needs the following
software/packages (all are included in Emacs 23):

   * GNU Emacs or XEmacs (http://www.xemacs.org/).

   * `font-lock' mode generaly installed with XEmacs.

   * `assoc' mode generaly installed with XEmacs.

   * `easymenu' mode generaly installed with XEmacs.

   * `hippie-exp' mode generaly installed with XEmacs.

Before continuing, you must be sure to have all this packages
installed.

2.2 Download
============

Two internet address to download Smarty Mode :

   * Principal: Smarty-Mode 0.0.5
     (http://deboutv.free.fr/lisp/smarty/download/smarty-0.0.5.tar.gz)
     (http://deboutv.free.fr/lisp/smarty/)

   * Secondary: Smarty-Mode 0.0.5
     (http://www.morinie.fr/lisp/smarty/download/smarty-0.0.5.tar.gz)
     (http://www.morinie.fr/lisp/smarty/)

   * Old releases: Smarty-Mode
     (http://deboutv.free.fr/lisp/smarty/download.php)
     (http://deboutv.free.fr/lisp/smarty/)

2.3 Installation
================

2.3.1 Installation
------------------

To install Smarty Mode you need to choose an installation directory
\(for example `/usr/local/share/lisp' or `c:lisp'). The administrator
must have the write rights on this directory.

With your favorite unzip software, unzip the archive in the
installation directory.

Example:
     cd /usr/local/share/lisp
     tar zxvf smarty-0.0.5.tar.gz
Now you have a `smarty' directory in the installation directory. This
directory contains 2 files `smarty-mode.el' and `smarty-mode.elc' and
another directory `docs' containing the documentation.

You need to configure XEmacs. open you initialization file `init.el'
\(open the file or start XEmacs then choose the Options menu and Edit
Init File). Add the following lines (the installation directory in
this example is `/usr/local/share/lisp') :

     (setq load-path
           (append (list \"/usr/local/share/lisp/\") load-path))
     (autoload 'smarty-mode \"smarty-mode\" \"Smarty Mode\" t)

2.3.2 Update
------------

The update is easy. You need to unzip the archive in the installation
directory to remove the old release.

Example:
     cd /usr/local/share/lisp
     rm -rf smarty
     tar zxvf smarty-0.0.5.tar.gz

2.4 Invoke Smarty-Mode
======================

You have two possibilities to invoke the Smarty Mode.

   - Manually: At each file opening you need to launch Smarty Mode
     with the following command:

     `M-x smarty-mode'

   - Automatically: Add the following linesin your initialization
     file `init.el' :

          (setq auto-mode-alist
                (append
                 '((\"\\.tpl$\" . smarty-mode))
          	 auto-mode-alist))


3 Customization
***************

This chapter describes the differents parameters and functions that
you can change to customize Smarty Mode.  To do that, open a Smarty
file, click on the Smarty menu and choose Options then Browse
Options....

3.1 Parameters
==============

3.1.1 Mode
----------

Smarty Mode has 2 modes allowing to simplify the writing of Smarty
templates. You can enable/disable each mode individually.

`smarty-electric-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable automatic generation of template.
     If `nil'; template generators can still be invoked through key
     bindings and menu. Is indicated in the modeline by \"/e\" after
     the mode name and can be toggled by `smarty-electric-mode'.

`smarty-stutter-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable the stuttering. Is indicated in the
     modeline by \"/s\" after the mode name and can be toggled by
     `smarty-stutter-mode'.

3.1.2 Menu
----------

Smarty Mode has also 1 menu that you can enable/disable. The menu
Sources is specific to each Smarty files opened.

`smarty-source-file-menu'
     Type: boolean
     Default value: `t'
     Description: If `t'; the Sources menu is enabled. This menu
     contains the list of Smarty file located in the current
     directory. The Sources menu scans the directory when a file is
     opened.

3.1.3 Menu
----------

`smarty-highlight-plugin-functions'
     Type: boolean
     Default value: `t'
     Description: If `t'; the functions described in the smarty
     plugins are highlighted.

3.1.4 Templates
---------------

3.1.4.1 Header
..............

`smarty-file-header'
     Type: string
     Default value: `\"\"'
     Description: String or file to insert as file header. If the
     string specifies an existing file name the contents of the file
     is inserted; otherwise the string itself is inserted as file
     header.
     Type `C-j' for newlines.
     The follonwing keywords are supported:
     <filename>: replaced by the file name.
     <author>: replaced by the user name and email address.
     <login>: replaced by `user-login-name'.
     <company>: replaced by `smarty-company-name' content.
     <date>: replaced by the current date.
     <year>: replaced by the current year.
     <copyright>: replaced by `smarty-copyright-string' content.
     <cursor>: final cursor position.

`smarty-file-footer'
     Type: string
     Default value: `\"\"'
     Description: String or file to insert as file footer.  See
     `smarty-file-header'

`smarty-company-name'
     Type: string
     Default value: `\"\"'
     Description: Name of the company to insert in file header.

`smarty-copyright-string'
     Type: string
     Default value: `\"\"'
     Description: Coryright string to insert in file header.

`smarty-date-format'
     Type: string
     Default value: `\"%Y-%m-%d\"'
     Description: Date format.

`smarty-modify-date-prefix-string'
     Type: string
     Default value: `\"\"'
     Description: Prefix string of modification date in Smarty file
     header.

`smarty-modify-date-on-saving'
     Type: bool
     Default value: `nil'
     Description: If `t'; update the modification date when the
     buffer is saved.

3.1.5 Miscellaneous
-------------------

`smarty-left-delimiter'
     Type: string
     Default value: `\"\"'
     Description: Left escaping delimiter for Smarty templates.

`smarty-right-delimiter'
     Type: string
     Default value: `\"\"'
     Description: Right escaping delimiter for Smarty templates.

`smarty-intelligent-tab'
     Type: bool
     Default value: `t'
     Description: If `t'; TAB does indentation; completion and insert
     tabulations. If `nil'; TAB does only indentation.

`smarty-word-completion-in-minibuffer'
     Type: bool
     Default value: `t'
     Description: If `t'; enable completion in the minibuffer.

`smarty-word-completion-case-sensitive'
     Type: bool
     Default value: `nil'
     Description: If `t'; completion is case sensitive.

3.2 Functions
=============

3.2.1 Mode
----------

`smarty-electric-mode'
     Menu: Smarty -> Options -> Mode -> Electric Mode
     Keybinding: `C-c C-m C-e'
     Description: This functions is used to enable/disable the
     electric mode.

`smarty-stutter-mode'
     Menu: Smarty -> Options -> Mode -> Stutter Mode
     Keybinding: `C-c C-m C-s'
     Description: This function is used to enable/disable the stutter
     mode.

4 Menus
*******

There are 2 menus: Smarty and Sources. All theses menus can be
accessed from the menubar or from the right click. This chapter
describes each menus.

4.1 Smarty
==========

This is the main menu of Smarty Mode. It allows an easy access to the
main features of the Smarty Mode: Templates (see *Note Templates::)
and Options (see *Note Customization::).

This menu contains also 3 functions that are discussed in the next
part.

4.1.1 Functions
---------------

`smarty-show-messages'
     Menu: Smarty -> Show Messages
     Keybinding: `C-c M-m'
     Description: This function opens the *Messages* buffer to
     display previous error messages.

`smarty-doc-mode'
     Menu: Smarty -> Smarty Mode Documentation
     Keybinding: `C-c C-h'
     Description: This function opens the *Help* buffer and prints in
     it the Smarty Mode documentation.

`smarty-version'
     Menu: Smarty -> Version
     Keybinding: `C-c C-v'
     Description: This function displays in the minibuffer the
     current Smarty Mode version with the timestamp.

4.2 Sources
===========

The Sources menu shows the Smarty files in the current directory. If
you add or delete a file in the current directory, you need to
refresh the menu.

4.2.1 Customization
-------------------

`smarty-source-file-menu'
     Type: boolean
     Default value: `t'
     Description: If `t'; the Sources menu is enabled. This menu
     contains the list of Smarty file located in the current
     directory. The Sources menu scans the directory when a file is
     opened.

4.2.2 Functions
---------------

`smarty-add-source-files-menu'
     Menu: Sources -> *Rescan*
     Keybinding: `C-c C-s C-u'
     Description: This function is used to refresh the Sources menu.

5 Stuttering
************

The stutter mode is a mode that affects a function to a key. For
example, when you use the `ENTER' key, the associated function will
create a new line and indent it.

5.1 Customization
=================

`smarty-stutter-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable the stuttering. Is indicated in the
     modeline by \"/s\" after the mode name and can be toggled by
     `smarty-stutter-mode'.

5.2 Functions
=============

`SPACE'
     If in comment, indent the comment and add new line if necessary.
     In other case, add a space.

`('
     If the previous character is a `(', the `((' will be replaced by
     `['.
     If the previous character is a `[', the `[(' will be replaced by
     `{'.
     In other case, insert a `('.

`)'
     If the previous character is a `)', the `))' will be replaced by
     `]'.
     If the previous character is a `]', the `])' will be replaced by
     `}'.
     In other case, insert a `)'.

6 Templates
***********

In the Smarty Mode, the Smarty functions (like if, while, for, fopen,
fclose) are predefined in functions called \"Templates\".

Each template can be invoked by the function name or by using the
<SPACE> key after the Smarty function name in the buffer (Note, using
`M-<SPACE>' disable the template).

A template can be aborted by using the `C-g' or by lefting empty the
tempate prompt (in the minibuffer).

6.1 Customization
=================

`smarty-electric-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable automatic generation of template.
     If `nil'; template generators can still be invoked through key
     bindings and menu. Is indicated in the modeline by \"/e\" after
     the mode name and can be toggled by `smarty-electric-mode'.

For a complete description of the template customizable variables,
see *Note Cu01-Pa01-Template::

6.2 Functions
=============

6.2.1 Smarty Functions
----------------------

For Smarty functions, see PDF or HTML documentation.

6.2.2 Non-Smarty Functions
--------------------------

`smarty-template-header'
     Menu: Smarty -> Templates -> Insert Header
     Keybinding: `C-c C-t C-h'
     Description: This function is used to insert a header in the
     current buffer.

`smarty-template-footer'
     Menu: Smarty -> Templates -> Insert Footer
     Keybinding: `C-c C-t C-f'
     Description: This function is used to insert a footer in the
     current buffer.

`smarty-template-insert-date'
     Menu: Smarty -> Templates -> Insert Date
     Keybinding: `C-c C-t C-d i'
     Description: This function is used to insert the date in the
     current buffer.

`smarty-template-modify'
     Menu: Smarty -> Templates -> Modify Date
     Keybinding: `C-c C-t C-d m'
     Description: This function is used to modify the last
     modification date in the current buffer.

7 Bugs, Help
************

   * To report bugs: Bugtracker
     (http://bugtracker.morinie.fr/lisp/set_project.php?project_id=2)

   * To obtain help you can post on the dedicated forum: Forum
     (http://forum.morinie.fr/lisp/)

8 Key bindings
**************

\\{smarty-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (smarty-mode) "smarty-mode-vdebout" "../nxhtml/alts/smarty-mode-vdebout.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/alts/smarty-mode-vdebout.el

(autoload 'smarty-mode "smarty-mode-vdebout" "\
Smarty Mode
***********

Smarty Mode is a GNU XEmacs major mode for editing Smarty templates.

1 Introduction
**************

Smarty-Mode is a mode allowing easy edit of Smarty templates:
highlight, templates, navigation into source files...



Features (new features in bold) :

   * Completion

   * Customizable

   * Highlight

   * Menu

   * Stuttering

   * Templates
        - Built-in Functions

        - User Functions

        - Variable Modifiers

        - Plugin (Functions)
             * Smarty Formtool

             * Smarty Paginate

             * Smarty Validate

        - Plugin (Variable Modifiers)
             * AlternativeDateModifierPlugin

             * B2Smilies

             * BBCodePlugin

        - Fonctions Non-Smarty



This manual describes Smarty Mode version 0.0.4.

2 Installation
**************

2.1 Requirements
================

Smarty Mode is a XEmacs major mode that needs the following
software/packages:

   * XEmacs (http://www.xemacs.org/).

   * `font-lock' mode generaly installed with XEmacs.

   * `assoc' mode generaly installed with XEmacs.

   * `easymenu' mode generaly installed with XEmacs.

   * `hippie-exp' mode generaly installed with XEmacs.

Before continuing, you must be sure to have all this packages
installed.

2.2 Download
============

Two internet address to download Smarty Mode :

   * Principal: Smarty-Mode 0.0.4
     (http://deboutv.free.fr/lisp/smarty/download/smarty-0.0.4.tar.gz)
     (http://deboutv.free.fr/lisp/smarty/)

   * Secondary: Smarty-Mode 0.0.4
     (http://www.morinie.fr/lisp/smarty/download/smarty-0.0.4.tar.gz)
     (http://www.morinie.fr/lisp/smarty/)

   * Old releases: Smarty-Mode
     (http://deboutv.free.fr/lisp/smarty/download.php)
     (http://deboutv.free.fr/lisp/smarty/)

2.3 Installation
================

2.3.1 Installation
------------------

To install Smarty Mode you need to choose an installation directory
\(for example `/usr/local/share/lisp' or `c:lisp'). The administrator
must have the write rights on this directory.

With your favorite unzip software, unzip the archive in the
installation directory.

Example:
     cd /usr/local/share/lisp
     tar zxvf smarty-0.0.4.tar.gz
Now you have a `smarty' directory in the installation directory. This
directory contains 2 files `smarty-mode.el' and `smarty-mode.elc' and
another directory `docs' containing the documentation.

You need to configure XEmacs. open you initialization file `init.el'
\(open the file or start XEmacs then choose the Options menu and Edit
Init File). Add the following lines (the installation directory in
this example is `/usr/local/share/lisp') :

     (setq load-path
           (append (list \"/usr/local/share/lisp/\") load-path))
     (autoload 'smarty-mode \"smarty-mode\" \"Smarty Mode\" t)

2.3.2 Update
------------

The update is easy. You need to unzip the archive in the installation
directory to remove the old release.

Example:
     cd /usr/local/share/lisp
     rm -rf smarty
     tar zxvf smarty-0.0.4.tar.gz

2.4 Invoke Smarty-Mode
======================

You have two possibilities to invoke the Smarty Mode.

   - Manually: At each file opening you need to launch Smarty Mode
     with the following command:

     `M-x smarty-mode'

   - Automatically: Add the following linesin your initialization
     file `init.el' :

          (setq auto-mode-alist
                (append
                 '((\"\\.tpl$\" . smarty-mode))
          	 auto-mode-alist))


3 Customization
***************

This chapter describes the differents parameters and functions that
you can change to customize Smarty Mode.  To do that, open a Smarty
file, click on the Smarty menu and choose Options then Browse
Options....

3.1 Parameters
==============

3.1.1 Mode
----------

Smarty Mode has 2 modes allowing to simplify the writing of Smarty
templates. You can enable/disable each mode individually.

`smarty-electric-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable automatic generation of template.
     If `nil'; template generators can still be invoked through key
     bindings and menu. Is indicated in the modeline by \"/e\" after
     the mode name and can be toggled by `smarty-electric-mode'.

`smarty-stutter-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable the stuttering. Is indicated in the
     modeline by \"/s\" after the mode name and can be toggled by
     `smarty-stutter-mode'.

3.1.2 Menu
----------

Smarty Mode has also 1 menu that you can enable/disable. The menu
Sources is specific to each Smarty files opened.

`smarty-source-file-menu'
     Type: boolean
     Default value: `t'
     Description: If `t'; the Sources menu is enabled. This menu
     contains the list of Smarty file located in the current
     directory. The Sources menu scans the directory when a file is
     opened.

3.1.3 Menu
----------

`smarty-highlight-plugin-functions'
     Type: boolean
     Default value: `t'
     Description: If `t'; the functions described in the smarty
     plugins are highlighted.

3.1.4 Templates
---------------

3.1.4.1 Header
..............

`smarty-file-header'
     Type: string
     Default value: `\"\"'
     Description: String or file to insert as file header. If the
     string specifies an existing file name the contents of the file
     is inserted; otherwise the string itself is inserted as file
     header.
     Type `C-j' for newlines.
     The follonwing keywords are supported:
     <filename>: replaced by the file name.
     <author>: replaced by the user name and email address.
     <login>: replaced by `user-login-name'.
     <company>: replaced by `smarty-company-name' content.
     <date>: replaced by the current date.
     <year>: replaced by the current year.
     <copyright>: replaced by `smarty-copyright-string' content.
     <cursor>: final cursor position.

`smarty-file-footer'
     Type: string
     Default value: `\"\"'
     Description: String or file to insert as file footer.  See
     `smarty-file-header'

`smarty-company-name'
     Type: string
     Default value: `\"\"'
     Description: Name of the company to insert in file header.

`smarty-copyright-string'
     Type: string
     Default value: `\"\"'
     Description: Coryright string to insert in file header.

`smarty-date-format'
     Type: string
     Default value: `\"%Y-%m-%d\"'
     Description: Date format.

`smarty-modify-date-prefix-string'
     Type: string
     Default value: `\"\"'
     Description: Prefix string of modification date in Smarty file
     header.

`smarty-modify-date-on-saving'
     Type: bool
     Default value: `nil'
     Description: If `t'; update the modification date when the
     buffer is saved.

3.1.5 Miscellaneous
-------------------

`smarty-left-delimiter'
     Type: string
     Default value: `\"\"'
     Description: Left escaping delimiter for Smarty templates.

`smarty-right-delimiter'
     Type: string
     Default value: `\"\"'
     Description: Right escaping delimiter for Smarty templates.

`smarty-intelligent-tab'
     Type: bool
     Default value: `t'
     Description: If `t'; TAB does indentation; completion and insert
     tabulations. If `nil'; TAB does only indentation.

`smarty-word-completion-in-minibuffer'
     Type: bool
     Default value: `t'
     Description: If `t'; enable completion in the minibuffer.

`smarty-word-completion-case-sensitive'
     Type: bool
     Default value: `nil'
     Description: If `t'; completion is case sensitive.

3.2 Functions
=============

3.2.1 Mode
----------

`smarty-electric-mode'
     Menu: Smarty -> Options -> Mode -> Electric Mode
     Keybinding: `C-c C-m C-e'
     Description: This functions is used to enable/disable the
     electric mode.

`smarty-stutter-mode'
     Menu: Smarty -> Options -> Mode -> Stutter Mode
     Keybinding: `C-c C-m C-s'
     Description: This function is used to enable/disable the stutter
     mode.

4 Menus
*******

There are 2 menus: Smarty and Sources. All theses menus can be
accessed from the menubar or from the right click. This chapter
describes each menus.

4.1 Smarty
==========

This is the main menu of Smarty Mode. It allows an easy access to the
main features of the Smarty Mode: Templates (see *Note Templates::)
and Options (see *Note Customization::).

This menu contains also 3 functions that are discussed in the next
part.

4.1.1 Functions
---------------

`smarty-show-messages'
     Menu: Smarty -> Show Messages
     Keybinding: `C-c M-m'
     Description: This function opens the *Messages* buffer to
     display previous error messages.

`smarty-doc-mode'
     Menu: Smarty -> Smarty Mode Documentation
     Keybinding: `C-c C-h'
     Description: This function opens the *Help* buffer and prints in
     it the Smarty Mode documentation.

`smarty-version'
     Menu: Smarty -> Version
     Keybinding: `C-c C-v'
     Description: This function displays in the minibuffer the
     current Smarty Mode version with the timestamp.

4.2 Sources
===========

The Sources menu shows the Smarty files in the current directory. If
you add or delete a file in the current directory, you need to
refresh the menu.

4.2.1 Customization
-------------------

`smarty-source-file-menu'
     Type: boolean
     Default value: `t'
     Description: If `t'; the Sources menu is enabled. This menu
     contains the list of Smarty file located in the current
     directory. The Sources menu scans the directory when a file is
     opened.

4.2.2 Functions
---------------

`smarty-add-source-files-menu'
     Menu: Sources -> *Rescan*
     Keybinding: `C-c C-s C-u'
     Description: This function is used to refresh the Sources menu.

5 Stuttering
************

The stutter mode is a mode that affects a function to a key. For
example, when you use the `ENTER' key, the associated function will
create a new line and indent it.

5.1 Customization
=================

`smarty-stutter-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable the stuttering. Is indicated in the
     modeline by \"/s\" after the mode name and can be toggled by
     `smarty-stutter-mode'.

5.2 Functions
=============

`SPACE'
     If in comment, indent the comment and add new line if necessary.
     In other case, add a space.

`('
     If the previous character is a `(', the `((' will be replaced by
     `['.
     If the previous character is a `[', the `[(' will be replaced by
     `{'.
     In other case, insert a `('.

`)'
     If the previous character is a `)', the `))' will be replaced by
     `]'.
     If the previous character is a `]', the `])' will be replaced by
     `}'.
     In other case, insert a `)'.

6 Templates
***********

In the Smarty Mode, the Smarty functions (like if, while, for, fopen,
fclose) are predefined in functions called \"Templates\".

Each template can be invoked by the function name or by using the
<SPACE> key after the Smarty function name in the buffer (Note, using
`M-<SPACE>' disable the template).

A template can be aborted by using the `C-g' or by lefting empty the
tempate prompt (in the minibuffer).

6.1 Customization
=================

`smarty-electric-mode'
     Type: boolean
     Default value: `t'
     Description: If `t'; enable automatic generation of template.
     If `nil'; template generators can still be invoked through key
     bindings and menu. Is indicated in the modeline by \"/e\" after
     the mode name and can be toggled by `smarty-electric-mode'.

For a complete description of the template customizable variables,
see *Note Cu01-Pa01-Template::

6.2 Functions
=============

6.2.1 Smarty Functions
----------------------

For Smarty functions, see PDF or HTML documentation.

6.2.2 Non-Smarty Functions
--------------------------

`smarty-template-header'
     Menu: Smarty -> Templates -> Insert Header
     Keybinding: `C-c C-t C-h'
     Description: This function is used to insert a header in the
     current buffer.

`smarty-template-footer'
     Menu: Smarty -> Templates -> Insert Footer
     Keybinding: `C-c C-t C-f'
     Description: This function is used to insert a footer in the
     current buffer.

`smarty-template-insert-date'
     Menu: Smarty -> Templates -> Insert Date
     Keybinding: `C-c C-t C-d i'
     Description: This function is used to insert the date in the
     current buffer.

`smarty-template-modify'
     Menu: Smarty -> Templates -> Modify Date
     Keybinding: `C-c C-t C-d m'
     Description: This function is used to modify the last
     modification date in the current buffer.

7 Bugs, Help
************

   * To report bugs: Bugtracker
     (http://bugtracker.morinie.fr/lisp/set_project.php?project_id=2)

   * To obtain help you can post on the dedicated forum: Forum
     (http://forum.morinie.fr/lisp/)

8 Key bindings
**************

\\{smarty-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (sml-modeline-mode sml-modeline) "sml-modeline"
;;;;;;  "../nxhtml/util/sml-modeline.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/sml-modeline.el

(let ((loads (get 'sml-modeline 'custom-loads))) (if (member '"sml-modeline" loads) nil (put 'sml-modeline 'custom-loads (cons '"sml-modeline" loads))))

(defvar sml-modeline-mode nil "\
Non-nil if Sml-Modeline mode is enabled.
See the command `sml-modeline-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `sml-modeline-mode'.")

(custom-autoload 'sml-modeline-mode "sml-modeline" nil)

(autoload 'sml-modeline-mode "sml-modeline" "\
Show buffer size and position like scrollbar in mode line.
You can customize this minor mode, see option `sml-modeline-mode'.

Note: If you turn this mode on then you probably want to turn off
option `scroll-bar-mode'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (x-spew-find-symbol x-spew-view-from-list x-spew-goto-from-list-other-window
;;;;;;  x-spew-goto-from-list spew-find-goodies spew-format spew-wait
;;;;;;  spew-init-process spew-view-from-list spew-goto-from-list
;;;;;;  spew-get-line-number spew-find-symbol spew-mode) "spew" "spew.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from spew.el

(autoload 'spew-mode "spew" "\
Major mode used to look at the spew output stuff

Type:
  n to go to the next line
  Space to go to the next line
  p to go to the previous line
  Rubout to go to the previous line
  v to view the file and line
  q to delete the spew window
  e to edit the file at the line

\(fn)" nil nil)

(autoload 'spew-find-symbol "spew" "\
Find all references to the symbol

\(fn STRING)" t nil)

(autoload 'spew-get-line-number "spew" "\
Returns the \"line number\" out of a spew output buffer

\(fn)" nil nil)

(autoload 'spew-goto-from-list "spew" "\
Point is in a buffer pointing to a line produced by
spew-list-line. This routine plops into the file at the appropriate
spot

\(fn ARG)" t nil)

(autoload 'spew-view-from-list "spew" "\
Point is in a buffer pointing to a line produced by
spew-list-line. This routine plops into the file at the appropriate
spot

\(fn)" t nil)

(autoload 'spew-init-process "spew" "\
Not documented

\(fn)" nil nil)

(autoload 'spew-wait "spew" "\
Waits for the spew process to finish

\(fn)" nil nil)

(autoload 'spew-format "spew" "\
Formats the output of spew to be pretty

\(fn)" nil nil)

(autoload 'spew-find-goodies "spew" "\
Calls the spew program and sends it STRING, plops into the buffer
and puts the buffer into spew-mode

\(fn STRING)" t nil)

(autoload 'x-spew-goto-from-list "spew" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload 'x-spew-goto-from-list-other-window "spew" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload 'x-spew-view-from-list "spew" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload 'x-spew-find-symbol "spew" "\
Find all references to the symbol which is clicked on

\(fn CLICK)" t nil)

;;;***

;;;### (autoloads (tabkey2-emma-without-tabkey2 tabkey2-mode tabkey2)
;;;;;;  "tabkey2" "../nxhtml/util/tabkey2.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/tabkey2.el

(let ((loads (get 'tabkey2 'custom-loads))) (if (member '"tabkey2" loads) nil (put 'tabkey2 'custom-loads (cons '"tabkey2" loads))))

(defvar tabkey2-mode nil "\
Non-nil if Tabkey2 mode is enabled.
See the command `tabkey2-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `tabkey2-mode'.")

(custom-autoload 'tabkey2-mode "tabkey2" nil)

(autoload 'tabkey2-mode "tabkey2" "\
More fun with Tab key number two (completion etc).
This global minor mode by default binds Tab in a way that let you
do completion with Tab in all buffers (where it is possible).

The Tab key is easy to type on your keyboard.  Then why not use
it for completion, something that is very useful?  Shells usually
use Tab for completion so many are used to it.  This was the idea
of Smart Tabs and this is a generalization of that idea.

However in Emacs the Tab key is usually used for indentation.
The idea here is that if Tab has been pressed once for
indentation, then as long as point stays further Tab keys might
as well do completion.

So you kind of do Tab-Tab for first completion (and then just
Tab for further completions as long as point is not moved).

And there is even kind of Tab-Tab-Tab completion: If completion
fails the next completion function will be the one you try with
next Tab. (You get some notification of this, of course.)

See `tabkey2-first' for more information about usage.

Note: If you do not want the Tab-Tab behaviour above, but still
want an easy way to reach the available completion functions,
then you can instead of turning on tabkey2-mode enter this in
your .emacs:

 (global-set-key [f8] 'tabkey2-cycle-completion-functions)

After hitting f8 you will then be in the same state as after the
first in tabkey2-mode.

\(fn &optional ARG)" t nil)

(autoload 'tabkey2-emma-without-tabkey2 "tabkey2" "\
Not documented

\(fn)" nil nil)

;;;***

;;;### (autoloads (tidy-build-menu tidy) "tidy-xhtml" "../nxhtml/nxhtml/tidy-xhtml.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/tidy-xhtml.el

(let ((loads (get 'tidy 'custom-loads))) (if (member '"tidy-xhtml" loads) nil (put 'tidy 'custom-loads (cons '"tidy-xhtml" loads))))

(autoload 'tidy-build-menu "tidy-xhtml" "\
Set up the tidy menu in MAP.
Used to set up a Tidy menu in your favourite mode.

\(fn &optional MAP)" t nil)

;;;***

;;;### (autoloads (tt-mode) "tt-mode" "../nxhtml/related/tt-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/tt-mode.el

(autoload 'tt-mode "tt-mode" "\
Major mode for editing Template Toolkit files.

\(fn)" t nil)

;;;***

;;;### (autoloads (tyda-mode) "tyda" "../nxhtml/util/tyda.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/tyda.el

(defvar tyda-mode nil "\
Non-nil if Tyda mode is enabled.
See the command `tyda-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `tyda-mode'.")

(custom-autoload 'tyda-mode "tyda" nil)

(autoload 'tyda-mode "tyda" "\
Minor mode for key bindings for `tyda-lookup-word'.
It binds Alt-Mouse-1 just as the Tyda add-on does in Firefox.
Here are all key bindings

\\{tyda-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (udev-call-first-step) "udev" "../nxhtml/util/udev.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/udev.el

(autoload 'udev-call-first-step "udev" "\
Set up and call first step.
Set up buffer LOG-BUFFER to be used for log messages and
controling of the execution of the functions in list STEPS which
are executed one after another.

Write HEADER at the end of LOG-BUFFER.

Call first step.

If FINISH-FUN non-nil it should be a function. This is called
after last step with LOG-BUFFER as parameter.

\(fn LOG-BUFFER STEPS HEADER FINISH-FUN)" nil nil)

;;;***

;;;### (autoloads (udev-ecb-customize-startup udev-ecb-update) "udev-ecb"
;;;;;;  "../nxhtml/util/udev-ecb.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/util/udev-ecb.el

(autoload 'udev-ecb-update "udev-ecb" "\
Fetch and install ECB from the devel sources.
To determine where to store the sources see `udev-ecb-dir'.
For how to start ECB see `udev-ecb-load-ecb'.

\(fn)" t nil)

(autoload 'udev-ecb-customize-startup "udev-ecb" "\
Customize ECB dev nXhtml startup group.

\(fn)" t nil)

;;;***

;;;### (autoloads (udev-rinari-update) "udev-rinari" "../nxhtml/util/udev-rinari.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/udev-rinari.el

(autoload 'udev-rinari-update "udev-rinari" "\
Fetch and install Rinari from the devel sources.
To determine where to store the sources and how to start rinari
see `udev-rinari-dir' and `udev-rinari-load-rinari'.

\(fn)" t nil)

;;;***

;;;### (autoloads (update-my-autoloads update-lisp recursive-update-lisp
;;;;;;  kill-buffers-reqexp server-ediff-files update-my-autoloads
;;;;;;  from-work from-home v4-build-compilation-finish start-vm
;;;;;;  split-window-in-thirds backspace-delete-flip xon-xoff-mode)
;;;;;;  "util" "util.el" (19772 50463))
;;; Generated autoloads from util.el

(autoload 'xon-xoff-mode "util" "\
Swap keys, etc so that xon/xoff flow control works

\(fn)" t nil)

(autoload 'backspace-delete-flip "util" "\
Swap keys, etc so that backspace and delete are flipped:

\(fn)" t nil)

(autoload 'split-window-in-thirds "util" "\
Split the window where point is at into thirds displaying other
buffers in the two other windows

\(fn)" t nil)

(autoload 'start-vm "util" "\
Starts vm but sets some variables based upon the display

\(fn &optional FOLDER READ-ONLY)" t nil)

(autoload 'v4-build-compilation-finish "util" "\
This function is hooked into compile.el by pointing
compilation-finish-function at it.  It goes through the buffer looking
for \"cd ../.......\" at the beginning as well as the \"[ /bos/blah
]\" messages and converts them into Entering and Leaving messages.

\(fn BUF MSG)" nil nil)

(autoload 'from-home "util" "\
Call this when working from home

\(fn)" t nil)

(autoload 'from-work "util" "\
Call this when working from work

\(fn)" t nil)

(autoload 'update-my-autoloads "util" "\
Update my personal loaddefs.el file

\(fn)" t nil)

(autoload 'server-ediff-files "util" "\
Called from ediff program via gnudoit

\(fn FILE1 FILE2)" nil nil)

(autoload 'kill-buffers-reqexp "util" "\
Kill all the buffers whose names match REQEXP.  Confirm before
killing if ASK is true.

\(fn REQEXP &optional ASK)" t nil)

(autoload 'recursive-update-lisp "util" "\
Calls `update-lisp' for every *.el file in DIR or its sub
  directories

\(fn DIR)" t nil)

(autoload 'update-lisp "util" "\
Calls `byte-compile-file' and `update-file-autoloads' on FILE.

\(fn FILE)" t nil)

(autoload 'update-my-autoloads "util" "\
Not documented

\(fn FILE)" nil nil)

;;;***

;;;### (autoloads (v3-uncompress-while-visiting v3-get-file-buffer
;;;;;;  find-file-noselect v3-clone-relative-path v3-get-clone-top
;;;;;;  v3-get-clone-list v3-setup process-output-to-string) "v3-file"
;;;;;;  "v3-file.el" (19769 54246))
;;; Generated autoloads from v3-file.el

(autoload 'process-output-to-string "v3-file" "\
Execute process and return its stdout as a string

\(fn PROG &rest ARGS)" nil nil)

(autoload 'v3-setup "v3-file" "\
Setup v3-clone-list by calling Tpath with argument supplied

\(fn LEVEL)" t nil)

(autoload 'v3-get-clone-list "v3-file" "\
Called to get the clone-list.  Looks at v3-clone-list and if it is
null then it calls v3-setup with v3-clone-base if non-null
otherwise it calls v3-setup interactively

\(fn)" nil nil)

(autoload 'v3-get-clone-top "v3-file" "\
Call to retrieve the first directory in the list of directories searched

\(fn)" t nil)

(autoload 'v3-clone-relative-path "v3-file" "\
If FILENAME is in the v3 build environment, returns the part of the
filename which iss relative to the tpath directories, otherwise
returns nil

\(fn FILENAME)" nil nil)

(autoload 'find-file-noselect "v3-file" "\
Read file FILENAME into a buffer and return the buffer.
If a buffer exists visiting FILENAME, return that one,
but verify that the file has not changed since visited or saved.
The buffer is not selected, just returned to the caller.

\(fn FILENAME &optional NOWARN RAWFILE WILDCARDS)" nil nil)

(autoload 'v3-get-file-buffer "v3-file" "\
Returns buffer whose buffer-file-name ends with NAME

\(fn NAME)" nil nil)

(autoload 'v3-uncompress-while-visiting "v3-file" "\
Temporary \"major mode\" used for .Z files, to uncompress the contents.
It then selects a major mode from the uncompressed file name and contents.

\(fn)" nil nil)

;;;***

;;;### (autoloads (viper-tutorial) "viper-tut" "../nxhtml/util/viper-tut.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/viper-tut.el

(autoload 'viper-tutorial "viper-tut" "\
Run a tutorial for Viper.

A simple classic tutorial in 5 parts that have been used by many
people starting to learn vi keys.  You may learn enough to start
using `viper-mode' in Emacs.

Some people find that vi keys helps against repetetive strain
injury, see URL

  `http://www.emacswiki.org/emacs/RepeatedStrainInjury'.

Note: There might be a few clashes between vi key binding and
Emacs standard key bindings.  You will be notified about those in
the tutorial.  Even more, if your own key bindings comes in
between you will be notified about that too.

\(fn PART &optional DONT-ASK-FOR-REVERT)" t nil)

;;;***

;;;### (autoloads (visual-basic-mode) "visual-basic-mode" "../nxhtml/related/visual-basic-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/visual-basic-mode.el

(autoload 'visual-basic-mode "visual-basic-mode" "\
A mode for editing Microsoft Visual Basic programs.
Features automatic indentation, font locking, keyword capitalization,
and some minor convenience functions.
Commands:
\\{visual-basic-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (vline-global-mode vline-mode) "vline" "../nxhtml/util/vline.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/vline.el

(autoload 'vline-mode "vline" "\
Display vertical line mode.

\(fn &optional ARG)" t nil)

(defvar vline-global-mode nil "\
Non-nil if Vline-Global mode is enabled.
See the command `vline-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `vline-global-mode'.")

(custom-autoload 'vline-global-mode "vline" nil)

(autoload 'vline-global-mode "vline" "\
Display vertical line mode as globally.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (web-vcs-investigate-elisp-file web-vcs-url-copy-file
;;;;;;  web-vcs-url-retrieve-synch web-vcs-byte-compile-file web-vcs-message-with-face
;;;;;;  web-vcs-get-files-from-root web-vcs-log-edit web-vcs-default-download-directory)
;;;;;;  "web-vcs" "../nxhtml/web-vcs.el" (19769 54246))
;;; Generated autoloads from ../nxhtml/web-vcs.el

(autoload 'web-vcs-default-download-directory "web-vcs" "\
Try to find a suitable place.
Considers site-start.el, site-

\(fn)" nil nil)

(autoload 'web-vcs-log-edit "web-vcs" "\
Open log file.

\(fn)" t nil)

(autoload 'web-vcs-get-files-from-root "web-vcs" "\
Download a file tree from VCS system using the web interface.
Use WEB-VCS entry in variable `web-vcs-links-regexp' to download
files via http from URL to directory DL-DIR.

Show URL first and offer to visit the page.  That page will give
you information about version control system (VCS) system used
etc.

\(fn WEB-VCS URL DL-DIR)" nil nil)

(autoload 'web-vcs-message-with-face "web-vcs" "\
Display a colored message at the bottom of the string.
FACE is the face to use for the message.
FORMAT-STRING and ARGS are the same as for `message'.

Also put FACE on the message in *Messages* buffer.

\(fn FACE FORMAT-STRING &rest ARGS)" nil nil)

(autoload 'web-vcs-byte-compile-file "web-vcs" "\
Byte compile FILE in a new Emacs sub process.
EXTRA-LOAD-PATH is added to the front of `load-path' during
compilation.

FILE is set to `buffer-file-name' when called interactively.
If LOAD

\(fn FILE &optional LOAD EXTRA-LOAD-PATH COMP-DIR)" t nil)

(autoload 'web-vcs-url-retrieve-synch "web-vcs" "\
Retrieve URL, return cons with buffer and http status.

\(fn URL)" nil nil)

(autoload 'web-vcs-url-copy-file "web-vcs" "\
Copy URL to NEWNAME.  Both args must be strings.
Signals a `file-already-exists' error if file NEWNAME already exists,
unless a third argument OK-IF-ALREADY-EXISTS is supplied and non-nil.
A number as third arg means request confirmation if NEWNAME already exists.
This is what happens in interactive use with M-x.
Fourth arg KEEP-TIME non-nil means give the new file the same
last-modified time as the old one.  (This works on only some systems.)
Fifth arg PRESERVE-UID-GID is ignored.
A prefix arg makes KEEP-TIME non-nil.

\(fn URL NEWNAME &optional OK-IF-ALREADY-EXISTS KEEP-TIME PRESERVE-UID-GID)" nil nil)

(autoload 'web-vcs-investigate-elisp-file "web-vcs" "\
Not documented

\(fn FILE-OR-BUFFER)" t nil)

;;;***

;;;### (autoloads (whelp) "whelp" "../nxhtml/util/whelp.el" (19769
;;;;;;  54246))
;;; Generated autoloads from ../nxhtml/util/whelp.el

(let ((loads (get 'whelp 'custom-loads))) (if (member '"whelp" loads) nil (put 'whelp 'custom-loads (cons '"whelp" loads))))

;;;***

;;;### (autoloads (which-function-mode) "which-func" "../ruby/rinari/util/jump/which-func.el"
;;;;;;  (19772 45397))
;;; Generated autoloads from ../ruby/rinari/util/jump/which-func.el
 (put 'which-func-format 'risky-local-variable t)
 (put 'which-func-current 'risky-local-variable t)

(defalias 'which-func-mode 'which-function-mode)

(defvar which-function-mode nil "\
Non-nil if Which-Function mode is enabled.
See the command `which-function-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `which-function-mode'.")

(custom-autoload 'which-function-mode "which-func" nil)

(autoload 'which-function-mode "which-func" "\
Toggle Which Function mode, globally.
When Which Function mode is enabled, the current function name is
continuously displayed in the mode line, in certain major modes.

With prefix ARG, turn Which Function mode on if arg is positive,
and off otherwise.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (wikipedia-draft-buffer wikipedia-draft-page wikipedia-draft
;;;;;;  wikipedia-mode) "wikipedia-mode" "../nxhtml/related/wikipedia-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/related/wikipedia-mode.el

(autoload 'wikipedia-mode "wikipedia-mode" "\
Major mode for editing wikimedia style wikis.
Major mode for editing articles written in the markup language
used by Wikipedia, the free on-line
encyclopedia (see URL `http://www.wikipedia.org').

There are several ways to use wikipedia-mode:

- You can simply cut and paste articles between Emacs and your
  web browser's text box.
- If you are using Firefox you can use the It's All Text add-on
  for Firefox.
- You can use MozEx, a Mozilla/Firefox web browser extension that
  allows you to call Emacs from a text
  box (see URL `http://mozex.mozdev.org/').
- Another way is to use the PERL script ee-helper, which allows
  you to up and download wiki texts.

Wikipedia articles are usually unfilled: newline characters are not
used for breaking paragraphs into lines. Unfortunately, Emacs does not
handle word wrapping yet. As a workaround, wikipedia-mode turns on
longlines-mode automatically. In case something goes wrong, the
following commands may come in handy:

\\[wikipedia-fill-article] fills the buffer.
\\[wikipedia-unfill-article] unfills the buffer.
Be warned that function can be dead  slow, better use wikipedia-unfill-paragraph-or-region.
\\[wikipedia-unfill-paragraph-or-region] unfills the paragraph
\\[wikipedia-unfill-paragraph-simple] doehe same but simpler.



The following commands put in markup structures.

\\[wikipedia-insert-bold-italic] bold+italic
\\[wikipedia-insert-bold] bold text
\\[wikipedia-insert-italics] italics
\\[wikipedia-insert-nowiki] no wiki markup
\\[wikipedia-insert-link-wiki] inserts a link

The following commands are also defined:
\\[wikipedia-insert-user] inserts user name
\\[wikipedia-insert-signature] inserts ~~~~
\\[wikipedia-insert-enumerate] inserts enumerate type structures
\\[wikipedia-insert-itemize] inserts itemize type structures
\\[wikipedia-insert-hline] inserts a hline

The draft functionality
\\[wikipedia-draft]
\\[wikipedia-draft-region]
\\[wikipedia-draft-view-draft]
\\[wikipedia-draft-page]
\\[wikipedia-draft-buffer]

Replying and sending functionality
\\[wikipedia-reply-at-point-simple]
\\[wikipedia-draft-reply]


The register functionality
\\[wikipedia-copy-page-to-register]
\\[defun wikipedia-insert-page-to-register]


Some simple editing commands.
\\[wikipedia-enhance-indent]
\\[wikipedia-yank-prefix]
\\[wikipedia-unfill-paragraph-or-region]



\\[wikipedia-terminate-paragraph]     starts a new list item or paragraph in a context-aware manner.

\(fn)" t nil)

(autoload 'wikipedia-draft "wikipedia-mode" "\
Open a temporary buffer in wikipedia mode for editing an
 wikipedia draft, which an arbitrary piece of data. After
 finishing the editing either use \\[wikipedia-draft-buffer] to
 send the data into the wikipedia-draft-data-file, or send the
 buffer using `wikipedia-draft-send-to-mozex' and insert it later
 into a wikipedia article.

\(fn)" t nil)

(autoload 'wikipedia-draft-page "wikipedia-mode" "\
Not documented

\(fn)" t nil)

(autoload 'wikipedia-draft-buffer "wikipedia-mode" "\
Wikipedia-draft-buffer sends the contents of the current (temporary)
buffer to the wikipedia-draft-buffer, see the variable
wikipedia-draft-data-file.

\(fn)" t nil)

(defvar wikipedia-draft-send-archive t "\
*Archive the reply.")

;;;***

;;;### (autoloads (winsav-switch-config winsav-save-full-config winsav-save-mode
;;;;;;  winsav winsav-put-window-tree) "winsav" "../nxhtml/util/winsav.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/winsav.el

(autoload 'winsav-put-window-tree "winsav" "\
Put window structure SAVED-TREE into WINDOW.
Restore a structure SAVED-TREE returned from
`winsav-get-window-tree' into window WINDOW.

If COPY-WIN-OVL is non-nil then overlays having a 'window
property pointing to one of the windows in SAVED-TREE where this
window still is shown will be copied to a new overlay with
'window property pointing to the corresponding new window.

If WIN-OVL-ALL-BUFS is non-nil then all buffers will be searched
for overlays with a 'window property of the kind above.

At the very end of this function the hook `winsav-after-put' is
run.

\(fn SAVED-TREE WINDOW &optional COPY-WIN-OVL WIN-OVL-ALL-BUFS)" nil nil)

(let ((loads (get 'winsav 'custom-loads))) (if (member '"winsav" loads) nil (put 'winsav 'custom-loads (cons '"winsav" loads))))

(defvar winsav-save-mode nil "\
Non-nil if Winsav-Save mode is enabled.
See the command `winsav-save-mode' for a description of this minor mode.")

(custom-autoload 'winsav-save-mode "winsav" nil)

(autoload 'winsav-save-mode "winsav" "\
Toggle winsav configuration saving mode.
With numeric ARG, turn winsav saving on if ARG is positive, off
otherwise.

When this mode is turned on, winsav configurations are saved from
one session to another.  A winsav configuration consists of
frames, windows and visible buffers configurations plus
optionally buffers and files managed by the functions used by
option `desktop-save-mode'

By default this is integrated with `desktop-save-mode'.  If
`desktop-save-mode' is on and `winsav-handle-also-desktop' is
non-nil then save and restore also desktop.

See the command `winsav-switch-config' for more information and
other possibilities.

Note: If you want to avoid saving when you exit just turn off
this minor mode.

For information about what is saved and restored and how to save
and restore additional information see the function
`winsav-save-configuration'.

\(fn &optional ARG)" t nil)

(autoload 'winsav-save-full-config "winsav" "\
Saved current winsav configuration in directory DIRNAME.
Then change to this configuration.

See also `winsav-switch-config'.

\(fn DIRNAME)" nil nil)

(autoload 'winsav-switch-config "winsav" "\
Change to winsav configuration in directory DIRNAME.
If DIRNAME is the current winsav configuration directory then
offer to save it or restore it from saved values.

Otherwise, before switching offer to save the current winsav
configuration.  Then finally switch to the new winsav
configuration, creating it if it does not exist.

If option `desktop-save-mode' is on then buffers and files are also
restored and saved the same way.

See also option `winsav-save-mode' and command
`winsav-tell-configuration'.

\(fn DIRNAME)" t nil)

;;;***

;;;### (autoloads (winsav-rotate winsize-set-mode-line-colors winsize-save-window-configuration
;;;;;;  winsize-balance-siblings resize-windows) "winsize" "../nxhtml/util/winsize.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/winsize.el

(autoload 'resize-windows "winsize" "\
Start window resizing.
During resizing a window is selected.  You can move its
borders. In the default configuration the arrow keys moves the
right or bottom border if they are there. To move the opposite
border use S-arrowkeys.

You can also do other window operations, like splitting, deleting
and balancing the sizes.  The keybindings below describes the key
bindings during resizing:\\<winsize-keymap>

  `balance-windows'                      \\[balance-windows]
  `winsize-balance-siblings'             \\[winsize-balance-siblings]
  `fit-window-to-buffer'                 \\[fit-window-to-buffer]
  `shrink-window-if-larger-than-buffer'  \\[shrink-window-if-larger-than-buffer]

  `winsav-rotate'                        \\[winsav-rotate]

  `winsize-move-border-up'      \\[winsize-move-border-up]
  `winsize-move-border-down'    \\[winsize-move-border-down]
  `winsize-move-border-left'    \\[winsize-move-border-left]
  `winsize-move-border-right'   \\[winsize-move-border-right]

  `winsize-to-border-or-window-left'    \\[winsize-to-border-or-window-left]
  `winsize-to-border-or-window-up'      \\[winsize-to-border-or-window-up]
  `winsize-to-border-or-window-right'   \\[winsize-to-border-or-window-right]
  `winsize-to-border-or-window-down'    \\[winsize-to-border-or-window-down]

   Note that you can also use your normal keys for
   `forward-char', `backward-char', `next-line', `previous-line'
   and what you have on HOME and END to move in the windows. That
   might sometimes be necessary to directly select a
   window. (You may however also use `other-window' or click
   with the mouse, see below.)

  `delete-window'                \\[delete-window]
  `delete-other-windows'         \\[delete-other-windows]
  `split-window-vertically'      \\[split-window-vertically]
  `split-window-horizontally'    \\[split-window-horizontally]
  `other-window'                 \\[other-window]

  `winsize-save-window-configuration'       \\[winsize-save-window-configuration]
  `winsize-next-window-configuration'       \\[winsize-next-window-configuration]
  `winsize-previous-window-configuration'   \\[winsize-previous-window-configuration]

  `mouse-set-point'   \\[mouse-set-point]

  `winsize-quit'               \\[winsize-quit]
  `winsize-stop-go-back'       \\[winsize-stop-go-back]
  `winsize-stop'               \\[winsize-stop]
  `winsize-stop-and-execute'   \\[winsize-stop-and-execute]

  `winsize-help'          \\[winsize-help]
  `describe-key'          \\[describe-key]
  `describe-key-briefly'  \\[describe-key-briefly]
  (All the normal help keys work, and at least those above will
  play well with resizing.)

Nearly all other keys exits window resizing and they are also
executed.  However, the key sequences in `winsize-let-me-use' and
dito for commands there are also executed without exiting
resizing.

The colors of the modelines are changed to those given in
`winsize-mode-line-colors' to indicate that you are resizing
windows.  To make this indication more prominent the text in the
selected window is marked with the face hold in the variable
`winsize-selected-window-face'.

The option `winsize-juris-way' decides how the borders to move
are selected. If this option is non-nil then the right or bottom
border are the ones that are moved with the arrow keys and the
opposite border with shift arrow keys.

If `winsize-juris-way' is nil then the following apply:

As you select other borders or move to new a window the mouse
pointer is moved inside the selected window to show which borders
are beeing moved. The mouse jumps a little bit to make its
position more visible. You can turn this off by customizing
`winsize-make-mouse-prominent'.

Which borders initially are choosen are controlled by the
variable `winsize-autoselect-borders'.

** Example: Border selection, movements and windows.

  Suppose you have a frame divided into windows like in the
  figure below.  If window B is selected when you start resizing
  then (with default settings) the borders marked with 'v' and
  'h' will be the ones that the arrow keys moves. To indicate
  this the mouse pointer is placed in the right lower corner of
  the selected window B.

    +----------+-----------+--------+
    |          |           v        |
    |          |           v        |
    |    A     |    _B_    v        |
    |          |           v        |
    |          |           v        |
    |          |         x v        |
    +hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh+
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    +----------+---------+----------+

  Now if you press M-<left> then the picture below shows what has
  happened. Note that the selected vertical border is now the one
  between A and B. The mouse pointer has moved to the
  corresponding corner in the window B, which is still selected.

    +----------+-----------+--------+
    |          v           |        |
    |          v           |        |
    |    A     v    _B_    |        |
    |          v           |        |
    |          v           |        |
    |          v x         |        |
    +hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh+
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    +----------+---------+----------+

  Press M-<left> once again. This gives this picture:

    +----------+-----------+--------+
    |          v           |        |
    |          v           |        |
    |   _A_    v     B     |        |
    |          v           |        |
    |          v           |        |
    |        x v           |        |
    +hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh+
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    +----------+---------+----------+

  Note that the window A is now selected. However there is no
  border that could be moved to the left of this window (which
  would otherwise be chosen now) so the border between A and B is
  still the one that <left> and <right> moves. The mouse has
  moved to A.

  If we now delete window A the new situation will look like
  this:

    +----------+-----------+--------+
    |                      |        |
    |                      |        |
    |         _B_          |        |
    |                      |        |
    |                      |        |
    |                    x |        |
    +hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh+
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    |                    |          |
    +----------+---------+----------+



>>>> testing stuff >>>>
`help-mode-hook'
`temp-buffer-show-function'
`view-exit-action'
<<<<<<<<<<<<<<<<<<<<<<<

\(fn)" t nil)

(autoload 'winsize-balance-siblings "winsize" "\
Make current window siblings the same height or width.
It works the same way as `balance-windows', but only for the
current window and its siblings.

\(fn)" t nil)

(autoload 'winsize-save-window-configuration "winsize" "\
Not documented

\(fn)" t nil)

(autoload 'winsize-set-mode-line-colors "winsize" "\
Turn mode line colors on if ON is non-nil, otherwise off.

\(fn ON)" nil nil)

(autoload 'winsav-rotate "winsize" "\
Rotate window configuration on selected frame.
MIRROR should be either 'mirror-left-right, 'mirror-top-bottom or
nil.  In the first case the window configuration is mirrored
vertically and in the second case horizontally.  If MIRROR is nil
the configuration is not mirrored.

If TRANSPOSE is non-nil then the window structure is transposed
along the diagonal from top left to bottom right (in analogy with
matrix transosition).

If called interactively MIRROR will is 'mirror-left-right by
default, but 'mirror-top-bottom if called with prefix.  TRANSPOSE
is t. This mean that the window configuration will be turned one
quarter clockwise (or counter clockwise with prefix).

\(fn MIRROR TRANSPOSE)" t nil)

;;;***

;;;### (autoloads (wrap-to-fill-column-mode wrap-to-fill-left-marg-modes
;;;;;;  wrap-to-fill-left-marg wrap-to-fill) "wrap-to-fill" "../nxhtml/util/wrap-to-fill.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/wrap-to-fill.el

(let ((loads (get 'wrap-to-fill 'custom-loads))) (if (member '"wrap-to-fill" loads) nil (put 'wrap-to-fill 'custom-loads (cons '"wrap-to-fill" loads))))

(defvar wrap-to-fill-left-marg nil "\
Left margin handling for `wrap-to-fill-column-mode'.
Used by `wrap-to-fill-column-mode'. If nil then center the
display columns. Otherwise it should be a number which will be
the left margin.")

(custom-autoload 'wrap-to-fill-left-marg "wrap-to-fill" t)

(defvar wrap-to-fill-left-marg-modes '(text-mode fundamental-mode) "\
Major modes where `wrap-to-fill-left-margin' may be nil.")

(custom-autoload 'wrap-to-fill-left-marg-modes "wrap-to-fill" t)

(autoload 'wrap-to-fill-column-mode "wrap-to-fill" "\
Use `fill-column' display columns in buffer windows.
By default the display columns are centered, but see the option
`wrap-to-fill-left-marg'.

Also indent continuation lines when word-wrap is on if the line
begins like '- ' etc:

  - Indent lines after
    this
  * and after
    this
  1) and when counting
     things
  a) wether using numbers
     or letters.

Note: The text properties 'wrap-prefix and 'wrap-to-fill-prefix
is set by this mode to indent continuation lines for the above.

Key bindings added by this minor mode:

\\{wrap-to-fill-column-mode-map}

Fix-me: When turning this on `visual-line-mode' is also turned on. This
is not reset when turning off this mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (xhtml-help xhtml-help-show-tag-ref xhtml-help-tag-at-point
;;;;;;  xhtml-help-show-css-ref) "xhtml-help" "../nxhtml/nxhtml/xhtml-help.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/nxhtml/xhtml-help.el

(autoload 'xhtml-help-show-css-ref "xhtml-help" "\
Show CSS reference for CSS property name at point.

\(fn)" t nil)

(autoload 'xhtml-help-tag-at-point "xhtml-help" "\
Get xhtml tag name at or before point.

\(fn)" nil nil)

(autoload 'xhtml-help-show-tag-ref "xhtml-help" "\
Show xhtml reference for tag name at or before point.

\(fn)" t nil)

(let ((loads (get 'xhtml-help 'custom-loads))) (if (member '"xhtml-help" loads) nil (put 'xhtml-help 'custom-loads (cons '"xhtml-help" loads))))

;;;***

;;;### (autoloads (yari yari-anything) "yari" "../ruby/yari/yari.el"
;;;;;;  (19769 55249))
;;; Generated autoloads from ../ruby/yari/yari.el

(autoload 'yari-anything "yari" "\
Not documented

\(fn &optional REHASH)" t nil)

(autoload 'yari "yari" "\
Look up Ruby documentation.

\(fn &optional RI-TOPIC REHASH)" t nil)

;;;***

;;;### (autoloads (zencoding-preview zencoding-expand-yas zencoding-mode
;;;;;;  zencoding-expand-line zencoding) "zencoding-mode" "../nxhtml/util/zencoding-mode.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/util/zencoding-mode.el

(let ((loads (get 'zencoding 'custom-loads))) (if (member '"zencoding-mode" loads) nil (put 'zencoding 'custom-loads (cons '"zencoding-mode" loads))))

(autoload 'zencoding-expand-line "zencoding-mode" "\
Replace the current line's zencode expression with the corresponding expansion.
If prefix ARG is given or region is visible call `zencoding-preview' to start an
interactive preview.

Otherwise expand line directly.

For more information see `zencoding-mode'.

\(fn ARG)" t nil)

(autoload 'zencoding-mode "zencoding-mode" "\
Minor mode for writing HTML and CSS markup.
With zen coding for HTML and CSS you can write a line like

  ul#name>li.item*2

and have it expanded to

  <ul id=\"name\">
    <li class=\"item\"></li>
    <li class=\"item\"></li>
  </ul>

This minor mode defines keys for quick access:

\\{zencoding-mode-keymap}

Home page URL `http://www.emacswiki.org/emacs/ZenCoding'.

See also `zencoding-expand-line'.

\(fn &optional ARG)" t nil)

(autoload 'zencoding-expand-yas "zencoding-mode" "\
Not documented

\(fn)" t nil)

(autoload 'zencoding-preview "zencoding-mode" "\
Expand zencode between BEG and END interactively.
This will show a preview of the expanded zen code and you can
accept it or skip it.

\(fn BEG END)" t nil)

;;;***

;;;### (autoloads (javascript-mode) "javascript-mozlab" "../nxhtml/alts/javascript-mozlab.el"
;;;;;;  (19769 54246))
;;; Generated autoloads from ../nxhtml/alts/javascript-mozlab.el

(autoload 'javascript-mode "javascript-mozlab" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{javascript-mode-map}

\(fn)" t nil)

;;;***
