# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Kirisakura-Kernel for the ROG Phone 5 aka Anakin by freak07 @ xda-developers
do.devicecheck=0
do.modules=1
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=12
supported.patchlevels=2022-03 -
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 750 750 $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes


# end ramdisk changes
ui_print " "; ui_print "Flashing Kirisakura-Kernel. Enjoy your device and have a nice day!";


write_boot;
## end boot install



# shell variables
block=/dev/block/bootdevice/by-name/vendor_boot;
is_slot_device=1;
ramdisk_compression=auto;

# reset for vendor_boot patching
reset_ak;


## AnyKernel vendor_boot install
split_boot;
# skip unpack/repack ramdisk since we don't need vendor_ramdisk access

flash_boot;
## end vendor_boot install

