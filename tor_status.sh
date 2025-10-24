#!/bin/sh

# 檢查 tor 服務是否處於 'active' 狀態
# 注意：tor.service 是許多基於 systemd 的 Linux 發行版中 Tor 的標準服務名稱。
STATUS=$(systemctl is-active tor.service 2>/dev/null)

if [ "$STATUS" = "active" ]; then
    echo "CONNECTED"
else
    # 檢查是否有任何名為 'tor' 的程序正在運行，作為備用檢查
    if netstat -ntlp | grep 9050 > /dev/null; then
        echo "CONNECTED"
    else
        echo "DISCONNECTED"
    fi
fi
