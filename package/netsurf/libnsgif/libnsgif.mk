#############################################################
#
# libnsgif
#
#############################################################

LIBNSGIF_VERSION = 12162
# LIBNSGIF_SOURCE = libnsgif-$(LIBPARSERUTILS_VERSION).tar.gz
LIBNSGIF_SITE = svn://svn.netsurf-browser.org/trunk/libnsgif

LIBNSGIF_INSTALL_STAGING = YES

define LIBNSGIF_CONFIGURE_CMDS
endef

define LIBNSGIF_BUILD_CMDS
	$(MAKE) all CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr -C $(@D)
endef

define LIBNSGIF_INSTALL_STAGING_CMDS
	$(MAKE) install CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,libnsgif))
