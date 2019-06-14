#!/bin/bash

# Install the dependencies
/usr/bin/apt update
/usr/bin/apt upgrade
/usr/bin/apt install bluez-tools

# Copy the services to systemd
/bin/cp bluetooth.service /lib/systemd/system/bluetooth.service
/bin/cp blue-agent.service /etc/systemd/system/blue-agent.service

# Copy the PIN configuration file
/bin/cp pin.conf /etc/bluetooth/pin.conf
/bin/chmod 600 /etc/bluetooth/pin.conf

# Reload the systemd daemon and add the services
/bin/systemctl daemon-reload
/bin/systemctl enable blue-agent.service
/bin/systemctl start blue-agent.service

exit 0
