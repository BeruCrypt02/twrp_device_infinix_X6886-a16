#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2026 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
# Fox settings for Infinix HOT 60 Pro+ (X6886) - pulled in by twrp_X6886.mk
#

# screen settings (1080x2400 punch-hole, verify OF_STATUS_H from a screenshot)
OF_SCREEN_H := 2400
OF_STATUS_H := 144
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_HIDE_NOTCH := 1
OF_CLOCK_POS := 1

# flashlight paths (verified against stock init.mt6789.rc)
OF_FL_PATH1 := /sys/devices/virtual/torch/torch/torch_level
OF_FL_PATH2 := /sys/devices/virtual/flashlight_core/flashlight/flashlight_torch

# ADB/MTP stay on from boot
OF_ADVANCED_SECURITY := 0

# TEST ONLY: skip decrypt to verify boot chain (revert to 0 after test)
OF_SKIP_FBE_DECRYPTION := 1
# default keymaster service version, matches stock
OF_DEFAULT_KEYMASTER_VERSION := 4.1
# fstab carries /metadata: silence metadata mount noise on ROMs without it
OF_FBE_METADATA_MOUNT_IGNORE := 1

# always keep verity/encryption handling (fox_16.0 default, explicit for record)
OF_KEEP_DM_VERITY_FORCED_ENCRYPTION := 1
OF_DONT_PATCH_ENCRYPTED_DEVICE := 1

# quick backup + partition tools (same set as official mt6789 trees)
OF_QUICK_BACKUP_LIST := /boot;/data;
OF_ENABLE_LPTOOLS := 1
OF_ENABLE_ALL_PARTITION_TOOLS := 1
OF_NO_TREBLE_COMPATIBILITY_CHECK := 1

# don't spam the console with loop errors
OF_LOOP_DEVICE_ERRORS_TO_LOG := 1

# number of list options before scrollbar creation
OF_OPTIONS_LIST_NUM := 9

# don't keep log history - only for Stable releases
ifeq ($(FOX_BUILD_TYPE),Stable)
   OF_DONT_KEEP_LOG_HISTORY := 1
endif

# maintainer
OF_MAINTAINER := B E R U
