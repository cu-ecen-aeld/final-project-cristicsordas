
##############################################################
#
# PCF_DRIVER
#
##############################################################

PCF_DRIVER_VERSION = cb440e634037d5343cee222d0c7df437e88744bf
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
PCF_DRIVER_SITE = git@github.com:cristicsordas/raspi_robot.git
PCF_DRIVER_SITE_METHOD = git
PCF_DRIVER_GIT_SUBMODULES = YES

PCF_DRIVER_MODULE_SUBDIRS = PCF8591/

define PCF_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/PCF8591/pcf_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/PCF8591/pcf_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))