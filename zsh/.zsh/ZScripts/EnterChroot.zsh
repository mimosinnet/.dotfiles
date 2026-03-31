#!/usr/bin/env zsh
mount --types proc /proc /mnt/chroot/ryzen5/proc 
read -s -k '?Press any key to continue.'
mount --rbind /sys /mnt/chroot/ryzen5/sys 
read -s -k '?Press any key to continue.'
mount --rbind /dev /mnt/chroot/ryzen5/dev
read -s -k '?Press any key to continue.' 
mount --bind /run /mnt/chroot/ryzen5/run
read -s -k '?Press any key to continue.' 
chroot /mnt/chroot/ryzen5 /bin/bash
