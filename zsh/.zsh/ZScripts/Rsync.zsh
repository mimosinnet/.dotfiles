#!/usr/bin/env zsh
# Compare the same filename in two hostnames
# Rsync hostname file [test | run | delete]

# Modules {{{
readonly lib="${0:a:h}/lib"
source $lib/connection.zsh
source $lib/ask.zsh
# }}}

# Positional Parameters {{{
readonly usage="
USAGE:
rsync hostname file       [*test | run | delete]
rsync hostname directory/ [*test | run | delete]
"
if [[ $# -lt 2 ]] ; then
  print $usage; exit
fi
readonly hostname=${1:?'Please, define hostname'}
readonly file=${2:?'Please, define file'}
readonly mode=${3:='test'}
# }}}

# Variables {{{
readonly modes=('test' 'run' 'delete')
readonly port=1964
readonly user=$USERNAME
readonly file_local=~+/$file
readonly file_remote="$user@$hostname:$file_local"
# }}}

# Check conditions {{{
if ! _connection $hostname $port
then
  print "No connection to $hostname"
  exit
fi

if (( ! $modes[(Ie)$mode] ))
then
  print "Select between 'test', 'run' or 'delete'"
  exit
fi

if [[ ! -e $file ]]
then
  print "File '$file' does not exist"
  exit
fi
# }}}

# set options {{{
case $mode in
  'run')
    opt=(-av)
    ;;
  'delete')
    opt=(-av --delete)
    ;;
  'test')
    opt=(-anv --delete)
    ;;
  *)
    print "Something wrong"
    exit
    ;;
esac
# }}}

_ask "$mode: rsync $opt $file_local $file_remote" \
  && rsync $opt $file_local $file_remote
