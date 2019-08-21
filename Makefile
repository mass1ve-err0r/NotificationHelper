ARCHS = arm64
GO_EASY_ON_ME = 1
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = NotificationHelper

NotificationHelper_FILES = SBNHRootListController.m
NotificationHelper_LIBRARIES = applist
NotificationHelper_INSTALL_PATH = /Library/PreferenceBundles
NotificationHelper_FRAMEWORKS = UIKit
NotificationHelper_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
NotificationHelper_PRIVATE_FRAMEWORKS = Preferences
NotificationHelper_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/NotificationHelper.plist$(ECHO_END)

After-install::
	install.exec "killall -9 SpringBoard"
