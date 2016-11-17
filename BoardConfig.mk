#
# Copyright (C) 2016 The CyanogenMod Project
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

BOARD_VENDOR := pantech
PLATFORM_PATH := device/pantech/ef63l

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

USE_CLANG_PLATFORM_BUILD := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=NULL,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 vmalloc=260M loglevel=0 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
BOARD_DTBTOOL_ARGS := -2
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := cyanogenmod_ef63_defconfig
TARGET_KERNEL_SOURCE := kernel/pantech/msm8x74
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-

# ReleaseTools
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_PATH)/releasetools

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Assert
TARGET_OTA_ASSERT_DEVICE := ef63l,ef63s,ef63k

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := false
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true

# Camera
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
USE_DEVICE_SPECIFIC_CAMERA := true
BOARD_GLOBAL_CFLAGS += -DPANTECH_CAMERA_HARDWARE
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CM Hardware
BOARD_HARDWARE_CLASS += $(PLATFORM_PATH)/cmhw
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += \
    hardware/cyanogen/cmhw

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
    ifeq ($(WITH_DEXPREOPT_BOOT_IMG_ONLY),)
      WITH_DEXPREOPT_BOOT_IMG_ONLY := true
    endif
  endif
endif

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE    := 209715200
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 2566914048
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26534215680
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for factory issue
BOARD_VOLD_CRYPTFS_MIGRATE := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Graphics
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Init
TARGET_INIT_VENDOR_LIB := libinit_ef63l
TARGET_RECOVERY_DEVICE_MODULES := libinit_ef63l
TARGET_UNIFIED_DEVICE := true

# Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Legacy Blobs
TARGET_NEEDS_TEXT_RELOCATIONS := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# QCOM Power
TARGET_POWERHAL_VARIANT := qcom

# Protobuf-c
PROTOBUF_SUPPORTED := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.qcom

# RIL
TARGET_RIL_VARIANT := caf
BOARD_GLOBAL_CFLAGS += -DUSE_RIL_VERSION_10
BOARD_GLOBAL_CPPFLAGS += -DUSE_RIL_VERSION_10

# Simple time service client
BOARD_USES_QC_TIME_SERVICES := true

# RPC
TARGET_NO_RPC := true

# SELinux
 include device/qcom/sepolicy/sepolicy.mk

# BOARD_SEPOLICY_DIRS += \
    $(PLATFORM_PATH)/sepolicy

# Sensor Compat
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M

BLOCK_BASED_OTA := false

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
TARGET_WCNSS_MAC_PREFIX          := d095c7
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X


# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

-include vendor/pantech/ef63l/BoardConfigVendor.mk

