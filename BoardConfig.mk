#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/nothing/Metroid

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_INCORRECT_PARTITION_IMAGES := true

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    odm \
    system \
    system_ext \
    vendor \
    product
BOARD_USES_RECOVERY_AS_BOOT := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sun
TARGET_NO_BOOTLOADER := true

# Display
TARGET_USES_VULKAN := true

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
#TARGET_KERNEL_CONFIG := vendor/sun_perf.config
#TARGET_KERNEL_SOURCE := kernel/nothing/Metroid

# Módulos del Kernel para el Ramdisk (Obligatorio para que modprobe funcione)
BOARD_VENDOR_RAMDISK_KERNEL_MODULES += \
    $(DEVICE_PATH)/prebuilt/modules/adsp_loader_dlkm.ko \
    $(DEVICE_PATH)/prebuilt/modules/adsp_sleepmon.ko \
    $(DEVICE_PATH)/prebuilt/modules/goodix_ts.ko \
    $(DEVICE_PATH)/prebuilt/modules/goodix_fp.ko \
    $(DEVICE_PATH)/prebuilt/modules/focaltech_tp.ko \
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
BOARD_PREBUILT_DTBOIMAGE := device/nothing/Metroid/prebuilt/dtbo
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
endif

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 104857600
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 9126805504 # TODO: Fix hardcoded value
BOARD_SUPER_PARTITION_GROUPS := nothing_dynamic_partitions
BOARD_NOTHING_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm
BOARD_NOTHING_DYNAMIC_PARTITIONS_SIZE := 9122611200 # TODO: Fix hardcoded value

# Platform
TARGET_BOARD_PLATFORM := sun

# GSI && GKI
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# Crypto
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true
TW_USE_FSCRYPT_POLICY := 2

# Tool
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP :=true

TW_LOAD_VENDOR_MODULES := "adsp_loader_dlkm.ko adsp_sleepmon.ko goodix_ts.ko goodix_fp.ko focaltech_tp.ko rproc_qcom_common.ko q6_dlkm.ko qcom_q6v5.ko qcom_q6v5_pas.ko qcom_sysmon.ko st_fts.ko haptic.ko"

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
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
ifeq ($(TW_DEFAULT_LANGUAGE),)
TW_DEFAULT_LANGUAGE := EN
endif
TW_DEFAULT_BRIGHTNESS := 750
ifneq ($(PRODUCT_RELEASE_NAME),lmi)
TW_Y_OFFSET := 88
TW_H_OFFSET := -88
endif
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TW_NO_SCREEN_BLANK := true
PLATFORM_VERSION := 12.1
TW_HAS_EDL_MODE := true
TW_SUPPORT_INPUT_AIDL_HAPTICS :=true
TARGET_SUPPORTS_64_BIT_APPS :=true
