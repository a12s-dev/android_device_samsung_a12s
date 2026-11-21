#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

## Inherit from the common tree
include device/samsung/m12-common/BoardConfigCommon.mk

## Inherit from the proprietary configuration
include vendor/samsung/a12s/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/a12s

## Display
TARGET_SCREEN_DENSITY := 300

## DTBO
BOARD_DTBO_CFG := $(DEVICE_PATH)/configs/kernel/a12s.cfg

## Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 5679087616
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 5678039040

## Kernel
TARGET_KERNEL_CONFIG := a12s_defconfig
# Build the kernel with the clang 12 prebuilt under prebuilts/clang/kernel.
# The AOSP host clang (18+) produces an Image that never boots on this device;
# the same source built with this clang 12 prebuilt boots Android 16 userspace.
TARGET_KERNEL_CLANG_VERSION := r416183b
# drivers/gpu/arm/Kconfig picks the Mali DDK version from the $(PLATFORM_VERSION)
# Kconfig env var; without it the Kconfig fails to parse.
TARGET_KERNEL_ADDITIONAL_FLAGS := PLATFORM_VERSION=13 ANDROID_MAJOR_VERSION=t LLVM_IAS=0

## OTA
TARGET_OTA_ASSERT_DEVICE := a12s

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## USB
$(call soong_config_set,samsungUsbGadgetVars,gadget_name,13600000.dwc3)

## SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

## VINTF
# a12s-only device manifest fragments and framework compatibility matrix:
#  * android.hardware.cas@1.2-service-lazy.xml declares the stock lazy CAS
#    service the a12s vendor tree installs; the AOSP non-lazy service is
#    disabled in lineage_a12s.mk (TARGET_REQUIRES_HIDL_CAS_HAL := false), and
#    android.hardware.cas@1.2 is required by the level-6 FCM.
#  * a12s_framework_compatibility_matrix.xml covers the 6 Samsung HALs served by
#    shipped stock services that the shared hardware/samsung matrix omits.
DEVICE_MANIFEST_FILE += $(wildcard $(DEVICE_PATH)/vintf/manifest/*.xml)
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/a12s_framework_compatibility_matrix.xml
