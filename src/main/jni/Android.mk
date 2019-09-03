LOCAL_PATH := $(call my-dir)

#include $(LOCAL_PATH)/libmalloc/Android.mk


include $(CLEAR_VARS)
LOCAL_MODULE    := malloc_debug

$(warning "the value of TARGET_ARCH_ABI is $(TARGET_ARCH_ABI)")

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_SRC_FILES := $(LOCAL_PATH)/libmalloc/lib/armeabi-v7a/libc_malloc_debug.so
endif
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_SRC_FILES := $(LOCAL_PATH)/libmalloc/lib/arm64-v8a/libc_malloc_debug.so
endif
include $(PREBUILT_SHARED_LIBRARY)




include $(CLEAR_VARS)
LOCAL_MODULE := heapsnapexe
LOCAL_SRC_FILES := inject.c process_util.c ptrace_util.c
LOCAL_CFLAGS += -pie -fPIE
LOCAL_LDFLAGS += -pie -fPIE
LOCAL_LDLIBS += -L$(SYSROOT)/usr/lib -llog -ldl
include $(BUILD_EXECUTABLE)




include $(CLEAR_VARS)
LOCAL_MODULE := leak_test
LOCAL_SRC_FILES := leak_test.c
LOCAL_LDLIBS += -L$(SYSROOT)/usr/lib -llog -ldl
LOCAL_CFLAGS += -pie -fPIE
LOCAL_LDFLAGS += -pie -fPIE
include $(BUILD_EXECUTABLE)



include $(CLEAR_VARS)
LOCAL_SRC_FILES := libheapsnap/heapsnap.cpp
LOCAL_SHARED_LIBRARIES := malloc_debug
LOCAL_C_INCLUDES :=
LOCAL_MODULE:= libheapsnap
LOCAL_LDLIBS := -ldl -llog

LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

