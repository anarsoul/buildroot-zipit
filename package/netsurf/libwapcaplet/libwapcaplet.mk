#############################################################
#
# libwapcaplet
#
#############################################################

LIBWAPCAPLET_VERSION = 12162
# LIBWAPCAPLET_SOURCE = libwapcaplet-$(LIBWAPCAPLET_VERSION).tar.gz
LIBWAPCAPLET_SITE = svn://svn.netsurf-browser.org/trunk/libwapcaplet

LIBWAPCAPLET_INSTALL_STAGING = YES

define LIBWAPCAPLET_CONFIGURE_CMDS
endef

define LIBWAPCAPLET_BUILD_CMDS
	$(MAKE) all CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr -C $(@D)
endef

define LIBWAPCAPLET_INSTALL_STAGING_CMDS
	$(MAKE) install CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,libwapcaplet))
