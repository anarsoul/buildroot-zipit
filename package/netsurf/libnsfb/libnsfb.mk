#############################################################
#
# libnsfb
#
#############################################################

LIBNSFB_VERSION = 12162
# LIBNSFB_SOURCE = libnsfb-$(LIBNSFB_VERSION).tar.gz
LIBNSFB_SITE = svn://svn.netsurf-browser.org/trunk/libnsfb
LIBNSFB_DEPENDENCIES = sdl
LIBNSFB_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config"

LIBNSFB_INSTALL_STAGING = YES

define LIBNSFB_CONFIGURE_CMDS
endef

define LIBNSFB_BUILD_CMDS
	(cd $(@D); sed Makefile -i -e 's/-Werror//')
	$(LIBNSFB_MAKE_ENV) $(MAKE) all CC='$(TARGET_CC)' NSFB_XCB_AVAILABLE=no TARGET=linux PREFIX=/usr -C $(@D)
endef

define LIBNSFB_INSTALL_STAGING_CMDS
	$(LIBNSFB_MAKE_ENV) $(MAKE) install CC='$(TARGET_CC)' NSFB_XCB_AVAILABLE=no TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,libnsfb))
