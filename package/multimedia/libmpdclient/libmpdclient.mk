#############################################################
#
# libmpdclient
#
#############################################################
LIBMPDCLIENT_VERSION = 2.4
LIBMPDCLIENT_SOURCE = libmpdclient-$(LIBMPDCLIENT_VERSION).tar.gz
LIBMPDCLIENT_SITE =  http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
LIBMPDCLIENT_INSTALL_STAGING = YES

$(eval $(call AUTOTARGETS,package/multimedia,libmpdclient))
