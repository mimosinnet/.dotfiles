#!/usr/bin/env zsh

lib="${0:a:h}/lib"
source "$lib/printline.zsh"

ajuda="Instrucció: Gif_2_mp4.zsh arxiu.gif"

# function _usage {{{
function _usage {
  _printline 60
  print -u2 $ajuda
  _printline 60
}
# }}}

# Ha d'haver-hi un argument 
[[ $# -eq 1 ]] || { _usage ; exit 1 } 

in=$1
ext=$in:e
nom=$in:r
out="$nom.mp4"

[[ -e $in  ]] || { print "ATENCIÓ: L'arxiu - $in  - no existeix" ; exit 1  }

_printline 60
print "Convertir $in a $out"

[[ -e $out ]] && { print "ATENCIÓ: L'arxiu - $out - ja existeix" ; _printline 60 ; exit 1  }

ffmpeg -i $in -movflags faststart -pix_fmt yuv420p -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" $out

_printline 60
print "Creat arxiu $out"
_printline 60
