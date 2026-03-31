#!/usr/bin/env zsh

dirs_auto=(
    /
    /mnt/chroot
    /home/mimosinnet/Dades/Documents
)
dirs_noauto=(
    /mnt/BKP/bkp_documents
    /mnt/BKP/bkp_chroot
    /mnt/USB/7AC66ED8C66E93E3
)
line="============================================================================"

function _df() {
    df -h --output=pcent,target $1 | grep '[0-9]%'
}

for i ($dirs_auto)
do
    _df $i
done

for i ($dirs_noauto)
do
    if grep -q $i /etc/mtab
    then
        _df $i
    else
        mount $i
        _df $i
        umount $i
    fi
done
