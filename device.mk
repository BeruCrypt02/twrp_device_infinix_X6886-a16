#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# device.mk - Infinix HOT 60 Pro+ (X6886, MT6789, Android 16)
# vendor_boot as recovery (header v4)

LOCAL_PATH := device/infinix/X6886

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk))

# Virtual A/B OTA (launch with vendor ramdisk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
ENABLE_VIRTUAL_AB := true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_SHIPPING_API_LEVEL := 36
PRODUCT_TARGET_VNDK_VERSION := 36

# AB OTA partitions (Virtual A/B with vendor ramdisk)
AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    lk \
    odm \
    odm_dlkm \
    product \
    system \
    system_ext \
    vbmeta_system \
    vbmeta_vendor \
    vendor \
    vendor_boot \
    vendor_dlkm

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/mtk_plpath_utils \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

# System properties (includes system.prop)
TARGET_SYSTEM_PROP += $(LOCAL_PATH)/system.prop

PRODUCT_PROPERTY_OVERRIDES += ro.twrp.vendor_boot=true

# --- Boot control HAL (MTK) ---
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

# --- Fastbootd ---
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# --- Health HAL ---
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# --- Keymaster / Keymint (Trustonic TEE) ---
PRODUCT_PACKAGES += \
    android.hardware.security.keymint \
    android.hardware.security.secureclock \
    android.hardware.security.sharedsecret \
    android.system.keystore2

# NDK libs (already in recovery/root, byte-identical to stock dump)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/android.hardware.keymaster-V4-ndk.so:recovery/root/vendor/lib64/android.hardware.keymaster-V4-ndk.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/android.hardware.security.keymint-V3-ndk.so:recovery/root/vendor/lib64/android.hardware.security.keymint-V3-ndk.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/android.hardware.gatekeeper-V1-ndk.so:recovery/root/vendor/lib64/android.hardware.gatekeeper-V1-ndk.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/android.system.keystore2-V1-ndk.so:recovery/root/vendor/lib64/android.system.keystore2-V1-ndk.so

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.keymaster-V4-ndk.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hardware.security.keymint-V3-ndk.so

# --- MTK plpath utils ---
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# --- Update engine ---
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# --- Device-specific modules ---
PRODUCT_PACKAGES += \
    libinit_X6886

# --- formatdata.sh (script only - trigger is inside init.recovery.mt6789.rc) ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/bin/formatdata.sh:recovery/root/system/bin/formatdata.sh

# --- Kernel modules (from stock dump) ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/lib/modules:recovery/root/lib/modules

# --- Touch / WiFi / BT firmware ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/firmware:vendor/firmware

# --- Trustonic TEE registry ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/vendor/app/mcRegistry:vendor/app/mcRegistry

# --- vintf manifests ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/vintf/manifest.xml:system/etc/vintf/manifest.xml \
    $(LOCAL_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:vendor/etc/vintf/manifest.xml

# --- fstab from stock dump ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/first_stage_ramdisk/fstab.emmc:recovery/root/first_stage_ramdisk/fstab.emmc \
    $(LOCAL_PATH)/recovery/root/first_stage_ramdisk/fstab.mt6789:recovery/root/first_stage_ramdisk/fstab.mt6789

# --- ueventd ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/ueventd.mt6789.rc:recovery/root/ueventd.mt6789.rc \
    $(LOCAL_PATH)/recovery/root/system/etc/ueventd.rc:system/etc/ueventd.rc

# --- init rc files ---
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.modules.rc:recovery/root/init.modules.rc \
    $(LOCAL_PATH)/recovery/root/init.device.rc:recovery/root/init.device.rc \
    $(LOCAL_PATH)/recovery/root/init.vibrator.rc:recovery/root/init.vibrator.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6789.rc:recovery/root/init.recovery.mt6789.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.usb.rc:recovery/root/init.recovery.usb.rc \
    $(LOCAL_PATH)/recovery/root/init.tee.rc:recovery/root/init.tee.rc \
    $(LOCAL_PATH)/recovery/root/init.custom.rc:recovery/root/init.custom.rc

# --- Blob copy rules ---
-include $(LOCAL_PATH)/proprietary-files.mk
