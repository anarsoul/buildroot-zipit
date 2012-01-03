#############################################################
#
# netsurf
#
#############################################################

NETSURF_VERSION = 12162
NETSURF_SITE = svn://svn.netsurf-browser.org/trunk/netsurf
NETSURF_DEPENDENCIES = hubbub libcss libnsfb libnsgif libnsbmp libcurl jpeg openssl openssl libxml2 freetype
NETSURF_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config"

NETSURF_INSTALL_TARGET = YES

define NETSURF_CONFIGURE_CMDS
	cp package/netsurf/netsurf/Makefile.config $(@D)
	support/scripts/apply-patches.sh $(@D) package/netsurf/netsurf/ 000*patch
endef

define NETSURF_BUILD_CMDS
	$(NETSURF_MAKE_ENV) $(MAKE) all CC='$(TARGET_CC)' TARGET=framebuffer PREFIX=/usr -C $(@D)
endef

define NETSURF_INSTALL_TARGET_CMDS
	$(NETSURF_MAKE_ENV) $(MAKE) install CC='$(TARGET_CC)' TARGET=framebuffer PREFIX=/usr DESTDIR=$(TARGET_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,netsurf))
