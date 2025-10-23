#!/usr/bin/env zsh

dirs_auto=(
    /
    /home/mimosinnet
    /home/mimosinnet/Baixades
    /home/mimosinnet/Dades/IntercanviWin
    /home/mimosinnet/Dades/Drive
    /home/mimosinnet/Zotero
)
dirs_noauto=(
    /home/mimosinnet/Dades/Imatges
    /home/mimosinnet/Dades/VirtualBox/Android
    /mnt/AlpineLinux
    /mnt/bkp/baixades
    /mnt/bkp/presentacions
    /mnt/bkp/zotero
    /mnt/Documents
    /mnt/MultiMedia

)
line="============================================================================"

function _df() {
    df -xh --output=pcent,target $1 | grep '[0-9]%'
}

print 'Directoris auto:'
for i ($dirs_auto)
do
    _df $i
done


print "\nDirectoris noauto:"
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
