#############################################################
#
# screen
#
#############################################################

SCREEN_VERSION = 4.0.3
SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
SCREEN_DEPENDENCIES = ncurses
SCREEN_CONF_ENV = CFLAGS=-DSYSV=1
SCREEN_MAKE_OPT = -j1
SCREEN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin

ifeq ($(BR2_USE_WCHAR),y)

define SCREEN_NCURSESW_FIX
	sed -i 's/-lncurses/-lncursesw/' $(@D)/configure
endef
SCREEN_PRE_CONFIGURE_HOOKS = SCREEN_NCURSESW_FIX
endif

$(eval $(call AUTOTARGETS))
