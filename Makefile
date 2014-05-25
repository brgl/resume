RESNAME =	./Bartosz_Golaszewski_resume
RESSRC =	./resume.tex
PICTSRC =	./pictout.c
PICTBIN =	./pictout
PICTNAME =	./pict.jpg
PDFTEX =	pdflatex

$(PICTBIN):
	$(CC) -o $(PICTBIN) $(PICTSRC)

$(PICTNAME):		$(PICTBIN)
	$(PICTBIN) $(PICTNAME)

$(RESNAME).pdf:		$(PICTNAME)
	$(PDFTEX) --halt-on-error --jobname=$(RESNAME) $(RESSRC)

all:		$(PICTBIN) $(PICTNAME) $(RESNAME).pdf

clean:
	$(RM) $(PICTBIN)
	$(RM) $(PICTNAME)
	$(RM) $(RESNAME).pdf
	$(RM) $(RESNAME).log
	$(RM) $(RESNAME).aux

.PHONY =		all clean
.DEFAULT_GOAL :=
.DEFAULT_GOAL :=	all


