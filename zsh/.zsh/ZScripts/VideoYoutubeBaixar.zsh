#!/usr/bin/env zsh

# Inicialitza {{{
# Configuració de seguretat: parar si hi ha errors crítics, excepte en condicionals
setopt ERR_EXIT
setopt NO_UNSET
setopt PIPE_FAIL

lib="${0:a:h}/lib"
source $lib/ask.zsh
# funció _no_space
source $lib/NoSpace.zsh

readonly accions=(baixar tallar subs)
readonly accio=$1
readonly script='VideoYoutubeBaixar'
# }}}

# Funcions Auxiliars {{{

function _check_deps() {
    local deps=(ffmpeg yt-dlp)
    for dep in $deps; do
        if ! command -v $dep &> /dev/null; then
            print -u2 "Error: Manca la dependència '$dep'. Instal·la-la per continuar."
            exit 1
        fi
    done
}

function _usage() {
    print "Ús:"
    print "  $script baixar [url]"
    print "  $script tallar [arxiu_video] [inici HH:MM:SS] [final HH:MM:SS]"
    print "  $script subs   [url]"
}

# _ffmpeg: incrustar subtitols {{{
function _ffmpeg_sub() {
  local sub_file=$1
  # (Om) ordena per modificació, el més recent primer
  local videos=(video.(mp4|webm|mkv)(.Om)) 

  (( ${#videos} != 0 )) || { print "Error: No s'ha trobat cap fitxer de vídeo 'video.*' per processar." ; exit 1 }

  local input_video=$videos[1]
  local ext=${input_video:e}

  print "Incrustant subtítols: $sub_file -> $input_video..."
  # Utilitzem cometes per gestionar noms amb espais
  ffmpeg -i "$input_video" -vf "subtitles='$sub_file'" "out_$input_video.$ext"
}
# }}}

# _seleccionar_i_incrustar() {{{
function _seleccionar_i_incrustar() {
    local subs=(video.*.vtt(N)) 

    case ${#subs} in
        0) 
            print "No s'han trobat arxius de subtítols (.vtt)." ;;
        1) 
            print "S'ha trobat un únic arxiu de subtítol: ${subs[1]} \n"
            _ffmpeg_sub "${subs[1]}" 
            ;;
        *) 
            print "Hi ha ${#subs} subtítols disponibles. Selecciona'n un:"
            # El bucle 'select' és natiu i gestiona llistes llargues
            select s in "${subs[@]}"; do
                if [[ -n $s ]]; then
                    _ffmpeg_sub "$s"
                    break
                else
                    print "Opció invàlida."
                fi
            done
            ;;
    esac
}
# }}}

# }}}

# Funcions Principals {{{

# _accio_baixar() {{{
function _accio_baixar() {
    local url=$1
    local out_template="'%(title)s__%(id)s.%(ext)s'"

    print "Opcions de descàrrega:"
    print "  1. Només vídeo"
    print "  2. Auto-sub ES"
    print "  3. Auto-sub EN"
    print "  4. Sub oficial ES"
    print "  5. Sub oficial EN"
    read -k 1 "opt?Quina opció vols? (1-6) "
    echo "\n"

    case $opt in
        1) cmd_args='' ;;
        2) cmd_args=(--write-auto-subs --sub-langs es) ;;
        3) cmd_args=(--write-auto-subs --sub-langs en) ;;
        4) cmd_args=(--write-subs --sub-langs es) ;;
        5) cmd_args=(--write-subs --sub-langs 'en.*') ;;
        *) print "Opció incorrecta"; exit 1 ;;
    esac

    # Execució de yt-dlp
    print "Baixant $url"
    echo "yt-dlp ${cmd_args[@]} -o $out_template $url"
    yt-dlp "${cmd_args[@]}" -o "$out_template" "$url"
    # Om: ordena per modificació, el més recent primer
    local videos=(*.(mp4|webm|mkv)(.Om))
    [[ ${#videos} -gt 0 ]] || { print "Error: No s'ha trobat cap fitxer de vídeo descarregat." ; exit 1; }

    # Neteja del nom del fitxer descarregat
    _no_space "${videos[1]}"

    # Si no és l'opció 1, preguntem per incrustar
    if [[ $opt -ne 1 ]]; then
        local subtitols=(*.vtt(.Om))
        [[ ${#subtitols} -gt 0 ]] || { print "Error: No s'ha trobat cap fitxer de subtítols descarregat." ; exit 1; }
        _no_space "${subtitols[1]}"

        if read -q "?Vols incrustar subtítols? (y/n) "; then
            print "\n"
            _seleccionar_i_incrustar
        else
            print "\nSaltant incrustació."
        fi
    fi
}
# }}}

# _accio_tallar() {{{
function _accio_tallar() {
    local video=$1
    local inici=$2
    local final=$3

    local ext=${video:e}
    local output="cut_${video:r}.$ext"

    cmd=(ffmpeg -i "$video" -ss "$inici" -to "$final" -c copy "$output")
    
    print "Executant: ${cmd[*]}"
    "${cmd[@]}"
}
# }}}

# }}}

# Main
_check_deps
(( $accions[(Ie)$accio] ))  || { _usage ; exit }

case $accio in
    baixar)
        [[ $# -eq 2 ]] || { _usage; exit 1; }
        _accio_baixar "$2"
        ;;
    tallar)
        [[ $# -eq 4 ]] || { _usage; exit 1; }
        _accio_tallar "$2" "$3" "$4"
        ;;
    subs)
        [[ $# -eq 2 ]] || { _usage; exit 1; }
        yt-dlp -v --list-subs $2
        ;;
    *)
        _usage
        exit 1
        ;;
esac
