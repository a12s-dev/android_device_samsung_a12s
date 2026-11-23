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
$(call inherit-product, device/samsung/a21s-common/common.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

# NFC
# The A12 (SM-A127F) has no NFC hardware. The a21s device tree enables NFC
# through configs/nfc and the a21s device vendor makefile
# (vendor/samsung/a21s/a21s-vendor.mk) installs NFC firmware only, so neither
# is inherited for a12s.
