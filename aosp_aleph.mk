#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#
# All components inherited here go to system image
#


# Inherit from aleph device
$(call inherit-product, device/ohrtech/aleph/device.mk)

PRODUCT_DEVICE := aleph
PRODUCT_NAME := aosp_aleph
PRODUCT_BRAND := OhrTech
PRODUCT_MODEL := aleph_Natv
PRODUCT_MANUFACTURER := ohrtech

PRODUCT_GMS_CLIENTID_BASE := android-ohrtech

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="aleph_Natv-userdebug 13 TP1A.220624.014 20231108-114636 test-keys"

BUILD_FINGERPRINT := OhrTech/aleph_Natv/aleph:13/TP1A.220624.014/20231108-114636:userdebug/test-keys
