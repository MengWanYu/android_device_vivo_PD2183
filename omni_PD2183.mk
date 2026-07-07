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
PRODUCT_NAME := twrp_PD2183
PRODUCT_BRAND := vivo
PRODUCT_MODEL := V2183A
PRODUCT_MANUFACTURER := vivo

PRODUCT_GMS_CLIENTID_BASE := android-vivo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="vext_k6983v1_64-user 12 SP1A.210812.003 compiler260420142447 release-keys"

BUILD_FINGERPRINT := vivo/PD2183/PD2183:12/SP1A.210812.003/compiler260420142447:user/release-keys

# === Decryption stack (from official 13.1.10.3 recovery) ===
# KeyMint + Gatekeeper + Trustonic TEE + Keystore2 + vivo guardianangle
# NOTE: android.hardware.keymaster@3.0/4.0/4.1.so are REMOVED —
#       TW_INCLUDE_CRYPTO=true builds them from AOSP source, causing duplicate target error.
# NOTE: libkeymaster_messages.so, libkeymaster_portable.so,
#       libpuresoftkeymasterdevice.so, libsoftkeymasterdevice.so are REMOVED —
#       they are part of TWRP's standard crypto module.
RECOVERY_CRYPTO_FILES := \
    device/vivo/PD2183/recovery/root/system/bin/servicemanager:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/servicemanager \
    device/vivo/PD2183/recovery/root/system/bin/hwservicemanager:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/hwservicemanager \
    device/vivo/PD2183/recovery/root/system/bin/keystore2:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/keystore2 \
    device/vivo/PD2183/recovery/root/system/bin/wait_for_keymaster:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/wait_for_keymaster \
    device/vivo/PD2183/recovery/root/system/bin/guardianangle:$(TARGET_COPY_OUT_RECOVERY)/root/system/bin/guardianangle \
    device/vivo/PD2183/recovery/root/vendor/bin/vndservicemanager:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/vndservicemanager \
    device/vivo/PD2183/recovery/root/vendor/bin/mcDriverDaemon:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/mcDriverDaemon \
    device/vivo/PD2183/recovery/root/vendor/bin/android.hardware.gatekeeper@1.0-service:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/android.hardware.gatekeeper@1.0-service \
    device/vivo/PD2183/recovery/root/vendor/bin/hw/android.hardware.security.keymint-service.trustonic:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/bin/hw/android.hardware.security.keymint-service.trustonic \
    device/vivo/PD2183/recovery/root/system/lib64/libkeymint.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymint.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeymint_support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymint_support.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeymaster4support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4support.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeymaster4_1support.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeymaster4_1support.so \
    device/vivo/PD2183/recovery/root/system/lib64/lib_android_keymaster_keymint_utils.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/lib_android_keymaster_keymint_utils.so \
    device/vivo/PD2183/recovery/root/system/lib64/android.hardware.security.keymint-V1-ndk_platform.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.security.keymint-V1-ndk_platform.so \
    device/vivo/PD2183/recovery/root/system/lib64/android.system.keystore2-V1-ndk_platform.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.system.keystore2-V1-ndk_platform.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore2_crypto.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore2_crypto.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore2_apc_compat.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore2_apc_compat.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore2_aaid.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore2_aaid.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore2_vintf_cpp.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore2_vintf_cpp.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore-attestation-application-id.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore-attestation-application-id.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore-engine.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore-engine.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore-engine-wifi-hidl.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore-engine-wifi-hidl.so \
    device/vivo/PD2183/recovery/root/system/lib64/libkeystore-wifi-hidl.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libkeystore-wifi-hidl.so \
    device/vivo/PD2183/recovery/root/system/lib64/libgatekeeper.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libgatekeeper.so \
    device/vivo/PD2183/recovery/root/system/lib64/android.hardware.gatekeeper@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.hardware.gatekeeper@1.0.so \
    device/vivo/PD2183/recovery/root/system/lib64/android.system.wifi.keystore@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/android.system.wifi.keystore@1.0.so \
    device/vivo/PD2183/recovery/root/system/lib64/libvivogatekeeper.so:$(TARGET_COPY_OUT_RECOVERY)/root/system/lib64/libvivogatekeeper.so \
    device/vivo/PD2183/recovery/root/vendor/lib64/android.hardware.gatekeeper@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/android.hardware.gatekeeper@1.0.so \
    device/vivo/PD2183/recovery/root/vendor/lib64/libkeymaster4.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeymaster4.so \
    device/vivo/PD2183/recovery/root/vendor/lib64/libkeymaster41.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/libkeymaster41.so \
    device/vivo/PD2183/recovery/root/vendor/lib64/vendor.vivo.hardware.wifi.keystore@1.0.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/vendor.vivo.hardware.wifi.keystore@1.0.so \
    device/vivo/PD2183/recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    device/vivo/PD2183/recovery/root/vendor/lib64/hw/libMcGatekeeper.so:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/lib64/hw/libMcGatekeeper.so \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/06090000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/06090000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/020f0000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/020f0000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/05120000000000000000000000000001.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05120000000000000000000000000001.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/05070000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/05070000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/40188311faf343488db888ad39496f9a.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/40188311faf343488db888ad39496f9a.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/5020170115e016302017012521300000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/5020170115e016302017012521300000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/035c0000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/035c0000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/037c0000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/037c0000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/07150000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07150000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/08050000000000000000000000003419.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/08050000000000000000000000003419.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/62d690ff530e46cfb472ec52c4da3773.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/62d690ff530e46cfb472ec52c4da3773.drbin \
    device/vivo/PD2183/recovery/root/vendor/app/mcRegistry/07170000000000000000000000000000.drbin:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/app/mcRegistry/07170000000000000000000000000000.drbin \
    device/vivo/PD2183/recovery/root/plat_keystore2_key_contexts:$(TARGET_COPY_OUT_RECOVERY)/root/plat_keystore2_key_contexts

PRODUCT_COPY_FILES += $(RECOVERY_CRYPTO_FILES)

# Recovery root files (init scripts, MTK utils)
# NOTE: modules.load.recovery is auto-generated by BOARD_RECOVERY_KERNEL_MODULES
# NOTE: .ko files are handled by BOARD_RECOVERY_KERNEL_MODULES in BoardConfig.mk
# NOTE: Use literal device/vivo/PD2183 path — $(DEVICE_PATH) is not available in product mk context
RECOVERY_ROOT_FILES := \
    device/vivo/PD2183/recovery/root/init.recovery.mt6983.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.mt6983.rc \
    device/vivo/PD2183/recovery/root/init.recovery.platform.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.platform.rc \
    device/vivo/PD2183/recovery/root/init.recovery.svc.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.svc.rc \
    device/vivo/PD2183/recovery/root/init.recovery.service.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.service.rc \
    device/vivo/PD2183/recovery/root/init.recovery.touch.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.touch.rc \
    device/vivo/PD2183/recovery/root/init.recovery.usb.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.usb.rc \
    device/vivo/PD2183/recovery/root/init.recovery.hlthchrg.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.hlthchrg.rc \
    device/vivo/PD2183/recovery/root/init.recovery.ldconfig.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.ldconfig.rc \
    device/vivo/PD2183/recovery/root/mtk-plpath-utils.rc:$(TARGET_COPY_OUT_RECOVERY)/root/mtk-plpath-utils.rc \
    device/vivo/PD2183/recovery/root/servicemanager.recovery.rc:$(TARGET_COPY_OUT_RECOVERY)/root/servicemanager.recovery.rc

PRODUCT_COPY_FILES += $(RECOVERY_ROOT_FILES)
