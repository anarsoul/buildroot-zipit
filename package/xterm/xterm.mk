#############################################################
#
# xterm
#
#############################################################

XTERM_VERSION = 271
XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
XTERM_SITE = ftp://invisible-island.net/xterm
XTERM_DEPENDENCIES = ncurses xlib_libXaw
XTERM_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install

ifeq ($(BR2_USE_WCHAR),y)
XTERM_CONF_OPT = --enable-wide-chars
define XTERM_NCURSESW_FIX
	$(SED) 's/ncurses/ncursesw/' $(@D)/configure
endef
XTERM_PRE_CONFIGURE_HOOKS += XTERM_NCURSESW_FIX
endif

$(eval $(call AUTOTARGETS))
