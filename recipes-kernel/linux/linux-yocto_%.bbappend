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

#LINUX_VERSION = "5.2.16"
#SRCREV_machine_ultra96v2 = "245691ce16c7ba20a45d9ad81449f62d73a1dd95"
#SRCREV_machine ?= "245691ce16c7ba20a45d9ad81449f62d73a1dd95"
LINUX_VERSION = "5.2.20"
SRCREV_machine_ultra96v2 = "70e8470b0416583d569a21b9bc713b8850a3eaf7"
SRCREV_machine ?= "70e8470b0416583d569a21b9bc713b8850a3eaf7"
KBRANCH_ultra96v2 = "v5.2/standard/xlnx-soc"
#KERNEL_DEVICETREE_ultra96v2 = "zynqmp-ultra96-v2.dtb"

FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
SRC_URI_append = " file://0001-Added-wilc-driver-for-Ultra96V2.patch "
SRC_URI_append = " file://0002-Added-DeviceTree-for-Ultra96V2.patch "

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI_append = " file://defconfig.cfg"
