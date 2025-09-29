LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init
LOCAL_SRC_FILES := init_RMX1805.cpp
LOCAL_MODULE := libinit_RMX1805

include $(BUILD_STATIC_LIBRARY)