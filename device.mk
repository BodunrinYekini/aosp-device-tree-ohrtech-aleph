#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/ohrtech/aleph

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

#DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage
    
PRODUCT_PACKAGES += \
    linker.recovery \
    shell_and_utilities_recovery \
    adbd.vendor_ramdisk

TARGET_PREBUILT_KERNEL := device/ohrtech/aleph/prebuilt/kernel
PRODUCT_COPY_FILES += \
	$(TARGET_PREBUILT_KERNEL):kernel

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
PRODUCT_PACKAGES += snapuserd_ramdisk


## vendor overlay
# PRODUCT_COPY_FILES += \
# $(LOCAL_PATH)/vendor/overlay/MultiuserOverlays.apk:$(BUILD_PREBUILT)/MultiuserOverlays.apk
# $(LOCAL_PATH)/vendor/overlay/NetworkStackOverlayGo.apk:$(BUILD_PREBUILT)/overlay/NetworkStackOverlayGo.apk
# $(LOCAL_PATH)/vendor/overlay/NetworkStackOverlayGsi.apk:$(BUILD_PREBUILT)/overlay/NetworkStackOverlayGsi.apk
# $(LOCAL_PATH)/vendor/overlay/Settings__auto_generated_rro_vendor.apk:$(BUILD_PREBUILT)/overlay/Settings__auto_generated_rro_vendor.apk
# $(LOCAL_PATH)/vendor/overlay/TetheringConfigOverlayGo.apk:$(BUILD_PREBUILT)/overlay/TetheringConfigOverlayGo.apk
# $(LOCAL_PATH)/vendor/overlay/TetheringConfigOverlayGsi.apk:$(BUILD_PREBUILT)/overlay/TetheringConfigOverlayGsi.apk
# $(LOCAL_PATH)/vendor/overlay/unisoc_go_overlay_frameworks_res.apk:$(BUILD_PREBUILT)/overlay/unisoc_go_overlay_frameworks_res.apk
# $(LOCAL_PATH)/vendor/overlay/unisoc_overlay_frameworks_res.apk:$(BUILD_PREBUILT)/overlay/unisoc_overlay_frameworks_res.apk
# $(LOCAL_PATH)/vendor/overlay/AospBtOverlay/AospBtOverlay.apk:$(BUILD_PREBUILT)/overlay/AospBtOverlay/AospBtOverlay.apk
# $(LOCAL_PATH)/vendor/overlay/AospWifiOverlay_Marlin3/AospWifiOverlay_Marlin3.apk:$(BUILD_PREBUILT)/overlay/AospWifiOverlay_Marlin3/AospWifiOverlay_Marlin3.apk
# $(LOCAL_PATH)/vendor/overlay/AospWifiOverlay_Marlin3_Mainline/AospWifiOverlay_Marlin3_Mainline.apk:$(BUILD_PREBUILT)/overlay/AospWifiOverlay_Marlin3_Mainline/AospWifiOverlay_Marlin3_Mainline.apk
# $(LOCAL_PATH)/vendor/overlay/UniWifiOverlay_Marlin3/UniWifiOverlay_Marlin3.apk:$(BUILD_PREBUILT)/overlay/UniWifiOverlay_Marlin3/UniWifiOverlay_Marlin3.apk
#$(DEVICE_PATH)/configs/displayconfig/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Display config
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/displayconfig/display_id_4630947256895775107.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630947256895775107.xml \
  $(LOCAL_PATH)/displayconfig/thermal_brightness_control.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/thermal_brightness_control.xml

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

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
    android.hardware.health-service.example \

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true


# Product characteristics
PRODUCT_CHARACTERISTICS := default

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

PRODUCT_PACKAGES += \
    fstab.cali \
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
    $(LOCAL_PATH)/rootdir/etc/fstab.cali:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.cali

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/ohrtech/aleph/aleph-vendor.mk)

# Hidl Service
PRODUCT_ENFORCE_VINTF_MANIFEST := true

# VENDOR_BOOT_ROOT_MODULE_DIR := $(DEVICE_PATH)/prebuilt/vendor_boot/root
# KERNEL_MODULE_DIR := $(DEVICE_PATH)/prebuilt/vendor_boot/lib/modules
# FIRST_STAGE_MODULE_DIR := $(DEVICE_PATH)/prebuilt/vendor_boot/first_stage_ramdisk
# SYSTEM_BIN_MODULE_DIR := $(DEVICE_PATH)/prebuilt/vendor_boot/system/bin
# SYSTEM_LIB64_MODULE_DIR := $(DEVICE_PATH)/prebuilt/vendor_boot/system/lib64

# PRODUCT_COPY_FILES += \
#         $(foreach f,$(wildcard $(KERNEL_MODULE_DIR)/*),$(f):$(subst $(KERNEL_MODULE_DIR),$(TARGET_COPY_OUT_VENDOR_RAMDISK)/lib/modules/,$(f)))

# PRODUCT_COPY_FILES += \
#         $(foreach f,$(wildcard $(FIRST_STAGE_MODULE_DIR)/*),$(f):$(subst $(FIRST_STAGE_MODULE_DIR),$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/,$(f)))

# PRODUCT_COPY_FILES += \
#         $(foreach f,$(wildcard $(SYSTEM_BIN_MODULE_DIR)/*),$(f):$(subst $(SYSTEM_BIN_MODULE_DIR),$(TARGET_COPY_OUT_VENDOR_RAMDISK)/system/bin/,$(f)))

# PRODUCT_COPY_FILES += \
#         $(foreach f,$(wildcard $(SYSTEM_LIB64_MODULE_DIR)/*),$(f):$(subst $(SYSTEM_LIB64_MODULE_DIR),$(TARGET_COPY_OUT_VENDOR_RAMDISK)/system/lib64/,$(f)))

# PRODUCT_COPY_FILES += \
#         $(foreach f,$(wildcard $(VENDOR_BOOT_ROOT_MODULE_DIR)/*),$(f):$(subst $(VENDOR_BOOT_ROOT_MODULE_DIR),$(TARGET_COPY_OUT_VENDOR_RAMDISK)/,$(f)))

 #BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := \
