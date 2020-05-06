#!/bin/bash

if [ -f boot.bin ]; then
rm boot.bin
fi

#cp <VIVADO_DIR>/fsbl.elf .

cp ../pmutmp/deploy/images/zynqmp-pmu/pmu-firmware-zynqmp-pmu.elf ./pmufw.elf

cp ../tmp/deploy/images/ultra96v2/arm-trusted-firmware.elf ./bl31.elf
cp ../tmp/deploy/images/ultra96v2/u-boot.elf ./

bootgen -arch zynqmp -image build_boot.bif -o i BOOT.BIN -w on

cp ../tmp/deploy/images/ultra96v2/Image ./
cp ../tmp/deploy/images/ultra96v2/zynqmp-ultra96-v2.dtb ./

cp ../tmp/deploy/images/ultra96v2/core-image-minimal-ultra96v2.tar.gz ./
