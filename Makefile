
## Minimal and hackish packaging for Fira
##
## This Makefile downloads from GitHub, extracts the OTF files and
## lets the Debian packaging in debian/ do the rest. Just call
##
##     dpkg-buildpackage -rfakeroot -us -uc -tc
##
## or just
##
##     runMe.sh
##
## to have the package build using 'fake' suid, do not sign (as we're
## not uploading anywhere) and clean.
##
## Copyright (C) 2016  Dirk Eddelbuettel
## and released under GPL (>=2 )


## check with https://github.com/adobe-fonts/source-code-pro/releases for version
srcfile1=https://github.com/mozilla/Fira/archive/4.202.tar.gz
outfile1=$(shell basename ${srcfile1})
srcfile2=https://github.com/mozilla/Fira/archive/4.106.tar.gz
outfile2=$(shell basename ${srcfile2})


all:
	test -f ${outfile1} || wget ${srcfile1} 
	tar xfz ${outfile1}
	mkdir otf ttf
	mv Fira-*/otf/* otf/
	mv Fira-*/ttf/* ttf/
	rm -rf Fira-* 
	test -f ${outfile2} || wget ${srcfile2} #
	tar xfz ${outfile2}
	mv Fira-*/otf/*  otf/
	mv Fira-*/ttf/*  ttf/
	rm -rf Fira-* 

clean:
	rm -f ${outfile1} ${outfile2}
	rm -rf otf/ ttf/
