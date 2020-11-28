UBOOT_VERSION = "v2020.02"
UBOOTURI = "git://github.com/Xilinx/u-boot-xlnx.git;protocol=https"
UBRANCH = ""
SRCREV = "265d7a7ff8a82792344e8fb5c322e8f00d47e6cc"
LIC_FILES_CHKSUM = "file://README;beginline=1;endline=4;md5=744e7e3bb0c94b4b9f6b3db3bf893897"

LICENSE = "GPLv2+"

FILESEXTRAPATHS_append := "${THISDIR}/patches:"
SRC_URI += " file://0001-Added-DeviceTree-for-Ultra96V2.patch "
SRC_URI += " file://0002-Added-defconfig-for-Ultra96V2.patch "

do_compile () {
    echo "**************************************************"
    echo "defconfig"
    echo "**************************************************"
    oe_runmake ${UBOOT_MACHINE}
#    cat ${THISDIR}/configs/${UBOOT_DEFCONFIG}
    echo "CONFIG_DEFAULT_DEVICE_TREE=\"${UBOOT_DEVICETREE}\"" >> ${B}/.config
    echo "**************************************************"
    echo "make"
    echo "**************************************************"
    oe_runmake u-boot.elf
#    oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
    echo "**************************************************"
    echo END
    echo "**************************************************"

}

do_install () {
    echo "**************************************************"
    echo "install"
    echo "**************************************************"
        install -d ${D}/boot
        install -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
        ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}

    if [ -n "${UBOOT_ELF}" ]
    then
            install -m 644 ${B}/${UBOOT_ELF} ${D}/boot/${UBOOT_ELF_IMAGE}
            ln -sf ${UBOOT_ELF_IMAGE} ${D}/boot/${UBOOT_ELF_BINARY}
    fi

#    if [ -e ${WORKDIR}/fw_env.config ] ; then
#        install -d ${D}${sysconfdir}
#        install -m 644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config
#    fi

#    if [ -n "${SPL_BINARY}" ]
#    then
#            install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
#            ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
#    fi

    if [ -n "${UBOOT_ENV}" ]
    then
        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${D}/boot/${UBOOT_ENV_IMAGE}
        ln -sf ${UBOOT_ENV_IMAGE} ${D}/boot/${UBOOT_ENV_BINARY}
    fi

    if [ "${UBOOT_EXTLINUX}" = "1" ]
    then
        install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
    fi
    echo "**************************************************"
    echo "install end"
    echo "**************************************************"

}

FILES_${PN} = "/boot ${sysconfdir} ${datadir}"

do_deploy () {
    echo "**************************************************"
    echo "deploy"
    echo "**************************************************"
        install -d ${DEPLOYDIR}
        install -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
        cd ${DEPLOYDIR}
        rm -f ${UBOOT_BINARY} ${UBOOT_SYMLINK}
        ln -sf ${UBOOT_IMAGE} ${UBOOT_SYMLINK}
        ln -sf ${UBOOT_IMAGE} ${UBOOT_BINARY}

    if [ -n "${UBOOT_ELF}" ]
    then
            install -m 644 ${B}/${UBOOT_ELF} ${DEPLOYDIR}/${UBOOT_ELF_IMAGE}
            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_BINARY}
            ln -sf ${UBOOT_ELF_IMAGE} ${DEPLOYDIR}/${UBOOT_ELF_SYMLINK}
    fi


#    if [ -n "${SPL_BINARY}" ]
#    then
#            install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
#            rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
#            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_BINARYNAME}
#            ln -sf ${SPL_IMAGE} ${DEPLOYDIR}/${SPL_SYMLINK}
#    fi


    if [ -n "${UBOOT_ENV}" ]
    then
        install -m 644 ${WORKDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_IMAGE}
        rm -f ${DEPLOYDIR}/${UBOOT_ENV_BINARY} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_BINARY}
        ln -sf ${UBOOT_ENV_IMAGE} ${DEPLOYDIR}/${UBOOT_ENV_SYMLINK}
    fi

    if [ "${UBOOT_EXTLINUX}" = "1" ]
    then
        install -m 644 ${UBOOT_EXTLINUX_CONFIG} ${DEPLOYDIR}/${UBOOT_EXTLINUX_SYMLINK}
        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
        ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
    fi
    echo "**************************************************"
    echo "deploy end"
    echo "**************************************************"
}

