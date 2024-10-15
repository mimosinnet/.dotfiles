#!/usr/bin/env zsh

lib="${0:a:h}/lib"
source $lib/ask.zsh

# Variables {{{

grep -q /home/mimosinnet/Dades/Drive /etc/mtab || 
    { 
        print "ERROR: Share /home/mimosinnet/Dades/Drive not mounted"
        exit
    }

usage='
USAGE: 
    rclone.zsh [ OneDrive | Gdrive ]
'

drive='/home/mimosinnet/Dades/Drive'

if [[ $1 == 'OneDrive' ]]
then
    dir_loc="$drive/OneDrive"
    remote='OD'
    backup='Z_BackupOnedrive'
elif [[ $1 == 'Gdrive' ]]
then
    dir_loc="$drive/Gdrive"
    remote='GD'
    backup='Z_BackupGdrive'
else
    print $usage
    exit
fi

now=$(date +'%Y.%m.%d_%H.%M.%S')
dir_now=$PWD
dir_rem="$remote:${dir_now#$dir_loc}"
bkp="$backup/$now"
bkp_loc="$drive/$bkp"
bkp_rem="$remote:/$bkp"
exc_rem="--exclude=$remote:/$backup"

opt=('--progress' '--create-empty-src-dirs')
opt_loc=($opt "--backup-dir=$bkp_loc" )
opt_rem=($opt $exc_rem "--backup-dir=$bkp_rem" )

[[ $dir_loc == $dir_now ]] && opt_rem=($opt)

log_notice=(--log-level NOTICE)
log_error=(--log-level ERROR)


# echo $opt_loc, $dir_rem, $dir_now

if [[ $dir_now =~ $dir_loc ]]
then
    print "You are in $dir_loc tree\n"
else
    print "You are not in $dir_loc tree"
    exit
fi
# }}}

# que_vols: escollir opció {{{
que_vols() {
  quevols="9"
  while [[ $quevols =~ [^01234567] ]]
  do
    echo "\n"
    echo "----------------------------------------------"
    echo "Selecciona una de les opcions"
    echo "----------------------------------------------"
    echo "            DE Drive A Local"
    echo "----------------------------------------------"
    echo "1      Test DE Drive A Local"
    echo "2 Hard Test DE Drive A Local"
    echo "3 Sincronit DE Drive A Local"
    echo "----------------------------------------------"
    echo "            DE Local A Drive"
    echo "----------------------------------------------"
    echo "4      Test DE Local A Drive"
    echo "5 Hard Test DE Local A Drive"
    echo "6 Sincronit DE Local A Drive"
    echo "----------------------------------------------"
    echo "            ENTRE Drive i Local"
    echo "----------------------------------------------"
    echo "7 Sincronit ENTRE Drive i Local"
    echo "----------------------------------------------"
    echo "0 Sortir"
    echo "----------------------------------------------"
    read -k 1 "quevols?Què vols fer? [0-7] "
    echo "\n----------------------------------------------"
    echo "Has seleccionat l'opció $quevols"
    echo "\n----------------------------------------------"
  done

  return $quevols
}
# }}}

# 7 bisync: sincronització bidireccional. Veuri si funciona {{{
bisync() {
  echo "Has escollit sincronitzar bidireccionalment"
  echo "Revisem els resultats, doncs no està molt clar que funcioni"
  _ask "Provem resync amb --dry-run" && rclone -resync --dry-run $dir_rem $dir_now
  exit
  echo "rclone bisync --dry-run $notice --progress $dir_rem $dir_now"
  rclone bisync --dry-run $notice --progress $dir_rem $dir_now
  seguim || return 1
  echo "Fem la sincronització. Atenció: es borren els arxius a DriveDrive"
  seguim || return 1
  rclone bisync $notice --progress $dir_rem $dir_now
}
# }}}

# Drive sync {{{
drive_sync() {
  opcio=9
  while [[ $opcio -ne 0 ]]
  do
    que_vols
    opcio=$?

    case $opcio in
      0) print "Sortim. Que tinguis un boni dia!" ;;
      1) _ask "Sincronitzar DE Drive A Local amb --dry-run "          && rclone sync --dry-run $log_error  $opt_loc $dir_rem $dir_now ;;
      2) _ask "Sincronitzar DE Drive A Local amb --dry-run NOTICE"    && rclone sync --dry-run $log_notice $opt_loc $dir_rem $dir_now ;;
      3) _ask "Sincronitzar DE Drive A Local (esborra arxius locals)" && rclone sync           $log_error  $opt_loc $dir_rem $dir_now ;;
      4) _ask "Sincronitzar DE Local A Drive --dry-run"               && rclone sync --dry-run $log_error  $opt_rem $dir_now $dir_rem ;;
      5) _ask "Sincronitzar DE Local A Drive amb --dry-run NOTICE"    && rclone sync --dry-run $log_notice $opt_rem $dir_now $dir_rem ;;
      6) _ask "Sincronitzar DE Local A Drive (esborra arxius a Drive" && rclone sync           $log_error  $opt_rem $dir_now $dir_rem ;;
      7) bisync ;;
    esac 

  done
}
# }}}

drive_sync

# vim: tabstop=2
