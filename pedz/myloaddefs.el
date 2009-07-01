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
;;;;;;  cscope-mode) "cscope" "cscope.el" (19018 18036))
;;; Generated autoloads from cscope.el

(autoload (quote cscope-mode) "cscope" "\
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

(autoload (quote cscope-find-symbol) "cscope" "\
Find all references to the SYMBOL.

\(fn STRING)" t nil)

(autoload (quote cscope-find-func) "cscope" "\
Find a function declaration (or a #define) using the cscope stuff

\(fn STRING)" t nil)

(autoload (quote cscope-find-functions-called) "cscope" "\
Find all functions called by this function

\(fn STRING)" t nil)

(autoload (quote cscope-find-func-call) "cscope" "\
Find all calls to the function

\(fn STRING)" t nil)

(autoload (quote cscope-find-string) "cscope" "\
Find string using cscope stuff

\(fn STRING)" t nil)

(autoload (quote cscope-find-pattern) "cscope" "\
Finds egrep patter in cscope stuff

\(fn STRING)" t nil)

(autoload (quote cscope-find-file) "cscope" "\
Finds files matching PATTERN

\(fn STRING)" t nil)

(autoload (quote cscope-find-file-include) "cscope" "\
Find the files which include the file matching PATTERN

\(fn STRING)" t nil)

(autoload (quote cscope-find-assignment) "cscope" "\
Find assignments to variables and fields matching PATTERN

\(fn STRING)" t nil)

(autoload (quote cscope-get-line-number) "cscope" "\
Returns the \"line number\" out of a cscope output buffer

\(fn)" nil nil)

(autoload (quote cscope-goto-from-list) "cscope" "\
Point is in a buffer pointing to a line produced by
cscope-list-line. This routine plops into the file at the appropriate
spot

\(fn ARG)" t nil)

(autoload (quote cscope-view-from-list) "cscope" "\
Point is in a buffer pointing to a line produced by
cscope-list-line. This routine plops into the file at the appropriate
spot

\(fn)" t nil)

(autoload (quote cscope-520-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-00) (quote cscope-520-process))

(autoload (quote cscope-52B-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-01) (quote cscope-52B-process))

(autoload (quote cscope-52F-process) "cscope" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-52H-process) "cscope" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-52I-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-05) (quote cscope-52I-process))

(defalias (quote cscope-5200-06) (quote cscope-52I-process))

(autoload (quote cscope-52L-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-07) (quote cscope-52L-process))

(autoload (quote cscope-52M-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-08) (quote cscope-52M-process))

(autoload (quote cscope-52Q-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-09) (quote cscope-52Q-process))

(autoload (quote cscope-52S-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5200-10) (quote cscope-52S-process))

(autoload (quote cscope-530-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-00) (quote cscope-530-process))

(autoload (quote cscope-53A-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-01) (quote cscope-53A-process))

(autoload (quote cscope-53D-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-03) (quote cscope-53D-process))

(autoload (quote cscope-53E-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-04) (quote cscope-53E-process))

(autoload (quote cscope-53H-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-05) (quote cscope-53H-process))

(autoload (quote cscope-53J-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-06) (quote cscope-53J-process))

(autoload (quote cscope-53L-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-07) (quote cscope-53L-process))

(autoload (quote cscope-53N-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-08) (quote cscope-53N-process))

(autoload (quote cscope-53Q-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-09) (quote cscope-53Q-process))

(autoload (quote cscope-53S-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-5300-10) (quote cscope-53S-process))

(autoload (quote cscope-610-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-6100-00) (quote cscope-610-process))

(autoload (quote cscope-61B-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-6100-01) (quote cscope-61B-process))

(autoload (quote cscope-61D-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-6100-02) (quote cscope-61D-process))

(autoload (quote cscope-61F-process) "cscope" "\
Not documented

\(fn)" t nil)

(defalias (quote cscope-6100-03) (quote cscope-61F-process))

(autoload (quote cscope-ipf-process) "cscope" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-bananas-are-fun) "cscope" "\
Not documented

\(fn BASE BUILD)" nil nil)

(autoload (quote cscope-new-process) "cscope" "\
Not documented

\(fn)" t nil)

(autoload (quote cscope-init-process) "cscope" "\
Not documented

\(fn CSCOPE-OUT DBNAME)" nil nil)

(autoload (quote cscope-wait) "cscope" "\
Waits for the cscope process to finish

\(fn)" nil nil)

(autoload (quote cscope-format) "cscope" "\
Formats the output of cscope to be pretty

\(fn)" nil nil)

(autoload (quote cscope-find-goodies) "cscope" "\
Calls the cscope program and sends it STRING, plops into the buffer
and puts the buffer into cscope-mode

\(fn STRING)" t nil)

(autoload (quote x-cscope-goto-from-list) "cscope" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload (quote x-cscope-goto-from-list-other-window) "cscope" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload (quote x-cscope-view-from-list) "cscope" "\
Move to where the mouse is and then process the line

\(fn CLICK)" t nil)

(autoload (quote x-c-mode-cscope-sym) "cscope" "\
Find symbol via cscope that mouse is pointing at

\(fn CLICK)" t nil)

(autoload (quote x-c-mode-cscope-func) "cscope" "\
Find function via cscope that mouse is pointing at

\(fn CLICK)" t nil)

(autoload (quote x-cscope-no-op) "cscope" "\
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

;;;### (autoloads (kill-inherited-variables setup-inheritance inherit-from-buffer
;;;;;;  make-variable-buffer-inherited) "inherit" "inherit.el" (18002
;;;;;;  3543))
;;; Generated autoloads from inherit.el

(autoload (quote make-variable-buffer-inherited) "inherit" "\
Make symbol A be inherited -- this implies that it is buffer local

\(fn A)" nil nil)

(autoload (quote inherit-from-buffer) "inherit" "\
Set all inherited variables of current buffer to those values of BUF

\(fn BUF)" t nil)

(autoload (quote setup-inheritance) "inherit" "\
Sets up inheritance from the buffer that we are currently doing a find file from

\(fn)" nil nil)

(autoload (quote kill-inherited-variables) "inherit" "\
Sets all inherited variables to nil

\(fn)" t nil)

;;;***

;;;### (autoloads (Prs Changes Track Apar Feature Defect) "orbit"
;;;;;;  "orbit.el" (18002 3710))
;;; Generated autoloads from orbit.el

(autoload (quote Defect) "orbit" "\
Gets the long version of a defect number

\(fn NUM ARG)" t nil)

(autoload (quote Feature) "orbit" "\
Gets the long version of a feature number

\(fn NUM ARG)" t nil)

(autoload (quote Apar) "orbit" "\
Gets the long version of a apar number

\(fn NUM ARG)" t nil)

(autoload (quote Track) "orbit" "\
Gets the long version of the tracks for a defect

\(fn NUM ARG)" t nil)

(autoload (quote Changes) "orbit" "\
Gets the changes for a defect

\(fn NUM ARG)" t nil)

(autoload (quote Prs) "orbit" "\
Gets the changes for a file

\(fn FNAME ARG)" t nil)

;;;***

;;;### (autoloads (x-find-tag get-symbol-non-interactively get-symbol-interactively)
;;;;;;  "ptags" "ptags.el" (18002 3411))
;;; Generated autoloads from ptags.el

(autoload (quote get-symbol-interactively) "ptags" "\
Used by cscope and others to get a symbol in a tags style interface
and allow for interactive confirmation or changes

\(fn PROMPT)" nil nil)

(autoload (quote get-symbol-non-interactively) "ptags" "\
Used by cscope and others to get a symbol under the cursor.  Uses
the same mechanism for the default as get-symbol-interactively

\(fn)" nil nil)

(autoload (quote x-find-tag) "ptags" "\
Find function via TAGS that mouse is pointing at

\(fn CLICK)" t nil)

;;;***

;;;### (autoloads (kill-retain-buffers find-pmr-in-cs-buffer sanitize-pmr-number
;;;;;;  x-no-op x-get-pmr ppp pmrorder cs put-pmr put-all-pmr find-number
;;;;;;  pmr-search pgrep PTF APAR PMR retain-common wait-for-async-process
;;;;;;  async-call-process process-complete find-pmr pmrorder-mode)
;;;;;;  "retain" "retain.el" (18522 29677))
;;; Generated autoloads from retain.el

(autoload (quote pmrorder-mode) "retain" "\
Mode to go into when looking at the output of PMR order

\(fn)" nil nil)

(autoload (quote find-pmr) "retain" "\
Used by the interactive command to pickup the complete pmr number
the cursor is on

\(fn PROMPT)" nil nil)

(autoload (quote process-complete) "retain" "\
Look for process to enter the exit state and then clean up its
buffer and delete it from the process table

\(fn PROCESS STATE)" nil nil)

(autoload (quote async-call-process) "retain" "\
Not documented

\(fn PROGRAM INFILE BUFFER DISPLAY &rest ARGS)" nil nil)

(autoload (quote wait-for-async-process) "retain" "\
Wait for PROC to finish

\(fn PROC)" nil nil)

(autoload (quote retain-common) "retain" "\
Common routine which creates a buffer called BUFNAME.  If the
buffer already exists then it is used unless FORCE-ERASE (the prefix
arg) is true.  Then call-process using CMD with ARGS.  The buffer is
selected when finished.  Another feature is if this is called inside
the buffer that we are looking for, then we assume the user wants to
refresh the buffer so FORCE-ERASE is set to true

\(fn BUFNAME CMD ARGS NAME &optional FORCE-ERASE)" nil nil)

(autoload (quote PMR) "retain" "\
Gets a PMR

\(fn NUMBER ARG)" t nil)

(autoload (quote APAR) "retain" "\
Gets a APAR

\(fn NUMBER ARG)" t nil)

(autoload (quote PTF) "retain" "\
Gets a PTF

\(fn NUMBER ARG)" t nil)

(autoload (quote pgrep) "retain" "\
Gets the output of pgrep

\(fn NUMBER ARG)" t nil)

(autoload (quote pmr-search) "retain" "\
Makes a call to pmrsearch

\(fn PATTERN ARG)" t nil)

(autoload (quote find-number) "retain" "\
Finds the apar or pmr number from the pmr's text

\(fn)" t nil)

(autoload (quote put-all-pmr) "retain" "\
Plops the current pmr into the current buffer

\(fn)" t nil)

(autoload (quote put-pmr) "retain" "\
Plops the current pmr into the current buffer

\(fn)" t nil)

(autoload (quote cs) "retain" "\
Get the queue from retain

\(fn QUEUE ARG)" t nil)

(autoload (quote pmrorder) "retain" "\
Get the pmrorder report for QUEUES into a buffer named pmrorder and
set up a local map so that the first mouse button will get the pmr
picked on.

\(fn QUEUES ARG)" t nil)

(autoload (quote ppp) "retain" "\
Get the pmrorder report for QUEUES into a buffer named pmrorder and
set up a local map so that the first mouse button will get the pmr
picked on.

\(fn)" t nil)

(autoload (quote x-get-pmr) "retain" "\
Bound to a mouse button, retrieves the pmr, apar, or ptf whose
number is pointed to

\(fn CLICK)" t nil)

(autoload (quote x-no-op) "retain" "\
Does nothing with a mouse event

\(fn CLICK)" t nil)

(autoload (quote sanitize-pmr-number) "retain" "\
Returns a sanitized version of the PMR number passed in.  If an
apar number is passed in, the apar to pmr conversion is done.  If the
string begins with \"pmr\", it is stripped of.  Any spaces are
converted to commas

\(fn S)" t nil)

(autoload (quote find-pmr-in-cs-buffer) "retain" "\
When bound to a mouse event in a \"cs\" buffer, the pmr on the line
clicked on is retrieved

\(fn CLICK)" t nil)

(autoload (quote kill-retain-buffers) "retain" "\
Kill the PMR, APAR, and cs buffers

\(fn)" t nil)

;;;***

;;;### (autoloads (kill-buffers-reqexp server-ediff-files update-my-autoloads
;;;;;;  from-work from-home v4-build-compilation-finish start-vm
;;;;;;  split-window-in-thirds backspace-delete-flip xon-xoff-mode)
;;;;;;  "util" "util.el" (18381 27925))
;;; Generated autoloads from util.el

(autoload (quote xon-xoff-mode) "util" "\
Swap keys, etc so that xon/xoff flow control works

\(fn)" t nil)

(autoload (quote backspace-delete-flip) "util" "\
Swap keys, etc so that backspace and delete are flipped:

\(fn)" t nil)

(autoload (quote split-window-in-thirds) "util" "\
Split the window where point is at into thirds displaying other
buffers in the two other windows

\(fn)" t nil)

(autoload (quote start-vm) "util" "\
Starts vm but sets some variables based upon the display

\(fn &optional FOLDER READ-ONLY)" t nil)

(autoload (quote v4-build-compilation-finish) "util" "\
This function is hooked into compile.el by pointing
compilation-finish-function at it.  It goes through the buffer looking
for \"cd ../.......\" at the beginning as well as the \"[ /bos/blah
]\" messages and converts them into Entering and Leaving messages.

\(fn BUF MSG)" nil nil)

(autoload (quote from-home) "util" "\
Call this when working from home

\(fn)" t nil)

(autoload (quote from-work) "util" "\
Call this when working from work

\(fn)" t nil)

(autoload (quote update-my-autoloads) "util" "\
Update my personal loaddefs.el file

\(fn)" t nil)

(autoload (quote server-ediff-files) "util" "\
Called from ediff program via gnudoit

\(fn FILE1 FILE2)" nil nil)

(autoload (quote kill-buffers-reqexp) "util" "\
Kill all the buffers whose names match REQEXP.  Confirm before
killing if ASK is true.

\(fn REQEXP &optional ASK)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; myloaddefs.el ends here
