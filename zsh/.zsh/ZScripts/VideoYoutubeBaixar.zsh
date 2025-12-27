#!/usr/bin/env zsh

lib="${0:a:h}/lib"
source $lib/ask.zsh

readonly usage="
USAGE
  baixar: baixar url
  tallar: tallar arxiu_video inici(00:00:00) final(00:00:00)
"

# Variables {{{
readonly accions=(baixar tallar)
readonly accio=$1
(( $accions[(Ie)$accio] ))  || { print $usage ; exit }

[[ $# -gt 1 ]] || { print $usage; exit }

if [[ $accio == 'baixar' ]]
then
  [[ $# -eq 2 ]] || { print $usage; exit }
  readonly url=${2:?"url del vídeo: "}
  print "$accio $url"
elif [[ $accio == 'tallar' ]]
then
  [[ $# -eq 4 ]] || { print $usage; exit }
  readonly video=${2:?"Nom de l'arxiu de vídeo:  "}
  readonly inici=${3:?"Inici de tall (hh:mm:ss): "}
  readonly final=${4:?"Final de tall (hh:mm:ss): "}
  print "$accio $video $inici $final"
else
  print $usage
  exit
fi
# }}}

# _ffmpeg: incrustar subtitols {{{
function _ffmpeg() {
  local sub=$1
  local file=$(ls video.(mp4|webm|mkv))
  local ext=${file:e}
  # print "\n ffmpeg -i $file -vf subtitles=$sub out_video.$ext"
  ffmpeg -i $file -vf subtitles=$sub out_video.$ext
}
# }}}

# _subtitol: escull subtitol {{{
function _subtitol() {
  print "Hi ha ${#sub} subtítols: \n"
  local x=1
  for i in $sub
  do
    print "$x - $i"
    (( x++ ))
  done
  while [[ $nsub -lt 2 || $nsub -gt ${#sub} ]]
  do
    read -k "nsub?Quin subtítol vols? (0-${#sub}) "
    echo "\n"
  done
}
# }}}

# _incrustar: incrustar Subtitols {{{
function _incrustar() {
   sub=($(ls video.*.vtt))
   # Acció en funció del nombre de subtítols
   case ${#sub} in
     0) print "No hi ha arxiu de subtítols" ;;
     1) _ffmpeg $sub[1]                     ;;
     *) 
        nsub=0
        _subtitol
        _ffmpeg $sub[$nsub]
        ;;
   esac
}
# }}}

# Download {{{
function baixar() {
    print "opcions:
        1. Baixar Vídeo
        2. Baixar Vídeo auto-sub es
        3. Baixar Vídeo auto-sub en
        4. Baixar Vídeo sub es
        5. Baixar Vídeo sub en"
    read -k 1 "answer?Quina opció vols? (1-5) "
    echo "\n"
    case $answer in
        1)
            opt1=""
            opt2=""
            opt3=""
            ;;
        2)
            opt1='--write-auto-subs'
            opt2='--sub-langs'
            opt3='es'
            ;;
        3)
            opt1='--write-auto-subs'
            opt2='--sub-langs'
            opt3='en'
            ;;
        4)
            opt1='--write-subs'
            opt2='--sub-langs'
            opt3='es'
            ;;
        5)
            opt1='--write-subs'
            opt2='--sub-langs'
            opt3='en.*'
            ;;
        *)
            print 'Opció incorrecta'
            exit
            ;;
    esac
    # print "\n yt-dlp $opt1 $opt2 $opt3 -o 'video.%(ext)s' $url"
    yt-dlp $opt1 $opt2 $opt3 -o 'video.%(ext)s' $url

    if [[ $answer -ne 1 ]]
    then
      local answers=(y Y n N)
      while [[ $answers[(Ie)$incrustar] == 0 ]]
      do
        read -k 1 "incrustar?Vols incrustar subtítols? (y/n) "
        echo "\n"
        if [[ $incrustar == "y" ]]
        then
          _incrustar
        fi
      done
    fi
}
# }}}

function cut() {
    N_durada=$(( $(date --date=$final '+%s') - $(date --date=$inici '+%s') ))
    durada="00:$(date --date=@$N_durada '+%M:%S')"
    print "Video:  $video"
    print "Final:  $final"
    print "Inici:  $inici"
    print "Durada: $durada"
    ext=${video:e}
    echo "ffmpeg -ss $inici -i $video -t $durada cut_video.$ext"
}

if   [[ $accio == 'baixar' ]]
then
    baixar
elif [[ $accio == 'tallar' ]]
then
    print "Retallar Video"
    cut
fi

