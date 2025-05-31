# AI Answer:
query: https://www.google.com/search?q=network+manager+sharing+dnsmasq+set+subnet+ip

guide: https://fedoramagazine.org/internet-connection-sharing-networkmanager/#:~:text=Changing%20the%20shared%20IP%20range

># AI Overview
>To configure NetworkManager to use a specific IP subnet with dnsmasq for shared connections, you'll need to modify the dnsmasq configuration files within the `/etc/NetworkManager/dnsmasq.d/` directory. You'll also need to enable the dnsmasq plugin within NetworkManager. 
>
>Here's a step-by-step guide:

>## 1. Enable dnsmasq Plugin:
>- Open the NetworkManager configuration file: sudo `nano /etc/NetworkManager/conf.d/00-use-dnsmasq.conf`
>- Add the following line: `[main] dns=dnsmasq`
>- Save and close the file.
>- Restart NetworkManager: `sudo service network-manager restart`
>
>## 2. Configure Subnet IP and Netmask:
>- Create a configuration file for dnsmasq: `sudo nano /etc/NetworkManager/dnsmasq.d/your_subnet.conf` (replace `your_subnet.conf` with a descriptive name)
>- Add the following configuration lines: 
>Code
>```
>    interface=eth0  (replace eth0 with your interface)
>    dhcp-range=192.168.1.2,192.168.1.254,24h  (replace 192.168.1.2, 192.168.1.254 with your desired IP range)
>    dhcp-option=3,192.168.1.1 (replace 192.168.1.1 with your gateway)
>```
>- Save and close the file.
>- If you need to assign static IP addresses to specific devices, you can add `dhcp-host` lines to the same configuration file. For example: 
>Code
>```
>    dhcp-host=52:54:00:a4:65:c8,192.168.1.170 (replace 52:54:00:a4:65:c8 with the MAC address of the device)
>```
>- Restart dnsmasq: `sudo systemctl restart dnsmasq.service`
>
>## 3. Configure NetworkManager's Shared Connection:
>- Use the `nmcli` command to configure the shared connection: `nmcli connection modify "connection_name" ipv4.dhcp-range 192.168.1.2,192.168.1.254`
>- Make sure to replace `"connection_name"` with the name of your shared connection and `192.168.1.2,192.168.1.254` with the IP range you want to share.
>- Restart the shared connection for the changes to take effect. 
>
>## Explanation:
>- `interface`: Specifies the network interface that dnsmasq should listen on. 
>- `dhcp-range`: Defines the range of IP addresses that will be assigned to clients using DHCP. 
>- `dhcp-option`: Specifies DHCP options to be sent to clients (e.g., the gateway, DNS servers). 
>- `dhcp-host`: Assigns a static IP address to a client based on its MAC address. 
>- `nmcli connection modify`: Used to modify NetworkManager connection settings. 
>
>By following these steps, you can configure NetworkManager to use a specific IP subnet with dnsmasq, allowing you to share your internet connection with other devices on your network using a custom IP range. 
