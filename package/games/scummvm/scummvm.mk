#############################################################
#
# ScummVM
#
#############################################################
SCUMMVM_VERSION = 1.3.0
SCUMMVM_SOURCE = scummvm-$(SCUMMVM_VERSION).tar.bz2
SCUMMVM_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/scummvm
SCUMMVM_DEPENDENCIES = sdl libmpeg2 alsa-lib libmad tremor zlib

SCUMMVM_CONF_OPT += \
		--host=$(GNU_TARGET_NAME) \
		--prefix=/usr \
		--backend=sdl \
		--enable-verbose-build \
		--enable-zlib \
		--enable-alsa \
		--enable-mad \
		--enable-tremor \
		--with-sdl-prefix=$(STAGING_DIR)/usr/bin

define SCUMMVM_CONFIGURE_CMDS
	cd $(@D); rm -f config.cache; \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	STRIP=$(TARGET_STRIP) \
	./configure $(SCUMMVM_CONF_OPT)
endef


$(eval $(call AUTOTARGETS,package/games,scummvm))
