#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# CAS HAL: stock Samsung ships only the lazy HIDL service
# (vendor/bin/hw/android.hardware.cas@1.2-service-lazy + its rc, extracted to
# vendor/samsung/a12s). base_vendor.mk installs the AOSP non-lazy
# android.hardware.cas@1.2-service for shipping API <= 33 unless this is false;
# installing it next to stock's lazy service would double-declare
# android.hardware.cas@1.2::IMediaCasService/default (duplicate vintf fragment
# plus two init services). Must be set before the core product inherits below
# (base_vendor.mk is parsed there), hence it lives here and not in device.mk.
TARGET_REQUIRES_HIDL_CAS_HAL := false

## Inherit from generic products, most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/non_ab_device.mk)

## Inherit from a12s device
$(call inherit-product, device/samsung/a12s/device.mk)

## Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 720

## Inherit some common LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

## Device identifier
PRODUCT_DEVICE := a12s
PRODUCT_NAME := lineage_a12s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A127F
PRODUCT_MANUFACTURER := samsung
PRODUCT_SHIPPING_API_LEVEL := 30

PRODUCT_GMS_CLIENTID_BASE := android-samsung

# The 4.19.148 kernel does not meet the FCM level 6 minimum LTS (4.19.325), so
# do not enforce kernel version requirements in the OTA; the platform still
# checks the device manifest target level normally.
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false
