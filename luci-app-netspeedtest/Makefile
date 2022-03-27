#
# Copyright (C) 2020-2021 sirpdboy <herboy2008@gmail.com>
# The LuCI Network diagnosis and speed test <https://github.com/sirpdboy/NetSpeedTest>
# This is free software, licensed under the GNU General Public License v3.
# 

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-netspeedtest

PKG_VERSION:=1.7
PKG_RELEASE:=20220327

LUCI_TITLE:=LuCI Support for netspeedtest
LUCI_DEPENDS:=+python3 +iperf3 +python3-speedtest-cli
LUCI_PKGARCH:=all




include ../../luci.mk

# call BuildPackage - OpenWrt buildroot signature
