#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)


TARGET_PREBUILT_KERNEL := device/ohrtech/aleph/prebuilts/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=erofs \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 33

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

PRODUCT_PACKAGES += \
	messaging
    
# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# NFC
#ssssPRODUCT_PACKAGES += \
    libnfc-nci \
    libnfc_nci_jni \
    NfcNci \
    Tag

    # Keep the VNDK APEX in /system partition for REL branches as these branches are
# expected to have stable API/ABI surfaces.
ifneq (REL,$(PLATFORM_VERSION_CODENAME))
  PRODUCT_PACKAGES += com.android.vndk.current.on_vendor
endif

# Rootdir
PRODUCT_PACKAGES += \
    log_to_csv.sh \
    loading.sh \
    para.sh \
    total.sh \
    create_splloader_dual_slot_byname_path.sh \
    idlefast.sh \
    init.insmod.sh \
    setup_console.sh \
    zramwb.sh \
    framework-res__auto_generated_rro_product \
    framework-res_navbar_rro \
    FrameworkResOverlay \
    GoogleCaptivePortalLoginGoOverlay \
    GoogleDocumentsUIOverlay \
    GoogleExtServicesConfigOverlay \
    GooglePermissionControllerFrameworkOverlay \
    GooglePermissionControllerOverlay \
    ModuleMetadataGoogleOverlay \
    Settings__auto_generated_rro_product \
    SettingsProvider__auto_generated_rro_product \
    SysuiGoConfigOverlay \
    TeleService__auto_generated_rro_product \
    TeleServiceOverlay \
    unisoc-res__auto_generated_rro_product \
    WallpaperOverlay \
    com.google.mainline.go.telemetry

PRODUCT_PACKAGES += \
    fstab.ums9230_1h10 \
    init.cali.rc \
    init.ram.gms.rc \
    init.ram.native.rc \
    init.ram.rc \
    init.storage.rc \
    init.ums9230_1h10.rc \
    init.ums9230_1h10.usb.rc \
    init.ums9230_1h10_go.rc \
    init.ums9230_1h10_go.usb.rc \
    init.ums9230_4h10.rc \
    init.ums9230_4h10.usb.rc \
    init.ums9230_4h10_go.rc \
    init.ums9230_4h10_go.usb.rc \
    init.ums9230_4h10_go_AG801.rc \
    init.ums9230_4h10_go_AG801.usb.rc \
    init.zramwb.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.ums9230_1h10:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.ums9230_1h10

   # VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

#/vendor/etc/vintf/compatibility_matrix.xml
DEVICE_MATRIX_FILE += $(DEVICE_PATH)/device_compatibility_matrix.xml

#/product/etc/vintf/compatibility_matrix.xml 
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE+= $(DEVICE_PATH)/product_compatibility_matrix.xml 

#/system/etc/vintf/compatibility_matrix.device.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE+=$(DEVICE_PATH)/system_compatibility_matrix.xml


# Sepolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/system
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/ohrtech/aleph/aleph-vendor.mk)
