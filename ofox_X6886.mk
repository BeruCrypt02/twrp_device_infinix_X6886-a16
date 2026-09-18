# ofox_X6886.mk - OrangeFox R12 (fox_12.1) product makefile
# Device: Infinix Hot 60 Pro Plus (x6886)
# Platform: MediaTek MT6789 (Transsion)
# Android: 16 (XOS 16 - BP2A.250605.031.A3)
#
# Converted to fox_12.1 / R12
# Recovery is inside vendor_boot (header v4)
# Transsion-specific: tr_* partitions + tran_avb.pubkey

$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Note: This tree does NOT inherit vendor/ofox/config/common.mk
# (kept as-is from original structure)

PRODUCT_NAME := ofox_X6886
PRODUCT_DEVICE := X6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6886
PRODUCT_MANUFACTURER := INFINIX

