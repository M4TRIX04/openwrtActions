#!/bin/bash

set -euo pipefail

# Default LAN configuration
LAN_IP=${LAN_IP:-10.0.0.1/8}

# Validate the selected preset
case "$LAN_IP" in
    192.168.1.1/24|172.16.0.1/24)
        mask=255.255.255.0
        ;;
    10.0.0.1/8)
        mask=255.0.0.0
        ;;
    *)
        echo "Unsupported LAN IP: $LAN_IP" >&2
        exit 1
        ;;
esac

ip=${LAN_IP%/*}
file=package/base-files/files/bin/config_generate

# Modify LAN defaults only
python3 - "$file" "$ip" "$mask" <<'PY'
import sys
from pathlib import Path

path = Path(sys.argv[1])
ip, mask = sys.argv[2:]

source = path.read_text()

old_ip = 'lan) ipad=${ipaddr:-"192.168.1.1"} ;;'
new_ip = 'lan) ipad=${ipaddr:-"' + ip + '"} ;;'

old_mask = 'netm=${netmask:-"255.255.255.0"}'
new_mask = (
    old_mask
    + '\n\t\t\t[ "$1" != "lan" ] || '
    + 'netm=${netmask:-"' + mask + '"}'
)

if source.count(old_ip) != 1 or source.count(old_mask) != 1:
    sys.exit("Unexpected config_generate format; refusing to patch")

if ip != "192.168.1.1" or mask != "255.255.255.0":
    source = source.replace(old_ip, new_ip, 1)
    source = source.replace(old_mask, new_mask, 1)
    path.write_text(source)
PY

# Check shell syntax
sh -n "$file"

echo "Default LAN: $LAN_IP"
