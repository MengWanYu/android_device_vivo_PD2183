#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_PD2183.mk \
    $(LOCAL_DIR)/omni_PD2183.mk

COMMON_LUNCH_CHOICES := \
    twrp_PD2183-eng \
    twrp_PD2183-userdebug \
    twrp_PD2183-user
