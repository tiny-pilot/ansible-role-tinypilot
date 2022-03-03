# USB Gadget Driver and `configfs`

We use `configfs` for configuring the USB gadget driver. Since `configfs` can feel unintuitive to work with, here is a quick overview of how it works, and what some of its quirks are.

See also the Linux kernel documentation:

- [`configfs` overview](https://www.kernel.org/doc/Documentation/filesystems/configfs/configfs.txt)
- [USB gadget driver](https://www.kernel.org/doc/Documentation/usb/gadget_configfs.txt)

## Introduction

`configfs` is a virtual file system provided by the Linux kernel. It is mounted underneath `/sys/kernel/config/`. The file system does not map to any persistent disk, though, but the entire structure is held in memory.

The basic idea behind `configfs` is to interact with kernel functionality via the file system APIs. So the file and directory entries in `configfs` are like a facade that’s wrapped around regular operating system APIs. Making changes to`configfs` files or folders is equivalent to making function calls (to system APIs), rather than merely persisting values somewhere.

Examples for possible operations:

```bash
# Set up a USB mouse.
mkdir -p functions/hid.mouse

# Make mass storage behave like a CD-ROM drive.
echo 1 > functions/mass_storage.0/lun.0/cdrom
```

## Virtual File System

The `configfs` virtual file system does **not** behave like a regular disk file system in many ways. Some examples:

- You cannot create arbitrary files or folders, but you can only create nodes at predefined places.
- When writing parameters into files, it might require the values to be in a certain format. (I.e., the parameters are essentially validated at write-time.)
- Changes are effectuated immediately and synchronously, just as if you had made calls to the respective system API directly, e.g. via C functions.
- Sometimes, operations must be carried out in a specific order that depends on internal logic rather than on conventional file system rules. E.g., when writing parameters into existing files, it might only work if that’s done in a specific order.
- When creating a new folder, the kernel might automatically and immediately set up a content structure of files and sub-folders. As mentioned above, that structure is fixed and can’t be changed.
- Folders can only be deleted via `rmdir`, not via `rm -rf`. That’s even true if the folder isn’t empty, in which case `rmdir` would usually fail.
- Folders can only be deleted when their configuration is not active. ?????
- Symlinks have special meaning, and creating or deleting them might have side-effects. Also, `configfs` nodes cannot be symlinked from outside the virtual file system.
- Some operations can only be carried out while the gadget is deactivated, or they only take effect after re-activating the gadget.
- Configuration changes that are made while the gadget is active might silently fail, i.e. they could leave the entire gadget in an inconsistent or broken state, despite the command returning exit code `0`.
