#
# Copyright (C) 2023 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2025 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024-2025 The OrangeFox Recovery Project
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


DEVICE_PATH := device/nothing/Metroid

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    odm \
    vendor \
    system \
    system_ext \
    product

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := Oryon V2

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sun
#TARGET_NO_BOOTLOADER := true

# Kernel/Ramdisk
BOARD_KERNEL_PAGESIZE         := 4096
TARGET_KERNEL_ARCH            := arm64
TARGET_KERNEL_HEADER_ARCH     := arm64
BOARD_KERNEL_IMAGE_NAME       := Image
BOARD_BOOT_HEADER_VERSION     := 4
TARGET_KERNEL_CLANG_COMPILE   := true
#TARGET_PREBUILT_KERNEL        := /dev/null # empty kernel image
BOARD_MKBOOTIMG_ARGS          += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS          += --pagesize $(BOARD_KERNEL_PAGESIZE)

# Módulos del Kernel para el Ramdisk (Obligatorio para que modprobe funcione)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += \
    $(DEVICE_PATH)/prebuilt/modules/adsp_loader_dlkm.ko \
    $(DEVICE_PATH)/prebuilt/modules/adsp_sleepmon.ko \
    $(DEVICE_PATH)/prebuilt/modules/goodix_ts.ko \
    $(DEVICE_PATH)/prebuilt/modules/goodix_fp.ko \
    $(DEVICE_PATH)/prebuilt/modules/focaltech_tp.ko \
    $(DEVICE_PATH)/prebuilt/modules/msm_drm.ko \
    $(DEVICE_PATH)/prebuilt/modules/leds-qpnp-vibrator-ldo.ko \
    $(DEVICE_PATH)/prebuilt/modules/qti_battery_charger.ko \
    $(DEVICE_PATH)/prebuilt/modules/drm_display_helper.ko \
    $(DEVICE_PATH)/prebuilt/modules/msm_ext_display.ko \
    $(DEVICE_PATH)/prebuilt/modules/nt_display_notifier.ko \
    $(DEVICE_PATH)/prebuilt/modules/panel_event_notifier.ko \
    $(DEVICE_PATH)/prebuilt/modules/rproc_qcom_common.ko \
    $(DEVICE_PATH)/prebuilt/modules/q6_dlkm.ko \
    $(DEVICE_PATH)/prebuilt/modules/qcom_q6v5.ko \
    $(DEVICE_PATH)/prebuilt/modules/qcom_q6v5_pas.ko \
    $(DEVICE_PATH)/prebuilt/modules/qcom_sysmon.ko \
    $(DEVICE_PATH)/prebuilt/modules/st_fts.ko \
    $(DEVICE_PATH)/prebuilt/modules/haptic.ko

# Kernel - prebuilt
TARGET_KERNEL_ARCH := arm64
TARGET_FORCE_PREBUILT_KERNEL := true
TARGET_NO_KERNEL_OVERRIDE := true
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
#BOARD_PREBUILT_DTBOIMAGE := device/nothing/Metroid/prebuilt/dtbo
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

TARGET_COPY_OUT_VENDOR := vendor

TARGET_COPY_OUT_ODM := odm
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_VENDOR_DLKMIMAGE := true
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := nothing_dynamic_partitions
BOARD_NOTHING_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
BOARD_NOTHING_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Platform
TARGET_BOARD_PLATFORM := sun
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# GSI && GKI
#BOARD_USES_GENERIC_KERNEL_IMAGE := true
#BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

# Use LZ4 Ramdisk compression instead of GZIP
BOARD_RAMDISK_USE_LZ4 := true

# TODO: MOVE IT
TARGET_RECOVERY_DEVICE_MODULES += \
    android.hidl.allocator@1.0 \
    android.hidl.memory@1.0 \
    android.hidl.memory.token@1.0 \
    libdmabufheap \
    libhidlmemory \
    libion \
    libnetutils \
    vendor.display.config@1.0 \
    vendor.display.config@2.0 \
    libdebuggerd_client
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.product;ro.build.fingerprint=ro.vendor.build.fingerprint;ro.build.version.incremental"
TW_OVERRIDE_PROPS_ADDITIONAL_PARTITIONS := vendor
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.allocator@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/android.hidl.memory.token@1.0.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdmabufheap.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libhidlmemory.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libnetutils.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libdebuggerd_client.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so
#TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# System Properties
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3 # disable hashtree/verification

# Encryption
BOARD_USES_METADATA_PARTITION := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# VINTF
PRODUCT_ENFORCE_VINTF_MANIFEST := true
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/recovery/root/vendor/etc/vintf/manifest.xml

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy

# Tool
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_SCREEN_BLANK_ON_BOOT := true
TW_INCLUDE_REPACKTOOLS := true
ifeq ($(TW_DEVICE_VERSION),)
TW_DEVICE_VERSION=Dr.Brown28
endif
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := false
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH         := "/sys/class/backlight/panel0-backlight/brightness"
TW_CUSTOM_CPU_TEMP_PATH    := "/sys/class/thermal/thermal_zone6/temp"
TW_MAX_BRIGHTNESS := 1500
ifeq ($(TW_DEFAULT_LANGUAGE),)
TW_DEFAULT_LANGUAGE := EN
endif
TW_DEFAULT_BRIGHTNESS := 1500
TW_Y_OFFSET := 88
TW_H_OFFSET := -88
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_NO_SCREEN_BLANK := true
PLATFORM_VERSION := 12.1
TW_HAS_EDL_MODE := true
TW_SUPPORT_INPUT_AIDL_HAPTICS :=true
TARGET_SUPPORTS_64_BIT_APPS :=true
TW_HAS_MTP                 := true
TW_INTERNAL_STORAGE_PATH   := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH   := "/usb_otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb_otg"

TW_LOAD_VENDOR_MODULES := "$(shell tr '\n' ' ' < $(DEVICE_PATH)/recovery/root/vendor/lib/modules/modules.load.recovery)"
TW_MODULE_BLACKLIST := aw9380x|aw_press 
