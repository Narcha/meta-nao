FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "\
  file://0001-NAO-patches-softbank-congatec.patch file://0002-cgos-32-bit-softbank.patch \
  file://cmdline \
  file://fragment.cfg \
  "

PROVIDES += "cgos-mod"
RPROVIDES:${KERNEL_PACKAGE_NAME} += "cgos-mod"

do_install:append() {
  ln -s bzImage-${KERNEL_VERSION_NAME} ${D}/boot/vmlinuz.efi
  install -m 0644 ${WORKDIR}/cmdline ${D}/boot/cmdline
}

FILES:${KERNEL_PACKAGE_NAME} += "\
                                 /boot/vmlinuz.efi \
                                 /boot/cmdline \
                                "