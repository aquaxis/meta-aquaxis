#LINUX_VERSION = "4.14"
#XILINX_RELEASE_VERSION = "v2018.2"
#KBRANCH = "xlnx_rebase_v4.14"
#SRCREV = "ad4cd988ba86ab0fb306d57f244b7eaa6cce79a4"

FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
SRC_URI += " file://0001-Added-Ultra96-V2.patch "

