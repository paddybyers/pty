# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := pty

LOCAL_SRC_FILES := \
	src/openpty.c \
	src/util.c

# debug
ifeq ($(debug),true)
LOCAL_CFLAGS += \
	-DDEBUG \
	-g \
	-O0 \
	-Wall \
	-Wextra
endif

# common flags
LOCAL_CFLAGS += \
	-D__POSIX__ \
	-DX_STACKSIZE=65536 \
	-D_LARGEFILE_SOURCE \
	-D_FILE_OFFSET_BITS=64 \
	-DHAVE_FDATASYNC=1 \
	-D_FORTIFY_SOURCE=2 \
	-DPLATFORM=\"android\" \
	-Wno-unused-parameter

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

include $(BUILD_STATIC_LIBRARY)
