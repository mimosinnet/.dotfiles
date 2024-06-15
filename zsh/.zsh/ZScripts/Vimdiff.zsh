#!/bin/zsh

if [[ ${#} -lt 3 ]]
then
  print 'Usage:'
  print 'Vimdiff user server file_local [file_remote]'
  exit
fi

readonly user=${1:?'You must specify the user'}
readonly hostname=${2:?'You must specify the hostname'}
file_local=${3:?'You must specify the local file to vimdiff'}
file_remot=${4:='same'}

file_local=$(realpath -e $file_local)
if [[ -f $file_local ]]
then
  echo "Local  file = $file_local"
else
  echo "$file_local does not exist"
  exit
fi

[[ $file_remot == 'same' ]] \
  && file_remot="scp://$user@$hostname//$file_local" \
  || file_remot="scp://$user@$hostname//$file_remot"

echo "Remote file = $file_remot"
echo "vimdiff $file_local $file_remot"

vimdiff $file_local $file_remot
