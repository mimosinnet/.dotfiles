#!/usr/bin/env zsh

lib="${0:a:h}/lib"
source "$lib/printline.zsh"

ajuda="Instrucció: Alarma.zsh ['hora:minut' | temps[mhds] ] Recordatori
  Exemples:
      Alarma.zsh 10:20 Recordatori
      Alarma.zsh 3m    Recordatori (d'aquí 3 minuts)
      m: minuts  h: hores  d: dies  s: setmanes
"

# function _usage {{{
function _usage {
  _printline 60
  print -u2 $ajuda
  _printline 60
}
# }}}

# Ha d'haver-hi dos arguments com a mínim
[[ $# -gt 1 ]] || { _usage ; exit 1 } 

time_str="$1"
recordatori="$@"

if [[ "$time_str" =~ ^([0-9]+):([0-9]+)$ ]]; then
  # Extract matched groups into variables
  hora=$match[1]
  minut=$match[2]
  [[ $hora  -gt 24 ]] && { print -u2 'No pot ser més de 24 hores' ; exit 1 }
  [[ $minut -gt 60 ]] && { print -u2 'No pot ser més de 60 minuts'; exit 1 }
  at_string="$hora:$minut"
elif [[ "$time_str" =~ ^([0-9]+)([mhds])$ ]]
then
  temps=$match[1]
  unitat=$match[2]
  uni_string=''
  case $unitat in
    m) uni_string='minutes' ;;
    h) uni_string='hours'   ;;
    d) uni_string='days'    ;;
    s) uni_string='weeks'   ;;
    *) { print -u2 'Hi ha un error'; exit 1 } ;;
  esac
  at_string="now + $temps $uni_string"
else { _usage ; exit 1 }
fi

at $at_string <<COMMAND
gxmessage -bg black -fg red -center -ontop -sticky -wrap -title "Alarma" "Recordatori: $recordatori"
COMMAND
