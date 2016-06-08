# Copyright (C) 2016 Mozilla Foundation
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

LOCAL_PATH := $(call my-dir)

NODE_PATH := external/node

include $(CLEAR_VARS)
LOCAL_MODULE := node
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_TAGS := optional
include $(BUILD_PREBUILT)

node_LOCAL_BUILT_MODULE :=$(LOCAL_BUILT_MODULE)

$(LOCAL_BUILT_MODULE):
	@(cd $(NODE_PATH) && \
	  ./android-configure ~/.mozbuild/android-ndk-r11b $(TARGET_ARCH) && \
	  $(MAKE) && \
	  cp out/Release/node $(abspath $(node_LOCAL_BUILT_MODULE))) || exit $?
