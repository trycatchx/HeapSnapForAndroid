LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := malloc_debug
LOCAL_SRC_FILES := $(LOCAL_PATH)/lib/android_malloc_debug.so
include $(PREBUILT_SHARED_LIBRARY)