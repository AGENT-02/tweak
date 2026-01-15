export ARCHS = arm64
export TARGET = iphone:clang:latest:26.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hack
StealthBypass_FILES = Tweak.x $(wildcard KittyMemory/*.cpp)
StealthBypass_CFLAGS = -fobjc-arc
StealthBypass_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk