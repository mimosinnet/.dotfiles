#!/usr/bin/env zsh

dirs_auto=(
    /
    /home/mimosinnet/Baixades
    /home/mimosinnet/Dades/IntercanviWin
    /home/mimosinnet/Zotero
)
dirs_noauto=(
    /home/mimosinnet/Dades/Imatges
    /home/mimosinnet/Dades/Backup/bkp_zotero
    /home/mimosinnet/Dades/Backup/bkp_presentacions
    /home/mimosinnet/Dades/VirtualBox/Windows10
    /mnt/AlpineLinux
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
