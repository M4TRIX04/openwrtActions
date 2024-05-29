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

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git small https://github.com/kenzok8/small.git^8dfade7192162fade6d05b6447da4f7fe6b8bbe6' >>feeds.conf.default

# git luci on the latest hysteria 1.3.5 commit
# sed -i 's/luci.git/luci.git^084b82067ce7e9664fbf471597acce613521044e/g' feeds.conf.default
