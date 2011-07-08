#############################################################
#
# irssi
#
#############################################################

IRSSI_VERSION = 0.8.15
IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.bz2
IRSSI_SITE = http://irssi.org/files
IRSSI_DEPENDENCIES = ncurses openssl libglib2
IRSSI_CONF_OPT += --with-ncurses --with-proxy --enable-ssl
IRSSI_AUTORECONF = YES

define IRSSI_USE_NCURSESW
	$(SED) 's|-lncurses|-lncursesw|g' $(@D)/curses.m4
endef

IRSSI_PRE_CONFIGURE_HOOKS += IRSSI_USE_NCURSESW

$(eval $(call AUTOTARGETS,package,irssi))
