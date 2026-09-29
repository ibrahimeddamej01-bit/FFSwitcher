include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = WESTz

WESTz_FILES = main.m ViewController.m wpAppDelegate.m wpRootViewController.m

WESTz_FRAMEWORKS = UIKit CoreGraphics
WESTz_PRIVATE_FRAMEWORKS = 
WESTz_CFLAGS = -fobjc-arc -fno-modules
WESTz_OBJCFLAGS = -fno-modules
WESTz_USE_MODULES = 0

WESTz_RESOURCES = Resources
WESTz_ENTITLEMENTS = Entitlements.plist

include $(THEOS_MAKE_PATH)/application.mk
