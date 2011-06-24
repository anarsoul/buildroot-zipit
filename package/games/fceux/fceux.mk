#############################################################
#
# fceux
#
#############################################################

FCEUX_VERSION = 2.1.5
FCEUX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fceultra
FCEUX_SOURCE = fceux-$(FCEUX_VERSION).src.tar.bz2

define FCEUX_CONFIGURE_CMDS
	cp -f package/games/fceux/Makefile $(@D)/Makefile
	make clean -C $(@D)
endef

define FCEUX_BUILD_CMDS
	$(MAKE) CC='$(TARGET_CC)' CFLAGS='$(TARGET_CFLAGS) ' \
		CXX='$(TARGET_CXX)' PKG_CONFIG='$(PKG_CONFIG_HOST_BINARY)' \
		PREFIX=/usr -C $(@D)
endef

define FCEUX_INSTALL_TARGET_CMDS
	$(MAKE) CC='$(TARGET_CC)' CFLAGS='$(TARGET_CFLAGS) ' \
		CXX='$(TARGET_CXX)' PKG_CONFIG='$(PKG_CONFIG_HOST_BINARY)' \
		PREFIX=/usr install DESTDIR=$(TARGET_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,fceux))
