#
# Copyright (C) 2020 Lean <coolsnowwolf@gmail.com>
#
# Copyright (C) 2021 ImmortalWrt
# <https://immortalwrt.org>
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=autocore
PKG_VERSION:=1
PKG_RELEASE:=31

include $(INCLUDE_DIR)/package.mk

define Package/autocore-arm
  TITLE:=ARM auto core script.
  MAINTAINER:=CN_SZTL
  DEPENDS:=@(TARGET_bcm27xx||TARGET_bcm53xx||TARGET_ipq40xx||TARGET_ipq806x||TARGET_mvebu||TARGET_sunxi||TARGET_rockchip) \
    +TARGET_bcm27xx:bcm27xx-userland \
    +TARGET_bcm53xx:nvram \
    +ethtool  \
    +TARGET_ipq40xx:lm-sensors
  VARIANT:=arm
endef

define Package/autocore-x86
  TITLE:=x86/x64 auto core loadbalance script.
  MAINTAINER:=Lean / CN_SZTL
  DEPENDS:=@TARGET_x86 +bc +lm-sensors +ethtool
  VARIANT:=x86
endef

define Package/autocore-arm/description
  Display more details info about the devices in LuCI.
endef

define Package/autocore-x86/description
  A USB autoconfig hotplug script.
endef

define Build/Compile
endef

define Package/autocore-arm/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/rpcd_luci $(1)/etc/rpcd_luci
	$(INSTALL_DATA) ./files/rpcd_luci-mod-status.json $(1)/etc/rpcd_luci-mod-status.json
	$(INSTALL_DATA) ./files/rpcd_10_system.js $(1)/etc/rpcd_10_system.js

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/090-cover-index_files $(1)/etc/uci-defaults/090-cover-index_files

	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/arm/cpuinfo $(1)/sbin/cpuinfo
	$(INSTALL_BIN) ./files/ethinfo $(1)/sbin/ethinfo
	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/status/include
	$(INSTALL_DATA) ./files/rpcd_21_ethinfo.js $(1)/www/luci-static/resources/view/status/include/21_ethinfo.js
endef


define Package/autocore-x86/install
	$(INSTALL_DIR) $(1)/etc
	$(INSTALL_BIN) ./files/rpcd_luci $(1)/etc/rpcd_luci
	$(INSTALL_DATA) ./files/rpcd_luci-mod-status.json $(1)/etc/rpcd_luci-mod-status.json
	$(INSTALL_DATA) ./files/rpcd_10_system.js $(1)/etc/rpcd_10_system.js

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/x86/autocore $(1)/etc/init.d/autocore

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/090-cover-index_files $(1)/etc/uci-defaults/090-cover-index_files

	$(INSTALL_DIR) $(1)/sbin
	$(INSTALL_BIN) ./files/x86/cpuinfo $(1)/sbin/cpuinfo
	$(INSTALL_BIN) ./files/ethinfo $(1)/sbin/ethinfo

	$(INSTALL_DIR) $(1)/www/luci-static/resources/view/status/include
	$(INSTALL_DATA) ./files/rpcd_21_ethinfo.js $(1)/www/luci-static/resources/view/status/include/21_ethinfo.js
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/admin_status/index/
	$(INSTALL_DATA) ./files/x86/nvme_status.htm $(1)/usr/lib/lua/luci/view/admin_status/index/
endef

$(eval $(call BuildPackage,autocore-arm))
$(eval $(call BuildPackage,autocore-x86))
