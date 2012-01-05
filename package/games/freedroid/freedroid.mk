#############################################################
#
# PrBoom
#
#############################################################
FREEDROID_VERSION = 1.0.2
FREEDROID_DEPENDENCIES = sdl sdl_net sdl_mixer tremor
FREEDROID_CONF_ENV = ac_cv_lib_vorbis_ov_open="yes"
FREEDROID_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/freedroid/freedroidClassic/FreedroidClassic-1.0.2/
FREEDROID_SOURCE = freedroid-$(FREEDROID_VERSION).tar.gz

FREEDROID_CONF_OPT = \
		--oldincludedir=$(STAGING_DIR)/usr/include \
		--with-sdl-prefix=$(STAGING_DIR)/usr \
		--with-sdl-exec-prefix=$(STAGING_DIR)/usr \
		--without-x

define FREEDROID_TREMOR_FIX
        $(SED) 's/-lvorbis/-lvorbisidec/' $(@D)/configure
endef
FREEDROID_PRE_CONFIGURE_HOOKS += FREEDROID_TREMOR_FIX

$(eval $(call AUTOTARGETS))
