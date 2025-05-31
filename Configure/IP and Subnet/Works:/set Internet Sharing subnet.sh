sudo systemctl reload NetworkManager

echo "" | sudo tee /etc/NetworkManager/conf.d/00-use-dnsmasq.conf
