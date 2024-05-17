#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/ohrtech/aleph

# A/B
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    system \
    system_ext \
    vendor \
    odm \
    product \
    vendor_dlkm


BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BOARD_BOOT_HEADER_VERSION := 4


# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a75

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := ums9230_4h10_go
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 213

# Kernel prebuilt or source
TARGET_FORCE_PREBUILT_KERNEL := true

#TARGET_NO_KERNEL := true
#BOARD_PREBUILT_BOOTIMAGE := out/target/product/aleph/boot.img

# Kernel
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),false)
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyS1,115200n8 buildvariant=user
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := aleph_defconfig
TARGET_KERNEL_SOURCE := kernel/ohrtech/aleph
endif

# Kernel - prebuilt
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := true
endif

# Partitions
TARGET_USES_MKE2FS := true
BOARD_AVB_ALGORITHM ?= SHA256_RSA4096
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 104857600
BOARD_USES_VENDOR_BOOTIMAGE := true
BOARD_BOOTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_AVB_PRODUCT_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_AVB_ODM_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_AVB_SYSTEM_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_AVB_SYSTEM_EXT_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_AVB_VENDOR_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_VENDOR_DLKMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_AVB_VENDOR_DLKM_ALGORITHM := $(BOARD_AVB_ALGORITHM)
BOARD_SUPER_PARTITION_SIZE := 4299161600
BOARD_SUPER_PARTITION_GROUPS := ohrtech_dynamic_partitions
BOARD_OHRTECH_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor odm product vendor_dlkm
BOARD_OHRTECH_DYNAMIC_PARTITIONS_SIZE := 4294967296 # -4MB overhead
TARGET_COPY_OUT_ODM := odm
TARGET_COPY_OUT_PRODUCT := product
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_VENDOR_DLKM := vendor_dlkm
TARGET_COPY_OUT_SYSTEM_EXT := system_ext
TARGET_COPY_OUT_SYSTEM := system
TARGET_COPY_OUT_VENDOR_RAMDISK := vendor_ramdisk

BOARD_AVB_PRODUCT_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_PRODUCT_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_ODM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_ODM_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_VENDOR_DLKM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_VENDOR_DLKM_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_SYSTEM_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_SYSTEM_EXT_ADD_HASHTREE_FOOTER_ARGS += --hash_algorithm sha256
BOARD_AVB_SYSTEM_EXT_ADD_HASHTREE_FOOTER_ARGS += --flags 0

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 1

BOARD_AVB_VENDOR_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_VENDOR_BOOT_ALGORITHM := SHA256_RSA4096
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VENDOR_BOOT_ROLLBACK_INDEX_LOCATION := 18

BOARD_AVB_DTBO_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_DTBO_ALGORITHM := SHA256_RSA4096
BOARD_AVB_DTBO_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_DTBO_ROLLBACK_INDEX_LOCATION := 6


# Platform
TARGET_BOARD_PLATFORM := ums9230

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/system_ext.prop
TARGET_SYSTEM_DLKM_PROP += $(DEVICE_PATH)/system_dlkm.prop
TARGET_ODM_PROP += $(DEVICE_PATH)/odm.prop
TARGET_ODM_DLKM_PROP += $(DEVICE_PATH)/odm_dlkm.prop
TARGET_VENDOR_DLKM_PROP += $(DEVICE_PATH)/vendor_dlkm.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.cali
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true


# Security patch level
VENDOR_SECURITY_PATCH := 2023-09-05

# Verified Boot
BOARD_AVB_ENABLE := true

# VINTF
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

PRODUCT_ENFORCE_VINTF_MANIFEST := true

DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := \
$(DEVICE_PATH)/compatibility_matrix.xml \


# Inherit the proprietary files
include vendor/ohrtech/aleph/BoardConfigVendor.mk

BOARD_RAMDISK_USE_LZ4 := true
BOARD_USES_RECOVERY_AS_BOOT :=
BOARD_USES_GENERIC_KERNEL_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE :=
BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT :=

#AB_OTA_PARTITIONS += vendor_boot
#BOARD_RAMDISK_USE_LZ4 := true
#BOARD_USES_RECOVERY_AS_BOOT := 
#BOARD_USES_GENERIC_KERNEL_IMAGE := true
#BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
#BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
#BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := 
#BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := 
