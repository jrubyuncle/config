@echo off

echo.
echo net use x: \\vboxsvr\share        [in Guest Windows]
echo mount -t vboxsf share mount_point [in Guest Linux  ]
echo.
echo http://www.macbreaker.com/2015/01/virtualbox-yosemite-zone.html
echo VBoxManage modifyvm name_of_virtual_machine --cpuidset 00000001 000306a9 00020800 80000201 178bfbff

echo.
echo VBoxManage modifyhd  u12.04_desktop_32_1.vdi --resize 2097152 [2T = 2 * 1024 * 1024 M]
echo vboxmanage   clonehd home2.vdi home2a.vdi --format VDI  // clone hard disk

echo.
echo -------------------------------------------------------
echo add new vdi
echo refer to: http://blogger.gtwang.org/2012/02/linux.html
echo -------------------------------
echo 1. create vdi
echo      VBoxManage createhd --filename a.vdi --size   32768  // create 32 G dynamic hard disk, unit: mega
echo      VBoxManage createhd --filename a.vdi --size 2097152  //         2 T
echo 2. attach to storage tree of one virtual machine
echo 3. boot, type 'ls /dev/sd*' to see the device node of this new hard disk, say /dev/sdc
echo 4. fdisk
echo      sudo fdisk /dev/sdc
echo      press 'n'            // add new partition
echo      press 'p'            // primary
echo      press 'w'            // write
echo 5. format
echo      sudo mkfs -t ext4 /dev/sdc
echo 6. show uuid of new disk
echo      sudo blkid
echo      sudo blkid /dev/sdc
echo 7. modify /etc/fstab
echo      sudo vim /etc/fstab
echo      add new uuid and mount point, say /home2
echo 8. do the mount
echo      sudo mount /home2
echo 9. confirm
echo      type 'df' to show the mounted device
echo 10. do chown if necessary
echo       cd /
echo       chown -R guest1.guest1 /home2
echo 11. add new user
echo       type 'sudo adduser guest2'        // only add new user
echo       type 'sudo adduser guest2 sudo'   // add guest2 to sudo group
echo 12. change home directory for guest2
echo       ref: http://askubuntu.com/questions/250862/properly-modify-home-dir
echo       cd /home2
echo       sudo mkdir guest2
echo       sudo chown -R guest2:guest2 guest2
echo       sudo usermod -d /home2/guest2 guest2
echo.
echo [ gvim %~dp0%0.bat ]