#!/usr/bin/env zsh

# source this script to be able to change directory

lib="${0:a:h}/lib"
source "$lib/printline.zsh"

# function _usage {{{
function _usage {
  _printline 60
  print "Instrucció: Duplicats.zsh 'patró d'arxiu'"
  _printline 60
}
# }}}

[[ $# = 1 ]] || { _usage; exit }

arxiu=${1:?'Arxius duplicats'}

[[ -d $arxiu ]] && { print "Directori $arxiu ja existeix"; exit  }

# ls ${arxiu}*(.)
mkdir $arxiu
mv ${arxiu}*(.) $arxiu
cd $arxiu
_printline 60
print "Duplicats: "
_printline 60
fdupes .
