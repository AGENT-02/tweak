export ARCHS = arm64
export TARGET = iphone:clang:latest:26.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = hack

# 1. Finds all .cpp files inside the KittyMemory folder
hack_FILES = Tweak.x $(wildcard KittyMemory/*.cpp)

# 2. -I. tells the compiler to look in the root folder
# 3. -IKittyMemory tells it to look inside the KittyMemory folder
hack_CFLAGS = -fobjc-arc -I. -IKittyMemory
hack_LDFLAGS = -lsubstrate

include $(THEOS_MAKE_PATH)/tweak.mk
