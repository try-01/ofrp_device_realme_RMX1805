#
# Copyright (C) 2017 The Android Open Source Project
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

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, build/target/product/embedded.mk)

PRODUCT_PACKAGES += \
    qcom_decrypt

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := RMX1805
PRODUCT_NAME := omni_$(PRODUCT_DEVICE)
PRODUCT_BRAND := Oppo
PRODUCT_MODEL := Realme 2
PRODUCT_MANUFACTURER := Oppo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=RMX1805 \
    BUILD_PRODUCT=RMX1805 \
    TARGET_DEVICE=RMX1805

# HACK: Set a future vendor patch level and other properties to
# bypass checks in some stock updater-scripts.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.build.security_patch=2099-12-31
