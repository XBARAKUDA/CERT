#!/bin/bash

# Fetch the public IP address using curl and store it in a variable
public_ip=$(curl -s ifconfig.me)

# Update the torrc file with the public IP address
cat << EOF | sudo tee -a /etc/tor/torrc
HTTPProxy $public_ip:443
HTTPSProxy $public_ip:443
EOF

# Open the torrc file in nano editor for verification and further modifications if needed
sudo nano /etc/tor/torrc
