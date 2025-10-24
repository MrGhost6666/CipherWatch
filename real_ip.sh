#!/bin/bash
# 注意: 這裡使用 /bin/bash 以確保所有功能都可用

# 你的真實網路介面名稱
DEFAULT_INTERFACE="wlo1"

# 檢查 wlo1 是否存在，並使用 pipe 組合 curl
# 這裡使用 ifconfig.me，它只返回 IP
REAL_IP=$(/usr/bin/curl -4 -s --interface "$DEFAULT_INTERFACE" ifconfig.me 2>/dev/null)

# 檢查 curl 是否成功獲取 IP 且 IP 地址格式正確
if [[ "$REAL_IP" =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
    echo "$REAL_IP"
else
    # 執行 curl 失敗或回傳非 IP 格式時
    echo "N/A (Curl Fail)"
fi