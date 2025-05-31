# Google Gemini
AI Overview
>To configure internet sharing with Network Manager and set a specific IP address, you'll need to enable the sharing feature and then configure the shared network's IP settings. Network Manager will typically assign a subnet like 10.42.0.0/24, but you can customize this if needed, according to Ask Ubuntu. 
>
>Steps:
>## 1. Enable Sharing:
>- Open Network Manager's settings.
>- Go to the connection settings for the interface you want to share from (e.g., your main WiFi or Ethernet connection).
>- Select "Shared to other computers" in the IPv4 Settings tab.
>
>## 2. Configure the Shared Network (Optional):
>- If you want to use a specific IP range, you'll need to manually add an IP address and netmask.
>- In the same IPv4 Settings tab, you can click "Add" and enter your desired IP address and netmask.
>- Network Manager will typically create a DHCP server on the shared interface. 
>
>## Example:
>Let's say you want to share your WiFi connection to a wired Ethernet connection and you want the shared network to use the 192.168.254.0/24 subnet. 
>- Enable sharing for your WiFi connection.
>- In the IPv4 settings for the Ethernet connection, add an IP address like 192.168.254.1 with a netmask of 255.255.255.0.
>
>## Important Notes:
>- Network Manager's default behavior is to automatically configure a subnet (like 10.42.0.0/24). 
>- You can use the nmcli command-line tool for more advanced configuration, [according to Ubuntu Core documentation](https://documentation.ubuntu.com/core/explanation/system-snaps/network-manager/how-to-guides/configure-shared-connections/index.html). 
>- If you need to assign static IP addresses to specific devices on the shared network, you'll need to use a DHCP server configuration tool like dnsmasq, [according to Ask Ubuntu](https://askubuntu.com/questions/278349/how-to-share-a-wireless-connection-through-ethernet-with-fixed-ip-addresses). 
>- Make sure your upstream router or ISP also has prefix delegation enabled if you are also sharing IPv6, [according to Ask Ubuntu](https://askubuntu.com/questions/1027677/networkmanager-how-to-share-internet-connection-with-ipv6).
