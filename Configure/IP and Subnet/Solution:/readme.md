# Works!
## command: `nmcli connection modify local ipv4.addresses`
Guide: https://fedoramagazine.org/internet-connection-sharing-networkmanager/

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
