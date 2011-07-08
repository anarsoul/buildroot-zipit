#############################################################
#
# libcss
#
#############################################################

LIBCSS_VERSION = 12162
# LIBCSS_SOURCE = libcss-$(LIBCSS_VERSION).tar.gz
LIBCSS_SITE = svn://svn.netsurf-browser.org/trunk/libcss
LIBCSS_DEPENDENCIES = libwapcaplet libparserutils
LIBCSS_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config"

LIBCSS_INSTALL_STAGING = YES

define LIBCSS_CONFIGURE_CMDS
endef

define LIBCSS_BUILD_CMDS
	$(LIBCSS_MAKE_ENV) $(MAKE) all CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr -C $(@D)
endef

define LIBCSS_INSTALL_STAGING_CMDS
	$(LIBCSS_MAKE_ENV) $(MAKE) install CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,libcss))
