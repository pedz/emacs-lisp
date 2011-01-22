;;; myloaddefs.el --- automatically extracted autoloads
;;
;;; Code:


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
;;;;;;  cscope-mode) "cscope" "cscope.el" (19769 54414))
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
;;;;;;  "cscope-old" "cscope-old.el" (18796 54263))
;;; Generated autoloads from cscope-old.el

(autoload (quote cscope-41M-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-42G-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-43K-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-43S-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-43V-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-43X-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-510-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-51F-process) "cscope-old" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-51G-process) "cscope-old" "\
Not documented

\(fn)" t nil)

;;;***

;;;### (autoloads (espresso-mode) "espresso" "../others/espresso.el"
;;;;;;  (19769 54414))
;;; Generated autoloads from ../others/espresso.el

(autoload 'espresso-mode "espresso" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{espresso-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (kill-inherited-variables setup-inheritance inherit-from-buffer
;;;;;;  make-variable-buffer-inherited) "inherit" "inherit.el" (19769
;;;;;;  54414))
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

;;;### (autoloads (js-mode) "js" "../others/js.el" (19769 54414))
;;; Generated autoloads from ../others/js.el

(autoload 'js-mode "js" "\
Major mode for editing JavaScript.

Key bindings:

\\{js-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (Prs Changes Track Apar Feature Defect) "orbit"
;;;;;;  "orbit.el" (19769 54414))
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

;;;### (autoloads (x-find-tag get-symbol-non-interactively get-symbol-interactively)
;;;;;;  "ptags" "ptags.el" (19769 54414))
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
;;;;;;  54414))
;;; Generated autoloads from rat-pgp.el

(autoload 'pgp-insinuate-keys "rat-pgp" "\
Call from various mode setup hooks to bind PGP keys.

\(fn)" nil nil)

;;;***

;;;### (autoloads (kill-retain-buffers find-pmr-in-cs-buffer sanitize-pmr-number
;;;;;;  x-no-op x-get-pmr ppp pmrorder cs put-pmr put-all-pmr find-number
;;;;;;  pmr-search pgrep PTF APAR PMR retain-common wait-for-async-process
;;;;;;  async-call-process process-complete find-pmr pmrorder-mode)
;;;;;;  "retain" "retain.el" (19769 54414))
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
;;;;;;  54414))
;;; Generated autoloads from ../ruby/ri-emacs/ri-ruby.el

(autoload 'ri "ri-ruby" "\
Execute `ri'.

\(fn KEYW &optional CLASS)" t nil)

;;;***

;;;### (autoloads (rvm-open-gem rvm-use rvm-activate-corresponding-ruby
;;;;;;  rvm-use-default) "rvm" "../ruby/rvm/rvm.el" (19769 55092))
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

;;;### (autoloads (x-spew-find-symbol x-spew-view-from-list x-spew-goto-from-list-other-window
;;;;;;  x-spew-goto-from-list spew-find-goodies spew-format spew-wait
;;;;;;  spew-init-process spew-view-from-list spew-goto-from-list
;;;;;;  spew-get-line-number spew-find-symbol spew-mode) "spew" "spew.el"
;;;;;;  (19769 54414))
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

;;;### (autoloads (kill-buffers-reqexp server-ediff-files update-my-autoloads
;;;;;;  from-work from-home v4-build-compilation-finish start-vm
;;;;;;  split-window-in-thirds backspace-delete-flip xon-xoff-mode)
;;;;;;  "util" "util.el" (19769 54414))
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

;;;***

;;;### (autoloads (v3-uncompress-while-visiting v3-get-file-buffer
;;;;;;  find-file-noselect v3-clone-relative-path v3-get-clone-top
;;;;;;  v3-get-clone-list v3-setup process-output-to-string) "v3-file"
;;;;;;  "v3-file.el" (19769 54414))
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

;;;### (autoloads (yari yari-anything) "yari" "../ruby/yari/yari.el"
;;;;;;  (19769 54699))
;;; Generated autoloads from ../ruby/yari/yari.el

(autoload 'yari-anything "yari" "\
Not documented

\(fn &optional REHASH)" t nil)

(autoload 'yari "yari" "\
Look up Ruby documentation.

\(fn &optional RI-TOPIC REHASH)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; myloaddefs.el ends here
