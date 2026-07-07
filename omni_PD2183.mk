#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from PD2183 device
$(call inherit-product, device/vivo/PD2183/device.mk)

PRODUCT_DEVICE := PD2183
PRODUCT_NAME := omni_PD2183
PRODUCT_BRAND := vivo
PRODUCT_MODEL := V2183A
PRODUCT_MANUFACTURER := vivo

PRODUCT_GMS_CLIENTID_BASE := android-vivo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vext_k6983v1_64-user 12 SP1A.210812.003 compiler260420142447 release-keys"

BUILD_FINGERPRINT := vivo/PD2183/PD2183:12/SP1A.210812.003/compiler260420142447:user/release-keys
