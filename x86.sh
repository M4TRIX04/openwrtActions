#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Add passwall packages and luci sources
#sed -i '1i\src-git passwall_packages https://github.com/M4TRIX04/openwrt-passwall-packages.git;main' feeds.conf.default \
#&& sed -i '1i\src-git passwall_luci https://github.com/M4TRIX04/openwrt-passwall.git;main' feeds.conf.default
