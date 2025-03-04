#
# This policy configuration will be used by all qcom products
# that inherit from cherish
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/cherish/sepolicy/qcom/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/cherish/sepolicy/qcom/dynamic \
    device/cherish/sepolicy/qcom/system

else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/cherish/sepolicy/qcom/dynamic \
    device/cherish/sepolicy/qcom/vendor
endif

ifneq ($(filter msm8960 msm8226 msm8610 msm8974 apq8084 msm8909 msm8916 msm8952 msm8992 msm8994,$(TARGET_BOARD_PLATFORM)),)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/cherish/sepolicy/qcom/legacy-vendor
endif

ifeq (,$(filter msm8960 msm8226 msm8610 msm8974 apq8084 msm8909 msm8916 msm8952 msm8992 msm8994 msm8937 msm8953 msm8996 msm8998 sdm660 sdm710 sdm845, $(TARGET_BOARD_PLATFORM)))
BOARD_SEPOLICY_M4DEFS += \
    display_vendor_data_file=vendor_display_vendor_data_file \
    hal_keymaster_qti_exec=vendor_hal_keymaster_qti_exec \
    hal_perf_default=vendor_hal_perf_default \
    persist_block_device=vendor_persist_block_device \
    qdisplay_service=vendor_qdisplay_service \
    sysfs_battery_supply=vendor_sysfs_battery_supply \
    sysfs_graphics=vendor_sysfs_graphics \
    sysfs_usb_supply=vendor_sysfs_usb_supply
endif
