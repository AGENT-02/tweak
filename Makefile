export ARCHS = arm64
export TARGET = iphone:clang:latest:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hack

# 1. Compile Tweak.xm and KittyMemory files
hack_FILES = Tweak.xm $(wildcard KittyMemory/*.cpp)

# 2. ADD kNO_KEYSTONE: This tells KittyMemory to skip the broken Keystone library
# 3. ADD -Wno-module-import-in-extern-c: This suppresses the specific Clang error
hack_CFLAGS = -fobjc-arc -I. -IKittyMemory -DkNO_KEYSTONE -Wno-module-import-in-extern-c
hack_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk
