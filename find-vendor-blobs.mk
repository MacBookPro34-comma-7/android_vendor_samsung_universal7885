#
# Copyright (C) 2017 TeamNexus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# get treble info from BoardConfig.mk
include $(DEVICE_PATH)/BoardConfig.mk

define find-vendor-blobs
    $(foreach vendor_file, $(shell find $(1) -type f | sed -n 's|^$(1)/||p'), \
    	$(if $(strip $(findstring $(vendor_file):$(vendor_file),$(PRODUCT_COPY_FILES))), \
    		$(NOOP), \
                $(if $(filter system/vendor, $(TARGET_COPY_OUT_VENDOR)), \
                $(1)/$(vendor_file):$(vendor_file), \
                $(1)/$(vendor_file):$(strip $(subst system/, vendor/, $(subst system/vendor, vendor, $(vendor_file)))))))
endef
