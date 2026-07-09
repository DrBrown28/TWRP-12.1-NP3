#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)


DEVICE_PATH := device/nothing/Metroid

# Inherit from Metroid device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Include TWRP props
#$(call inherit-product, $(DEVICE_PATH)/twrp.mk)

# Include Fox props
#$(call inherit-product, $(DEVICE_PATH)/fox.mk)

PRODUCT_DEVICE := Metroid
PRODUCT_NAME := fox_Metroid
PRODUCT_BRAND := Nothing
PRODUCT_MODEL := A024
PRODUCT_MANUFACTURER := nothing

PRODUCT_GMS_CLIENTID_BASE := android-nothing

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="Metroid-user 16 BQ2A.250721.001-BP2A.250605.031.A3 2606241457 release-keys"

BUILD_FINGERPRINT := Nothing/Metroid/Metroid:16/BQ2A.250721.001-BP2A.250605.031.A3/2606241457:user/release-keys