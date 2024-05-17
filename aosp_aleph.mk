#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

#
# All components inherited here go to vendor image
#
# TODO(b/136525499): move *_vendor.mk into the vendor makefile later
$(call inherit-product, $(SRC_TARGET_DIR)/product/handheld_vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony_vendor.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Don't build super.img.
PRODUCT_BUILD_SUPER_PARTITION := false

# Keep the VNDK APEX in /system partition for REL branches as these branches are
# expected to have stable API/ABI surfaces.
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif

#
# All components inherited here go to product image
#
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_product.mk)

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
