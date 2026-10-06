# twrp_X6886.mk - Infinix HOT 60 Pro+ (X6886, MT6789, Android 16)
# vendor_boot as recovery (header v4), tr_* partitions need tran_avb.pubkey

PRODUCT_RELEASE_NAME := X6886
DEVICE_PATH := device/infinix/$(PRODUCT_RELEASE_NAME)

# Inherit from X6886 device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Fox settings
$(call inherit-product-if-exists, $(DEVICE_PATH)/fox_X6886.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier (from stock fingerprint
# Infinix/X6886-OP/Infinix-X6886:16/BP2A.250605.031.A3)
PRODUCT_DEVICE := X6886
PRODUCT_NAME := twrp_X6886
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6886
PRODUCT_MANUFACTURER := INFINIX

PRODUCT_GMS_CLIENTID_BASE := android-infinix
