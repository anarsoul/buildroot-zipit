#############################################################
#
# Echinus
#
#############################################################

ECHINUS_VERSION = 0.4.5
ECHINUS_SOURCE = echinus-$(ECHINUS_VERSION).tar.gz
ECHINUS_SITE = http://plhk.ru/static/echinus/
ECHINUS_DEPENDENCIES = host-pkg-config xlib_libX11 libxcb xlib_libXrandr

ECHINUS_INCS=$(TARGET_CFLAGS) \
	`$(HOST_DIR)/usr/bin/pkg-config --cflags xft` \
	`$(HOST_DIR)/usr/bin/pkg-config --cflags xrandr` \
	`$(HOST_DIR)/usr/bin/pkg-config --cflags x11`
ECHINUS_LIBS=$(TARGET_LDFLAGS) \
	`$(HOST_DIR)/usr/bin/pkg-config --libs xft` \
	`$(HOST_DIR)/usr/bin/pkg-config --libs xrandr` \
	`$(HOST_DIR)/usr/bin/pkg-config --libs x11`

define ECHINUS_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC)" \
		INCS="$(ECHINUS_INCS)" \
		LIBS="$(ECHINUS_LIBS)" \
		PREFIX="/usr" \
		all
endef

define ECHINUS_CLEAN_CMDS
	$(MAKE) -C $(@D) clean
endef

define ECHINUS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" install
endef

define ECHINUS_UNINSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) PREFIX="/usr" DESTDIR="$(TARGET_DIR)" uninstall
endef

$(eval $(call GENTARGETS,package,echinus))
