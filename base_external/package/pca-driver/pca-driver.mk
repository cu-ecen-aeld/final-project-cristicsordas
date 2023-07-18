
##############################################################
#
# PCA_DRIVER
#
##############################################################

PCA_DRIVER_VERSION = cb440e634037d5343cee222d0c7df437e88744bf
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