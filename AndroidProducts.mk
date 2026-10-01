#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/twrp_X6886.mk

# bp2a = Android 16 release (stock build BP2A.250605.031.A3)
COMMON_LUNCH_CHOICES := \
    twrp_X6886-eng \
    twrp_X6886-userdebug \
    twrp_X6886-bp2a-eng \
    twrp_X6886-bp2a-userdebug
