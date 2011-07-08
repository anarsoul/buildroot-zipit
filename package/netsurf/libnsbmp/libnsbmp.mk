#############################################################
#
# libnsbmp
#
#############################################################

LIBNSBMP_VERSION = 12162
# LIBNSBMP_SOURCE = libnsbmp-$(LIBPARSERUTILS_VERSION).tar.gz
LIBNSBMP_SITE = svn://svn.netsurf-browser.org/trunk/libnsbmp

LIBNSBMP_INSTALL_STAGING = YES

define LIBNSBMP_CONFIGURE_CMDS
endef

define LIBNSBMP_BUILD_CMDS
	$(MAKE) all CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr -C $(@D)
endef

define LIBNSBMP_INSTALL_STAGING_CMDS
	$(MAKE) install CC='$(TARGET_CC)' TARGET=linux PREFIX=/usr DESTDIR=$(STAGING_DIR) -C $(@D)
endef

$(eval $(call GENTARGETS,package,libnsbmp))
