
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
	for i in $(LIST) ; do ( cd $$i ; EMACS=$(EMACS) make ) ; done
