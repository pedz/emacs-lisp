
EMACS=emacs
LIST = \
	cedet \
	ecb \
	emacs-rails \
	lib \
	mmm-mode-0.4.8 \
	nxml-mode-20041004 \
	pedz \
	ruby \
	setups \
	wisent

all :
	# touch the Makefiles in cedet or it may complain
	find cedet -name Makefile -print | xargs touch
	# Compile local files
	-$(EMACS) -batch -q --no-site-file -l ~/.emacs.d/add-paths \
		-f batch-byte-compile $$( ls *.el | egrep -v init.el )
	for i in $(LIST) ; do \
	    echo "Doing $$i"; \
	    ( cd $$i ; EMACS=$(EMACS) make ) ; \
	    echo "Done with $$i"; \
	done
