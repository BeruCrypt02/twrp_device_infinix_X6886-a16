#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_X6886.mk

# bp2a = Android 16 release (stock build BP2A.250605.031.A3)
# Thanks to YF-Marco for telling me about this fix

COMMON_LUNCH_CHOICES := \
    twrp_X6886-bp2a-eng
