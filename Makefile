# Copyright (C) 2016 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-serverchan
PKG_VERSION:=1.34
PKG_RELEASE:=5

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SECTION:=luci
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  DEPENDS:=+iputils-arping +curl 
  TITLE:=LuCI support for serverchan
  PKGARCH:=all
endef

define Build/Compile
endef

define Package/smartdns/conffiles
/etc/config/serverchan
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/etc/init.d $(1)/usr/bin/serverchan $(1)/etc/config $(1)/usr/lib/lua/luci
	$(CP) ./luci/* $(1)/usr/lib/lua/luci
	$(INSTALL_CONF) ./files/etc/config/serverchan $(1)/etc/config
	$(INSTALL_BIN) ./files/etc/init.d/serverchan $(1)/etc/init.d
	$(INSTALL_BIN) ./files/usr/bin/serverchan/serverchan $(1)/usr/bin/serverchan
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
