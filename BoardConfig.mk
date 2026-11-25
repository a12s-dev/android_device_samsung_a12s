#
# Copyright (C) 2020-2025 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## Inherit from the common tree
include device/samsung/a21s-common/BoardConfigCommon.mk

## Inherit from the proprietary configuration
include vendor/samsung/a21s/BoardConfigVendor.mk

DEVICE_PATH := device/samsung/a12s

## Bring-up only (rom29): drop the TEE keymaster 4.0 HAL from the device manifest
## and use our own manifest that omits it, while we run software KeyMint.
DEVICE_MANIFEST_FILE := $(filter-out device/samsung/a21s-common/manifest.xml,$(DEVICE_MANIFEST_FILE)) $(DEVICE_PATH)/configs/vintf/manifest.xml

## OTA TARGET
TARGET_OTA_ASSERT_DEVICE := a12s
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

## Kernel
TARGET_KERNEL_CONFIG := exynos850-a12snsxx_defconfig

## Partitions
BOARD_SUPER_PARTITION_SIZE := 5679087616
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 5679085568
BOARD_BOOTIMAGE_PARTITION_SIZE := 46137344

## DTBO
BOARD_DTBO_CFG := $(DEVICE_PATH)/configs/kernel/a12s.cfg

## Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

## Bring-up only: forced permissive SELinux, still needed to capture logs.
## Remove this (and go enforcing) once bring-up is confirmed.
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
