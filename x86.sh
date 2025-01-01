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

# Modify package and luci to the latest hysteria 1.3.5 commit of immortal
sed -i 's/packages.git/packages.git^9714ef438711f7069d2e28f0c59733565ac8d6ef/g' feeds.conf.default \
&& sed -i 's/luci.git/luci.git^084b82067ce7e9664fbf471597acce613521044e/g' feeds.conf.default
