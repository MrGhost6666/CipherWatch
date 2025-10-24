VPN_INTERFACE="proton0"
VPN_STATUS="DISCONNECTED"
if ip link show "$VPN_INTERFACE" | grep -q "UP" && ip addr show dev "$VPN_INTERFACE" | grep -q "inet "; then
    VPN_STATUS="CONNECTED"
fi

# ... 接下來是 TOR 狀態檢查 ...

# 3. 判斷組合狀態並輸出
if [ "$VPN_STATUS" = "CONNECTED" ] || [ "$TOR_STATUS" = "CONNECTED" ]; then
    echo "VPN_OR_TOR_CONNECTED"
else
    echo "DISCONNECTED"
fi