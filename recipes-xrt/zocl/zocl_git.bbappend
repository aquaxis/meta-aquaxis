#SUMMARY  = "Xilinx Runtime(XRT) driver module"
#DESCRIPTION = "Xilinx Runtime driver module provides memory management and compute unit schedule"

#LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE;md5=7d040f51aae6ac6208de74e88a3795f8"

BRANCH = "master"
#REPO ?= "git://github.com/Xilinx/XRT.git;protocol=https"
#BRANCHARG = "${@['nobranch=1', 'branch=${BRANCH}'][d.getVar('BRANCH', True) != '']}"
#SRC_URI = "${REPO};${BRANCHARG}"

PV = "2.2.0+git${SRCPV}"
SRCREV = "8f31e7633b20d8ebd67717adad8bc246e9bb5e19"

#S = "${WORKDIR}/git/src/runtime_src/core/edge/drm/zocl"

#inherit module
