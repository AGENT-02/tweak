export ARCHS = arm64
export TARGET = iphone:clang:latest:26.2
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hack

# These variables MUST start with the TWEAK_NAME (hack)
hack_FILES = Tweak.x $(wildcard KittyMemory/*.cpp)
hack_CFLAGS = -fobjc-arc
hack_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk
