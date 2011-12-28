#############################################################
#
# minicom
#
#############################################################
MINICOM_VERSION:=2.5
MINICOM_SOURCE:=minicom-$(MINICOM_VERSION).tar.gz
MINICOM_SITE:=http://alioth.debian.org/download.php/3487/
MINICOM_DEPENDENCIES:=ncurses

$(eval $(call AUTOTARGETS,package,minicom))
