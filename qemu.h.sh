#!/bin/bash

echo
echo "http://askubuntu.com/questions/19430/mount-a-virtualbox-drive-image-vdi"

echo
echo "Basically, you'll have to install qemu if needed:"
echo "  sudo apt-get install qemu"

echo
echo "Then you'll need to load the network block device module:"
echo "  sudo rmmod nbd"
echo "  sudo modprobe nbd max_part=16"

echo
echo "Attach the .vdi image to one of the nbd you just created:"
echo "  sudo qemu-nbd -c /dev/nbd0 drive.vdi"

echo
echo "Now you will get a /dev/nbd0 block device, along with several /dev/nbd0p* partition device nodes."
echo "  sudo mount /dev/nbd0p1 /mnt"

echo
echo "Once you are done, unmount everything and disconnect the device:"
echo "  sudo qemu-nbd -d /dev/nbd0"

echo
echo "[$0]"
