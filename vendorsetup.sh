# vendorsetup.sh - Infinix HOT 60 Pro+ (X6886, MT6789, Android 16)
# vendor_boot as recovery (header v4), Virtual A/B
# Device must be set or the rest is ignored|

export FOX_BUILD_DEVICE=X6886
export TARGET_ARCH=arm64

# Virtual A/B
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1

# vendor_boot as recovery - keep stock images around for unbrick
export FOX_VENDOR_BOOT_RECOVERY=1

# keep it under 64MB (langs are EN+ID, see BoardConfig)
export OF_USE_LZMA_COMPRESSION=1
export FOX_REMOVE_AAPT=1
export FOX_DELETE_AROMAFM=1
export FOX_COMPRESS_EXECUTABLES=1

# Transsion, no MIUI patches
export FOX_VANILLA_BUILD=1
export OF_DISABLE_MIUI_SPECIFIC_FEATURES=1

# OF_ feature vars live in fox_X6886.mk, don't duplicate them here
