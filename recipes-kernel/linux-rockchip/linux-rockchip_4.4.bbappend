
SRCREV = "e83084b53d4e02f5fd25aad25b42ffd3108c7f15"
KERNEL_DEFCONFIG = "lec-px30_config"

do_configure_prepend() {
    cp ${WORKDIR}/${KERNEL_DEFCONFIG} ${S}/arch/arm64/configs/
    cp ${S}/arch/arm64/configs/${KERNEL_DEFCONFIG} ${B}/.config
    cp ${S}/arch/arm64/configs/${KERNEL_DEFCONFIG} ${B}/../defconfig

}

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
        file://lec-px30_config \
        file://0001-Device-tree-for-LEC-PX30-A2.patch \
        file://0002-Added-ethernet-driver-support-for-LEC-PX30-A2.patch \
        file://0003-Added-mcp25xxfd-driver-support-for-LEC-PX30-A2.patch \
        file://0004-Added-LT9611-driver-support-for-LEC-PX30-A2.patch \
        file://0005-Modified-compatible-property-as-per-target-kernel-dt.patch \
        file://0006-Added-Sx150x-gpio-expander-suppport-for-LEC-PX30-A2.patch \
        file://0007-Added-SPI-chip-select-enable-disable-support-for-SPI.patch \
	file://0008-Modified-Boot-Arguments-to-mount-fileystem-from-SD-c.patch \
	file://0009-Added-Edimax-USB-WiFi-dongls-as-USB-evice.patch \
	file://0010-Kernel-Restart-Fix.patch \
	file://0011-Loading-BT-firmware-after-rootfs-mount.patch \
	file://0012-px30-ttyfiq2ttys.patch \
	file://0013-Fix-Sony-imx219-camera-sensor-greenish-colour-issue.patch \
"

