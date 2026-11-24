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
#

# Inherit from the common tree
# Bring-up only: fstab without /data encryption. Must precede the a21s-common
# inherit so the first PRODUCT_COPY_FILES entry for each destination wins.
PRODUCT_COPY_FILES += \
    device/samsung/a12s/configs/init/fstab.exynos850:$(TARGET_COPY_OUT_RAMDISK)/fstab.exynos850 \
    device/samsung/a12s/configs/init/fstab.exynos850:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.exynos850

$(call inherit-product, device/samsung/a21s-common/common.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# NFC
# The A12 (SM-A127F) has no NFC hardware. The a21s device tree enables NFC
# through configs/nfc and the a21s device vendor makefile
# (vendor/samsung/a21s/a21s-vendor.mk) installs NFC firmware only, so neither
# is inherited for a12s.

# Bring-up only (rom22): write kernel/Android logs to /cache for recovery pull.
PRODUCT_COPY_FILES += device/samsung/a12s/configs/init/init.a12s.bringup.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.a12s.bringup.rc

# Bring-up only: periodic log dumper script.
PRODUCT_COPY_FILES += device/samsung/a12s/configs/init/a12s_logdump.sh:/system/etc/a12s_logdump.sh
