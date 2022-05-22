#!/usr/bin/env bash

# fetch anykernel3 sources
git clone \
  https://github.com/osm0sis/AnyKernel3.git \
  /usr/src/anykernel3

# create config
cp -fv /common/configs/anykernel.sh /usr/src/anykernel3/anykernel.sh

# create ramdisk dir structure
mkdir -p /usr/src/anykernel3/ramdisk/overlay.d/sbin
cp -fv /common/configs/init.kirisakura.rc /usr/src/anykernel3/ramdisk/overlay.d/
cp -fv /common/configs/init.kirisakura.sh /usr/src/anykernel3/ramdisk/overlay.d/sbin/
chmod +x /usr/src/anykernel3/ramdisk/overlay.d/sbin/init.kirisakura.sh

# remove placeholder dirs
rm -rf /usr/src/anykernel3/{patch,modules/system/lib}

# create modules directory structure
mkdir -p /usr/src/anykernel3/modules/system/vendor/{bin,etc/perf,lib/modules}
cp -fv /common/configs/perfboostsconfig.xml /usr/src/anykernel3/modules/system/vendor/etc/perf/
find /src/out -name '*.ko' -exec cp -v '{}' /usr/src/anykernel3/modules/system/vendor/lib/modules \;

# generate dtb in AK3 dir
cat $(find . -type f -name '*.dtb' 2>/dev/null| sort) > /usr/src/anykernel3/dtb

# copy kernel image and dtb to zip
cp -v /src/out/arch/arm64/boot/dtbo.img /usr/src/anykernel3/dtbo.img
cp -v /src/out/arch/arm64/boot/Image.gz /usr/src/anykernel3/Image.gz


# cleanup previous zips
rm -f /out/*.zip

# create zip file
pushd /usr/src/anykernel3
  zip -r9 /out/kernel.zip * -x .git README.md *placeholder
popd

# fix permissions
chmod 777 /out/kernel.zip
