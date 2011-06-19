#############################################################
#
# tmux
#
#############################################################

TMUX_VERSION = 1.4
TMUX_SOURCE = tmux-$(TMUX_VERSION).tar.gz
TMUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tmux/
TMUX_DEPENDENCIES = libevent ncurses

ifeq ($(BR2_USE_WCHAR),y)
define TMUX_NCURSESW_FIX
	$(SED) 's/-lncurses/-lncursesw/' $(@D)/configure
endef
TMUX_PRE_CONFIGURE_HOOKS += TMUX_NCURSESW_FIX
endif

define TMUX_CONFIGURE_CMDS
	cd $(@D); ./configure --prefix=/usr
endef

define TMUX_BUILD_CMDS
	$(MAKE) CC='$(TARGET_CC)' CFLAGS='$(TARGET_CFLAGS) \
		-DBUILD=\"$(TMUX_VERSION)\" -D_GNU_SOURCE \
		-D_POSIX_SOURCE' -C $(@D)
endef

define TMUX_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/tmux $(TARGET_DIR)/usr/bin/tmux
	$(INSTALL) -D $(@D)/tmux.1 $(TARGET_DIR)/usr/share/man/man1/tmux.1
endef

$(eval $(call GENTARGETS,package,tmux))
