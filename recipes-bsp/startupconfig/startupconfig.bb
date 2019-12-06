SUMMARY = "Adlink startup script"
DESCRIPTION = "This is a system daemon implementing the Adlink startup script"
LICENSE = "CLOSED"


SRC_URI = "\
    file://adlinkstartup \
    file://adlinkstartup.service \
"

inherit pkgconfig systemd 

SYSTEMD_PACKAGES += "${PN}"
SYSTEMD_SERVICE_${PN} = "adlinkstartup.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"

INITSCRIPT_NAME = "adlinkstartup"
INITSCRIPT_PARAMS = "start 99 2 3 4 5 . stop 19 0 1 6 ."

USERADD_PACKAGES = "${PN}"
GROUPADD_PARAM_${PN} = "root"

do_install() {
    install -d "${D}${sysconfdir}/init.d"
    install -m 0755 "${WORKDIR}/adlinkstartup" "${D}${sysconfdir}/init.d/adlinkstartup"

    if ${@bb.utils.contains("DISTRO_FEATURES", 'systemd', 'true', 'false', d)}; then

       install -d "${D}${sbindir}"
       install -m 0755 "${WORKDIR}/adlinkstartup" "${D}${sbindir}/adlinkstartup"

       install -d "${D}${systemd_unitdir}/system"
       install -m 0644 "${WORKDIR}/adlinkstartup.service" "${D}${systemd_unitdir}/system/adlinkstartup.service"
    fi
}

FILES_${PN} += "\
    ${systemd_unitdir}/system-preset \
    ${systemd_unitdir}/system/adlinkstartup.service \
"


