
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
RASPI_ROBOT_VERSION = a4fa7e7ee7ee1ca606ad2f446891bde029da4432
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
RASPI_ROBOT_SITE = git@github.com:cristicsordas/raspi_robot.git
RASPI_ROBOT_SITE_METHOD = git
RASPI_ROBOT_GIT_SUBMODULES = YES

define RASPI_ROBOT_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define RASPI_ROBOT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/server/bin/aesdsocket $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
