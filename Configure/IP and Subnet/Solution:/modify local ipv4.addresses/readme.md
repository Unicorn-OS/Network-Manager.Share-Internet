# nmcli connection modify local ipv4.addresses
**Works!**

Guide: https://fedoramagazine.org/internet-connection-sharing-networkmanager/#:~:text=Changing%20the%20shared%20IP%20range

```
nic=eno2
nmcli connection add type ethernet ifname $nic ipv4.method shared con-name local
nmcli connection modify local ipv4.addresses 10.42.1.1/24
nmcli connection up local

test(){
  nmcli device
  ip a
}
```


sch: https://www.google.com/search?q=network+manager+sharing+dnsmasq+set+subnet+ip
