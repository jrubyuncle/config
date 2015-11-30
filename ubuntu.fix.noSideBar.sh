#!/bin/bash

#
# http://askubuntu.com/questions/477110/14-04-lts-no-dash-launcher-after-update-through-software-updater
#

sudo service lightdm stop
rm ~/.config/dconf/user
sudo service lightdm start

echo ""
echo "[$0]"

