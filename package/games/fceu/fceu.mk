#############################################################
#
# FCEU
#
#############################################################
FCEU_VERSION = 0.98.13-pre
FCEU_SOURCE = fceu-$(FCEU_VERSION).src.tar.bz2
FCEU_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fceultra
FCEU_DEPENDENCIES = sdl zlib
FCEU_AUTORECONF = YES

FCEU_CONF_OPT += --with-sdl-exec-prefix=$(STAGING_DIR)/usr

define FCEU_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/src/fceu $(TARGET_DIR)/usr/bin/fceu
endef

$(eval $(call AUTOTARGETS,package/games,fceu))
