#############################################################
#
# libparserutils
#
#############################################################

LIBPARSERUTILS_VERSION = 12162
# LIBPARSERUTILS_SOURCE = libparserutils-$(LIBPARSERUTILS_VERSION).tar.gz
LIBPARSERUTILS_SITE = svn://svn.netsurf-browser.org/trunk/libparserutils

LIBPARSERUTILS_INSTALL_STAGING = YES

define LIBPARSERUTILS_CONFIGURE_CMDS
endef

define LIBPARSERUTILS_BUILD_CMDS
	$(MAKE) all CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr -C $(@D)
endef

define LIBPARSERUTILS_INSTALL_STAGING_CMDS
	$(MAKE) install CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,libparserutils))
