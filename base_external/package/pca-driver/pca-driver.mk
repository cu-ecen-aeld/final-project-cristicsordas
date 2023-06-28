
##############################################################
#
# PCA_DRIVER
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 7 git contents
PCA_DRIVER_VERSION = c404b84ff7afdbb40e4f796fccdd01a20683a987
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
PCA_DRIVER_SITE = git@github.com:cristicsordas/raspi_robot.git
PCA_DRIVER_SITE_METHOD = git
PCA_DRIVER_GIT_SUBMODULES = YES

PCA_DRIVER_MODULE_SUBDIRS = PCA9685_driver/

define PCA_DRIVER_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/PCA9685_driver/pca_load $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/PCA9685_driver/pca_unload $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))