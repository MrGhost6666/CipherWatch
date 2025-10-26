# CipherWatch: The Vigilant Desktop Monitor
![Screenshot](https://github.com/MrGhost6666/CipherWatch/blob/main/pic/CipherWatch.png) ![Screenshot2](https://github.com/MrGhost6666/CipherWatch/blob/main/pic/CipherWatch-2.png) ![Screenshot3](https://github.com/MrGhost6666/CipherWatch/blob/main/pic/CipherWatch-3.png)

These are the config files I wrote for the Linux system monitoring program "Conky."
They include System, CPU, RAM, Disk, VPN, Tor, and notebook battery information.

This conky config is modified based on TeejeeTech.

## DESCRIPTION
This is a highly customized configuration designed for users who prioritize system transparency and network security. It goes beyond standard monitoring by integrating real-time checks for privacy tools.

**Key Features Include:**

1.  **VPN & Tor Status Monitoring:**
    * Dedicated sections for **VPN** and **Tor** connections show the active status (CONNECTED/DISCONNECTED) and the current public $\text{IP}$ address for each tunnel.
    * *Quick Disconnect Response:* Utilizes highly responsive $\text{shell}$ scripting to instantly reflect VPN disconnections, minimizing potential $\text{IP}$ leaks.

2.  **Adaptive Hardware Alarms (CPU & Battery):**
    * **CPU Load** and **Core Temperature** fields feature dynamic color-coding. When **load** or **temperature** exceeds predefined high thresholds, the displayed text automatically changes to **Red** for immediate visual alerting.
    * **Battery Level** uses a visual tiered alarm: The percentage changes color from Green ($\geq 51\%$) to Yellow ($\geq 20\%$) and finally to Red (low power), providing clear status and remaining time for mobile users.

3.  **Conditional Real IP Visibility:**
    * A unique privacy feature that displays your **Real IP Address** only when a VPN or Tor connection is active, ensuring your actual IP remains hidden and unknown to the monitor during unsecured periods.

4.  **Comprehensive System & Network Stats:**
    * Full-spectrum monitoring of standard system metrics: **CPU frequency**, **RAM usage**, and **Disk space**.
    * Detailed network statistics including **Default Gateway**, **Local IP**, and **Up/Down speeds** and totals for your primary wireless interface ($\text{wlo1}$).

**CipherWatch** provides a complete, fast, and security-aware view of your Linux system, ensuring you always know the status of your connection and the performance of your hardware.
This is a highly customized configuration designed for users who prioritize system transparency and network security. It goes beyond standard monitoring by integrating real-time checks for privacy tools.

## INSTALL GIT & CONKY

To download and use or modify on your Linux box, you will need to install git if it is not already provided by your distribution.

Debian/Ubuntu/Mint and variants: 
```bash
sudo apt update
sudo apt install git.
```
You will also need to install `conky`. 

Debian/Ubuntu/Mint and variants: 
```bash
sudo apt install conky-all
```
If you are a newb and need GUI for easy operation.

Debian/Ubuntu/Mint and variants: 
```bash
sudo apt install conky-manager2
```
## DOWNLOAD & USE
Then type the following into the same terminal or just copy and paste (root powers not needed):
```bash  
 git clone https://github.com/MrGhost6666/CipherWatch 
 ```
You need to move `CipherWatch` to the `.conky` directory. **You need to change `yourusername` in the path to your username.**
```bash  
 mv CipherWatch /home/yourusername/.conky/
 ```
 
You need to give permissions to `connection_status.sh`, `tor_stauts.sh`, `vpn_stauts.sh` and `real_ip.sh` to run properly.
```bash  
chmod +x ~/.conky/CipherWatch/connection_status.sh
chmod +x ~/.conky/CipherWatch/tor_status.sh 
chmod +x ~/.conky/CipherWatch/vpn_status.sh
chmod +x ~/.conky/CipherWatch/real_ip.sh
 ```
### About NETWORK
I'm using a **wireless network**, so I've set the default detection gateway to `wlo1`.
If you're using **Ethernet**, your gateway might be `eth0`. You can check your network and VPN gateways by running `ip a` or `ip link show` in a terminal.

If you are not using the wlo1 gateway, you need to modify the `CipherWatch` and `real_ip.sh` file.

There are six `wlo1` to modify. In rows 96, 98, 99, and 104, modify the `wlo1` to your network gateway.

And `real_ip.sh` **DEFAULT_INTERFACE="wlo1"** The wlo1 in this place should also be changed to your gateway.


### About VPN GATEWAY
The default VPN is `ProtonVPN`, so the detected VPN gateway is `proton0`. If you are not using ProtonVPN but a different VPN service, you will need to modify the `vpn_status.sh` and `connection_status.sh` file.

```bash  
VPN_INTERFACE="proton0"
               ^^^^^^^ Change your VPN GATEWAY
 ```
