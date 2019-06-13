# Copyright (C) 2019 BeastROMs
# Copyright (C) 2019 KomodOS Rom
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

KOMODO_VERSION = 1.0

ifndef KOMODO_BUILD_TYPE
    KOMODO_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)

ifeq ($(KOMODO_OFFICIAL),true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/KomodOS-Rom/platform_vendor_komodo/pie/komodo.devices)
   FOUND_DEVICE = $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      KOMODO_BUILD_TYPE := OFFICIAL
    else
      KOMODO_BUILD_TYPE := UNOFFICIAL
    endif
endif

DATE := $(shell date -u +%Y%m%d-%H%M)
TARGET_BACON_NAME := KomodOS-$(KOMODO_VERSION)-$(CURRENT_DEVICE)-$(KOMODO_BUILD_TYPE)-$(DATE)
KOMODO_FINGERPRINT := KomodOS/$(KOMODO_VERSION)/$(PLATFORM_VERSION)/$(BUILD_ID)/$(DATE)
KOMODO_DISPLAY_VERSION := $(KOMODO_VERSION)-$(KOMODO_BUILD_TYPE)

PRODUCT_PROPERTY_OVERRIDES += \
BUILD_DISPLAY_ID=$(BUILD_ID) \
com.komodo.fingerprint=$(KOMODO_FINGERPRINT) \
ro.komodo.version=$(KOMODO_VERSION) \
ro.komodo.display.version=$(KOMODO_DISPLAY_VERSION) \
ro.komodo.releasetype=$(KOMODO_BUILD_TYPE) \
ro.modversion=$(TARGET_BACON_NAME)

