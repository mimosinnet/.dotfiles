#!/usr/bin/env zsh

# Check conditions {{{
lib="${0:a:h}/lib"
source "$lib/mount_portage_check.zsh"


if _mount_portage_check
then
  print "portage shared mounted"
else
  print "you need to mount portage shares"
  exit
fi

# grep -q /boot /etc/mtab \
#   || mount /boot

if [[ $UID == 0 && $EUID == 0 ]]
then
  print 'You are running as root'
else
  print 'You are not running as root'
  exit
fi
# }}}

typeset -A description
typeset -A instruction

description=(
  1 'eix-update'
  2 'emerge world'
  3 'preserved-rebuild'
  4 'revdep-rebuild'
  5 'perl-cleaner'
  6 'eselect-cleanup'
  7 'eix-test-obsolete'
)
instruction=(
  1 'eix-update'
  2 'emerge -DNtuav --with-bdeps=y --backtrack=100 --autounmask-keep-masks=y @world'
  3 'emerge @preserved-rebuild'
  4 'revdep-rebuild'
  5 'perl-cleaner all'
  6 'eselect python cleanup'
  7 'eix-test-obsolete'
)

if [[ $#description != $#instruction ]]
then
  print "error in the elements of the arrays"
  exit
fi

for i in 1 2 3 4 5 6 7 
do
  print $description[$i]
  read -k 1 "answer?Would you like to run this command? (y/n/e) "
  case $answer in 
    [yY])
      echo "\n${(l(50)(-))}"
      eval $instruction[$i]
      ;;
    [nN])
      echo "\n${(l(50)(-))}" ;;
    [eE])
      echo "\n${(l(50)(-))}" 
      exit
      ;;
    *)
      print "\nYou have pressed $answer"
      exit
      ;;
  esac
done

# umount /boot
print "Remembre to umount mimoserver shares"
mount | grep mimory
