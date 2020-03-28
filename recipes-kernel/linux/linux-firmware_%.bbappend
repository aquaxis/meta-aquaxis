LICENSE = "GPLv2+"

#FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

#SRC_URI_append = " https://github.com/linux4wilc/firmware/blob/master/wilc3000_wifi_firmware.bin?raw=true"
#PACKAGES =+ "${PN}-wilc3000"

#FILES_${PN}-wilc3000 = "  \
# /lib/firmware/mchp/wilc3000_wifi_firmware.bin"
#

do_install_append() {
   install -d ${D}/lib/firmware
   install -d ${D}/lib/firmware/mchp
   wget https://github.com/linux4wilc/firmware/blob/master/wilc3000_wifi_firmware.bin?raw=true -O  wilc3000_wifi_firmware.bin
   install -m 0644 ${WORKDIR}/git/wilc3000_wifi_firmware.bin ${D}/lib/firmware/mchp/
   wget https://github.com/linux4wilc/firmware/blob/master/wilc3000_ble_firmware.bin?raw=true -O  wilc3000_ble_firmware.bin
   install -m 0644 ${WORKDIR}/git/wilc3000_ble_firmware.bin ${D}/lib/firmware/mchp/
}
