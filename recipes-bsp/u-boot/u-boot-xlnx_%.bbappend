#UBOOT_VERSION = "v2018.02"
#XILINX_RELEASE_VERSION = "v2018.2"

#SRCREV = "21812b5fd359d8756d619a15b49b6079ae3f9f36"

#HAS_PLATFORM_INIT += " xilinx_zynqmp_zcu100_revC_defconfig"
FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
SRC_URI += " file://0001-Added-Ultra96-V2.patch "
