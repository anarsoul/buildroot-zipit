#############################################################
#
# gmu
#
#############################################################

GMU_VERSION = 0.8.0BETA1
GMU_SOURCE = gmu-$(GMU_VERSION).tar.gz
GMU_SITE = http://wejp.k.vu/files/ 
GMU_DEPENDENCIES = sdl sdl_gfx sdl_image mpg123 flac tremor speex

define GMU_CONFIGURE_CMDS
        support/scripts/apply-patches.sh $(@D) package/multimedia/gmu *patch
endef

define GMU_BUILD_CMDS
	$(MAKE) CC='$(TARGET_CC)' CXX='$(TARGET_CXX)' STRIP='$(TARGET_STRIP)' \
		CFLAGS='$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags sdl` -DFILE_HW_H="\"hw_$$(TARGET).h\""' \
		LFLAGS='$(TARGET_LDFLAGS) `$(PKG_CONFIG_HOST_BINARY) --libs sdl` -lpthread -lm -ldl -lz -lgcc -Wl,-export-dynamic' \
		PREFIX=/usr \
		TARGET=zipit-z2 -C $(@D)
endef

define GMU_INSTALL_TARGET_CMDS
	$(MAKE) CC='$(TARGET_CC)' CXX='$(TARGET_CXX)' STRIP='$(TARGET_STRIP)' \
		CFLAGS='$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags sdl` -DFILE_HW_H="\"hw_$$(TARGET).h\""' \
		LFLAGS='$(TARGET_LDFLAGS) `$(PKG_CONFIG_HOST_BINARY) --libs sdl` -lpthread -lm -ldl -lz -lgcc -Wl,-export-dynamic' \
		PREFIX=/usr \
		DESTDIR='$(TARGET_DIR)' \
		TARGET=zipit-z2 install -C $(@D)
endef

$(eval $(call GENTARGETS,package,gmu))
