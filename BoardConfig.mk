#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# --- Konfigurasi Dasar ---
LOCAL_PATH := device/realme/RMX1805

ALLOW_MISSING_DEPENDENCIES := true

# --- Arsitektur ---
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := generic
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# --- Bootloader & Platform ---
TARGET_BOOTLOADER_BOARD_NAME := msm8953
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506
TARGET_BOARD_SUFFIX := _64

# --- Kernel ---
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_RAMDISK_OFFSET := 0x01000000
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/Image.gz-dtb

# Init
TARGET_INIT_VENDOR_LIB := libinit_RMX1805
TARGET_RECOVERY_DEVICE_MODULES := libinit_RMX1805
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

# --- Partisi ---
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3599761408
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25438436352
BOARD_VENDORIMAGE_PARTITION_SIZE := 1106640896
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true

# --- System-as-Root (SAR) ---
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist
BOARD_SUPPRESS_SECURE_ERASE := true
TARGET_COPY_OUT_VENDOR := vendor

# --- Verified Boot (AVB) ---
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)

# --- Konfigurasi Recovery & TWRP/OrangeFox ---
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/root/etc/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_EXTRA_LANGUAGES := true
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_BRIGHTNESS_PATH := "sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1200
TW_SCREEN_BLANK_ON_BOOT := true
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
TARGET_USES_MKE2FS := true
TW_EXCLUDE_TWRPAPP := true
#TW_SKIP_COMPATIBILITY_CHECK := true # Tidak lagi dibutuhkan karena sudah di-patch di source

# =================================================================
# PENGATURAN ENKRIPSI UNTUK KOMPATIBILITAS STOCK ROM FDE ANDROID 9
# -----------------------------------------------------------------
# Nonaktifkan dekripsi berbasis hardware dan paksa penggunaan dekripsi software.
# Ini adalah kunci untuk memperbaiki 'failed to decrypt data'.
# =================================================================
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/commonsys/cryptfs_hw
TARGET_HW_DISK_ENCRYPTION := true
TW_INCLUDE_CRYPTO := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
# TARGET_PROVIDES_KEYMASTER := true
# TARGET_KEYMASTER_WAIT_FOR_QSEE := true
# BOARD_USES_QCOM_HARDWARE := true  # Pastikan ini ada
# BOARD_USES_KEYMASTER_30 := true   # Atau versi keymaster yang sesuai (misal 3.0)
TW_INCLUDE_CRYPTO_FBE := true # Ini untuk FBE, tidak relevan untuk masalah FDE saat ini
# TW_INCLUDE_FBE := true

# FPS
TW_FRAMERATE := 60

# --- Anti-Rollback Protection (ARB) & Properti Build ---
# HACK: Mencegah error instalasi di beberapa ROM
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
