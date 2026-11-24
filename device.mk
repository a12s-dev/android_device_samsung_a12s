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
# Bring-up only: A12 TEE userspace from the A12 vendor, above the inherits so these win.
PRODUCT_COPY_FILES += \
    device/samsung/a12s/configs/init/teegris.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/teegris.rc \
    device/samsung/a12s/configs/init/pa_daemon_teegris.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/pa_daemon_teegris.rc \
    device/samsung/a12s/configs/init/vaultkeeper_common.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vaultkeeper_common.rc \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-564c544b5052:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-564c544b5052 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-474154454b45:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-474154454b45 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-000048444350:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-000048444350 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-505256544545:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-505256544545 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-00575644524d:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-00575644524d \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-6b6e78677564:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-6b6e78677564 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-000000010081:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-000000010081 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-42494f535542:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-42494f535542 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-656e676d6f64:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-656e676d6f64 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-000000020081:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-000000020081 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-5345435f4652:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-5345435f4652 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-000000534b4d:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-000000534b4d \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-0050524f4341:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-0050524f4341 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-0000534b504d:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-0000534b504d \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-657365636f6d:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-657365636f6d \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-46494e474502:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-46494e474502 \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-0053545354ab:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-0053545354ab \
    device/samsung/a12s/tee/tee/00000000-0000-0000-0000-4b45594d5354:$(TARGET_COPY_OUT_VENDOR)/tee/00000000-0000-0000-0000-4b45594d5354 \
    device/samsung/a12s/tee/tee/driver/00000000-0000-0000-0000-494363447256:$(TARGET_COPY_OUT_VENDOR)/tee/driver/00000000-0000-0000-0000-494363447256 \
    device/samsung/a12s/tee/tee/driver/00000000-0000-0000-0000-564c544b4456:$(TARGET_COPY_OUT_VENDOR)/tee/driver/00000000-0000-0000-0000-564c544b4456 \
    device/samsung/a12s/tee/tee/tui/resolution_common/ID00000100:$(TARGET_COPY_OUT_VENDOR)/tee/tui/resolution_common/ID00000100

# Bring-up only: fstab without /data encryption. Must precede the a21s-common
# inherit so the first PRODUCT_COPY_FILES entry for each destination wins.
# Bring-up only: teegris rc without the tzdaemon wait_for_prop (see report).
PRODUCT_COPY_FILES += device/samsung/a12s/configs/init/teegris_v4.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/teegris_v4.rc
PRODUCT_COPY_FILES += \
    device/samsung/a12s/configs/init/fstab.exynos850:$(TARGET_COPY_OUT_RAMDISK)/fstab.exynos850 \
    device/samsung/a12s/configs/init/fstab.exynos850:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.exynos850

PRODUCT_PACKAGES += \
    vendor.samsung.hardware.security.proca@2.0-service \
    vendor.samsung.hardware.security.vaultkeeper@2.0-service \
    vendor.samsung.hardware.security.vaultkeeper@2.0

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
