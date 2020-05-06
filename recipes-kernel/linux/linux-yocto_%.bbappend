# MicroBlaze is a uImage target, but its not called 'uImage' instead it is called 'linux.bin.ub'
python () {
    if d.getVar('KERNEL_IMAGETYPE', True).endswith('.ub'):
        d.setVar('DEPENDS', "%s u-boot-mkimage-native" % d.getVar('DEPENDS', True))
}

# Add meta-xilinx kmeta
FILESEXTRAPATHS_prepend := "${THISDIR}:"
SRC_URI_append = " file://xilinx-kmeta;type=kmeta;name=xilinx-kmeta;destsuffix=xilinx-kmeta"

# Zynq default generic KMACHINE
COMPATIBLE_MACHINE_zynq = "zynq"
KMACHINE_zynq = "zynq"

# ZynqMP default generic KMACHINE
COMPATIBLE_MACHINE_zynqmp = "zynqmp"
KMACHINE_zynqmp = "zynqmp"

# MicroBlaze KMACHINEs
KMACHINE_ml605-qemu-microblazeel = "qemumicroblazeel"
KMACHINE_s3adsp1800-qemu-microblazeeb = "qemumicroblazeeb"

# MicroBlaze default generic KMACHINE
KMACHINE_microblaze = "microblaze"
COMPATIBLE_MACHINE_microblaze = "microblaze"

# Default kernel config fragements for specific machines
KERNEL_FEATURES_append_kc705-microblazeel = " bsp/kc705-microblazeel/kc705-microblazeel.scc"

#KERNEL_DEVICETREE_ultra96v2 = "xilinx/zynqmp-ultra96-v2.dtb"

# Linux Kernel 5.2.x
LINUX_VERSION = "5.2.35"
SRCREV_machine_ultra96v2 = "b1941049fa9c5330858d0a1782283b54407e00ea"
SRCREV_machine ?= "b1941049fa9c5330858d0a1782283b54407e00ea"
KBRANCH_ultra96v2 = "v5.2/standard/xlnx-soc"

FILESEXTRAPATHS_prepend := "${THISDIR}/patches/v5.2.x:"
SRC_URI_append = " file://0001-Added-wilc-driver-for-Ultra96V2.patch "
SRC_URI_append = " file://0002-Added-DeviceTree-for-Ultra96V2.patch "

FILESEXTRAPATHS_prepend := "${THISDIR}/files/v5.2.x:"
SRC_URI_append = " file://defconfig.cfg"

# Linux Kernel 5.4.x
#LINUX_VERSION = "5.4.34"
#SRCREV_machine_ultra96v2 = "e35252705ac0e8c00aed29e3377bb36cd2f6184b"
#SRCREV_machine = "e35252705ac0e8c00aed29e3377bb36cd2f6184b"
#KBRANCH_ultra96v2 = "v5.4/standard/xlnx-soc"

#FILESEXTRAPATHS_prepend := "${THISDIR}/patches/v5.4.x:"
##SRC_URI_append = " file://0001-Added-wilc-driver-for-Ultra96V2.patch "
##SRC_URI_append = " file://0002-Added-DeviceTree-for-Ultra96V2.patch "

#FILESEXTRAPATHS_prepend := "${THISDIR}/files/v5.4.x:"
#SRC_URI_append = " file://defconfig.cfg"
