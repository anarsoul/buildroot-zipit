#############################################################
#
# hubbub
#
#############################################################

HUBBUB_VERSION = 12162
# HUBBUB_SOURCE = hubbub-$(HUBBUB_VERSION).tar.gz
HUBBUB_SITE = svn://svn.netsurf-browser.org/trunk/hubbub
HUBBUB_DEPENDENCIES = libparserutils
HUBBUB_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
	PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config"

HUBBUB_INSTALL_STAGING = YES

define HUBBUB_CONFIGURE_CMDS
endef

define HUBBUB_BUILD_CMDS
	$(HUBBUB_MAKE_ENV) $(MAKE) all CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr -C $(@D)
endef

define HUBBUB_INSTALL_STAGING_CMDS
	$(HUBBUB_MAKE_ENV) $(MAKE) install CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,hubbub))
