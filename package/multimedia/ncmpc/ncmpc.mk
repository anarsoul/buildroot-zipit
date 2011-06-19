#############################################################
#
# ncmpc
#
#############################################################
NCMPC_VERSION = 0.18
NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.bz2
NCMPC_SITE =  http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/musicpd
NCMPC_DEPENDENCIES = ncurses libglib2 libmpdclient

ifeq ($(BR2_ENABLE_LOCALE),y)
NCMPC_CONF_OPTS += --enable-nls
endif

ifeq ($(BR2_USE_WCHAR),y)
NCMPC_CONF_OPTS += --enable-multibyte
endif

$(eval $(call AUTOTARGETS,package/multimedia,ncmpc))
