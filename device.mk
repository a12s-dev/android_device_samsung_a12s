#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a12s

# Inherit from the common tree
$(call inherit-product, device/samsung/m12-common/common.mk)

# Inherit proprietary files
$(call inherit-product, vendor/samsung/a12s/a12s-vendor.mk)

# Stock Samsung audio/bluetooth servers are installed at a renamed path; the
# stock rc files point at the .samsung names (the AOSP source servers of the
# same basename are deliberately not installed).
PRODUCT_COPY_FILES += \
    vendor/samsung/a12s/proprietary/vendor/bin/hw/android.hardware.audio.service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.audio.service.samsung \
    vendor/samsung/a12s/proprietary/vendor/bin/hw/android.hardware.bluetooth@1.0-service:$(TARGET_COPY_OUT_VENDOR)/bin/hw/android.hardware.bluetooth@1.0-service.samsung

# Audio: the extracted stock vendor/etc/mixer_paths.xml (a12s board routing,
# codec aud3004x) is installed by vendor/samsung/a12s/a12s-vendor.mk and wins;
# configs/audio/mixer_paths.xml is kept for reference but not copied.

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Graphics
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# Init
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/init/init.a12s.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.a12s.rc

# Shims for stock blobs against lineage-23.2 platform libs (mirrors the
# proven reference tree; supplied by the a12s vendor's shared_libs)
PRODUCT_PACKAGES += \
    libshim_libbase \
    libshim_boringssl \
    libshim_libui_mapper

# Keymaster
$(call soong_config_set,samsungVars,target_keymaster4_library,//vendor/samsung/a12s:libskeymaster4device)

# NFC
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

PRODUCT_PACKAGES += \
    WifiResA12s

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
