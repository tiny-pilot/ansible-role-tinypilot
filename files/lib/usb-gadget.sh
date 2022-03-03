#!/bin/bash

# Shared parameters and functionality for the usb gadget.
# See: docs/usb-gadget-driver.md

export readonly USB_DEVICE_DIR="g1"
export readonly USB_GADGET_PATH="/sys/kernel/config/usb_gadget"
export readonly USB_DEVICE_PATH="${USB_GADGET_PATH}/${USB_DEVICE_DIR}"
export readonly USB_FILE_CONFIG_PATH="${USB_DEVICE_PATH}/functions/mass_storage.0/lun.0/file"
export readonly USB_CDROM_CONFIG_PATH="${USB_DEVICE_PATH}/functions/mass_storage.0/lun.0/cdrom"

export readonly USB_STRINGS_DIR="strings/0x409"
export readonly USB_KEYBOARD_FUNCTIONS_DIR="functions/hid.keyboard"
export readonly USB_MOUSE_FUNCTIONS_DIR="functions/hid.mouse"
export readonly USB_MASS_STORAGE_FUNCTIONS_DIR="functions/mass_storage.0"

export readonly USB_CONFIGS_DIR="configs"
export readonly USB_ALL_CONFIGS_DIR="configs/*"
export readonly USB_ALL_FUNCTIONS_DIR="functions/*"

function usb_gadget_activate {
  ls /sys/class/udc > "${USB_DEVICE_PATH}/UDC"
  chmod 777 /dev/hidg0
  chmod 777 /dev/hidg1
}
export -f usb_gadget_activate
