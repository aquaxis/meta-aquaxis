#FILES_${PN} += "files/*"
FILESEXTRAPATHS_append := "${THISDIR}/files/ultra96v2:"

SRC_URI = " file://psu_init_gpl.c"
SRC_URI += " file://psu_init_gpl.h"
