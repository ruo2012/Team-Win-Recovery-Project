LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := events.c resources.c
ifneq ($(BOARD_CUSTOM_GRAPHICS),)
  LOCAL_SRC_FILES += $(BOARD_CUSTOM_GRAPHICS)
else
  LOCAL_SRC_FILES += graphics.c
endif

LOCAL_C_INCLUDES +=\
    external/libpng\
    external/zlib\
	external/jpeg


ifeq ($(RECOVERY_TOUCHSCREEN_SWAP_XY), true)
LOCAL_CFLAGS += -DRECOVERY_TOUCHSCREEN_SWAP_XY
endif

ifeq ($(RECOVERY_TOUCHSCREEN_FLIP_X), true)
LOCAL_CFLAGS += -DRECOVERY_TOUCHSCREEN_FLIP_X
endif

ifeq ($(RECOVERY_TOUCHSCREEN_FLIP_Y), true)
LOCAL_CFLAGS += -DRECOVERY_TOUCHSCREEN_FLIP_Y
endif

LOCAL_MODULE := libminui

include $(BUILD_STATIC_LIBRARY)
