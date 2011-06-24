#############################################################
#
# mouse-emul
#
#############################################################

MOUSE_EMUL_VERSION = v0.1
MOUSE_EMUL_SITE = git://github.com/anarsoul/mouse-emul.git

define MOUSE_EMUL_BUILD_CMDS
	$(MAKE) CC='$(TARGET_CC)' CFLAGS='$(TARGET_CFLAGS)' \
		PREFIX=/usr -C $(@D)
endef

define MOUSE_EMUL_INSTALL_TARGET_CMDS
	$(MAKE) CC='$(TARGET_CC)' CFLAGS='$(TARGET_CFLAGS)' \
		PREFIX=/usr DESTDIR=$(TARGET_DIR) install -C $(@D)
endef

$(eval $(call GENTARGETS,package,mouse-emul))
