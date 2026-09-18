# vendorsetup.sh - Infinix Hot 60 Pro Plus (x6886)
# OrangeFox Recovery - fox_12.1 (R12)
# Device: Transsion (Infinix) MT6789, vendor_boot header v4, Virtual A/B, FBE
# Lunch combo must match PRODUCT_NAME in ofox_X6886.mk

add_lunch_combo ofox_X6886-bp2a-eng
add_lunch_combo ofox_X6886-bp2a-userdebug

# Device identity (without this the vars below are ignored)
export FOX_BUILD_DEVICE=X6886
export TARGET_ARCH=arm64

# Slot scheme: Virtual A/B (enables AB + vanilla bits automatically)
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1

# vendor_boot-as-recovery (hdr4, experimental - keep stock images for unbrick)
export FOX_VENDOR_BOOT_RECOVERY=1

# Stock platform ramdisk handling (see ramdisk_callback.sh next to device.mk)
export FOX_LOCAL_CALLBACK_SCRIPT=device/infinix/X6886/ramdisk_callback.sh

# Size: must fit 64MB vendor_boot (LZMA + drastic, EN+ID languages only)
export OF_USE_LZMA_COMPRESSION=1
export FOX_DRASTIC_SIZE_REDUCTION=1

# Plain build, no MIUI patches (Transsion device)
export FOX_VANILLA_BUILD=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

# Decrypt: normal password prompt (NO skip), keymaster 7.0 per stock dump
# (if decrypt fails on first boot, check recovery.log before touching this)
export OF_DEFAULT_KEYMASTER_VERSION=7.0

# Display: 1080x2400 punch-hole (verify OF_STATUS_H from a screenshot)
export OF_SCREEN_H=2400
export OF_STATUS_H=144
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=1

# Flashlight paths (verified against stock init.mt6789.rc)
export OF_FL_PATH1="/sys/devices/virtual/torch/torch/torch_level"
export OF_FL_PATH2="/sys/devices/virtual/flashlight_core/flashlight/flashlight_torch"

# Advanced security: ADB/MTP stay off until the password is entered
export OF_ADVANCED_SECURITY=1

# Maintainer
export OF_MAINTAINER="B E R U"
