FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " https://github.com/linux4wilc/firmware/raw/master/wilc3000_ble_firmware.bin"
SRC_URI_append = " https://github.com/linux4wilc/firmware/raw/master/wilc3000_wifi_firmware.bin"

PACKAGES =+ "${PN}-wilc3000"

FILES_${PN}-wilc3000_append = " /lib/firmware/mchp/wilc3000_wifi_firmware.bin"
FILES_${PN}-wilc3000_append = " /lib/firmware/mchp/wilc3000_ble_firmware.bin"

BB_STRICT_CHECKSUM = "0"

do_install_append() {
   install -d ${D}/lib/firmware/mchp
   install -m 0644 ${WORKDIR}/wilc3000_ble_firmware.bin ${D}/lib/firmware/mchp/wilc3000_ble_firmware.bin
   install -m 0644 ${WORKDIR}/wilc3000_wifi_firmware.bin ${D}/lib/firmware/mchp/wilc3000_wifi_firmware.bin
}
