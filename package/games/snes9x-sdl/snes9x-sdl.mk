#############################################################
#
# snes9x-sdl
#
#############################################################
SNES9X_SDL_VERSION = 1.39
SNES9X_SDL_SOURCE = snes9x-sdl-${SNES9X_SDL_VERSION}.tar.bz2
SNES9X_SDL_SITE = http://www.vanille.de/mirror
SNES9X_SDL_DEPENDENCIES = sdl zlib

define SNES9X_SDL_PATCH_CMDS
	toolchain/patch-kernel.sh $(@D) package/games/snes9x-sdl/ *patch
endef

define SNES9X_SDL_BUILD_CMDS
	cd $(@D); $(MAKE) CC='$(TARGET_CC)' \
		CCC='$(TARGET_CXX) -fno-rtti -fno-exceptions' \
		INCLUDES='-I$(STAGING_DIR)/usr/include `$(PKG_CONFIG_HOST_BINARY) sdl --cflags`' \
		LDLIBS='`$(PKG_CONFIG_HOST_BINARY) sdl --libs`'
endef

define SNES9X_SDL_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/snes9x $(TARGET_DIR)/usr/bin/snes9x
endef

$(eval $(call GENTARGETS,package/games,snes9x-sdl))
