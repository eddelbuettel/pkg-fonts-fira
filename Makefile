
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

ARCHIVE		= master.zip
ARCHIVE_LINK	= https://github.com/bBoxType/FiraSans/archive/$(ARCHIVE)
UNPACKED_DIR	= FiraSans-master

all:
	wget ${ARCHIVE_LINK}
	unzip ${ARCHIVE}
	mkdir otf ttf
	find ${UNPACKED_DIR} -name '*.otf' -exec cp {} otf/ \;
	find ${UNPACKED_DIR} -name '*.ttf' -exec cp {} ttf/ \;

clean:
	-rm -rf otf/ ttf/ ${ARCHIVE} ${UNPACKED_DIR}
