export ARCHS = arm64
export TARGET = iphone:clang:latest:14.5

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hack

# 1. Finds all .cpp files inside the KittyMemory folder automatically
hack_FILES = Tweak.x $(wildcard KittyMemory/*.cpp)

# 2. -I. tells clang to look in the root folder
# 3. -IKittyMemory tells clang to look INSIDE the KittyMemory folder for .hpp files
hack_CFLAGS = -fobjc-arc -I. -IKittyMemory
hack_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk
