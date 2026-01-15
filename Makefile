export ARCHS = arm64
export TARGET = iphone:clang:latest:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hack

# Change Tweak.x to Tweak.xm here
hack_FILES = Tweak.xm $(wildcard KittyMemory/*.cpp)

# Keep these include paths so it finds KittyMemory.hpp
hack_CFLAGS = -fobjc-arc -I. -IKittyMemory
hack_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk
