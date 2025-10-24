#!/bin/sh

VPN_INTERFACE="proton0"

# 1. 檢查介面是否存在且處於 UP 狀態 (基本檢查)
# 2. 檢查該介面是否已被分配 IP 地址 (更可靠的檢查)
if ip link show "$VPN_INTERFACE" | grep -q "UP" && ip addr show dev "$VPN_INTERFACE" | grep -q "inet "; then
    echo "CONNECTED"
    exit 0
else
    echo "DISCONNECTED"
    exit 1
fi