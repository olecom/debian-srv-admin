#!/bin/sh

set -e

# grub2 install


# grub install
echo '
root (hd0)
setup (hd0,1)
' | grub --batch --boot-drive=/dev/sdb --config-file=./grub/grub.conf --device-map=grub/device.map

exit



# deen hda3
hdd='(hd0,2)'
grub_conf=/boot/grub/menu.lst

test -r 'grub/menu.lst' -a -r 'grub/device.map' || exec echo '
Configuration not found. Exitting.
'

printf %s "
root $hdd
install $hdd/boot/grub/stage1 $hdd $hdd/boot/grub/stage2 p $grub_conf menu.lst
" | ./grub/grub --verbose --batch --device-map=grub/device.map
echo '
Done'

exit

