# Alias Actius {{{
alias -r BaixaG='raku /home/mimosinnet/Dades/Scripts/Actius/Baixa.raku generatech'
alias -r BaixaP='raku /home/mimosinnet/Dades/Scripts/Actius/Baixa.raku psicosocial'
alias -r Files="$Actius/Files.zsh"
# }}}

# Alias Aplicacions {{{
# alias -r lynx-proxy='lynx -cfg=~/.config/lynx/lynx-proxy.cfg http://config.privoxy.org/'
alias -r lynx-proxy='export http_proxy=http://127.0.0.1:8118 && lynx http://config.privoxy.org/'
alias -r git='LC_ALL=en_US.UTF-8 git'
alias -r NoSpace="$Actius/NoSpace.zsh"
# }}}

# Alias Backup {{{
alias -r BackupZotero="$Actius/Segur.zsh \
  7096e628-33f4-4543-9515-fca1ace7b4e1 \
  /home/mimosinnet/Zotero \
  /home/mimosinnet/Dades/Backup/bkp_zotero \
  run"
alias -r BackupPresentacions="$Actius/Segur.zsh \
  2f747fed-b47e-4259-93bd-7abeb6272001 \
  /home/mimosinnet/Dades/IntercanviWin/Presentacions \
  /home/mimosinnet/Dades/Backup/bkp_presentacions \
  run"
# }}}

# Alias Baixar Videos {{{
# alias youtube-dl --write-auto-sub --sub-lang en "youtube.com/watch?v=pGUxQmRNhtk"
# alias ffmpeg -i video.webm -vf subtitles=subtitle.vtt video_out.webm
# }}}

# Alias disk space {{{
alias -r DG='du -hd 1 | grep G'
alias -r DM='du -hd 1 | grep M'
# }}}

# Alias emerge {{{
alias -r  E='emerge -Gav'
alias -r E1='emerge -1Gav'
alias -r Eu='emerge -1GDNtuav'
alias -r Ec='emerge -1cav'
alias -r EC='emerge -1Cav'
alias -r EixUse='eix --only-names --installed-with-use' 
alias -r EixPack='eix --only-names -I'
# }}}

# Alias Flatpak {{{
alias -r Jamovi='flatpak run org.jamovi.jamovi'
alias -r LibreOffice='flatpak run org.libreoffice.LibreOffice'
alias -r Obsidian='flatpak run md.obsidian.Obsidian'
# Flathub: Opcions del platpak 
alias -r FlatHub='flatpak run com.github.tchx84.Flatseal'
# }}}

# Alias Interface {{{
alias -r XarxaSegura="$Actius/Xarxa.zsh segur"
alias -r XarxaRapida="$Actius/Xarxa.zsh rapid"
# }}}

# Alias Mail {{{
alias -r Nous='watch Mails new' Vells='watch Mails cur'
# }}}

# Alias Mount {{{
alias -r Mount='mount | grep nfs && mount | grep vga'
# alias -r MountDocuments='RunRepo   Mount phenom /home/mimosinnet/Dades/Documents'
alias -r MountMultimedia="$Actius/MountFolder.zsh /mnt/MultiMedia"
alias -r MountVirtualbox="$Actius/MountFolder.zsh /home/mimosinnet/Dades/VirtualBox"
alias -r MountZoteroBkp=" $Actius/MountFolder.zsh /home/mimosinnet/Dades/Backup/bkp_zotero"
# }}}

# Alias MoveLast {{{
alias -r MoveLastBaixades="$Actius/MoveLast.zsh Baixades"
alias -r MoveLastScreenShots="$Actius/MoveLast.zsh Dades/ScreenShots"
# }}}

# Alias Perl5 {{{
alias -r 5='perl'
alias -r 5c='perl -c'
alias -r 5e='perl -e'
# Test when inside the /t directory
alias -r 5t='perl -I ../lib'
alias -r T5='PERL5LIB=lib prove'
# }}}

# Alias Raku {{{
alias -r 6='raku'
alias -r 6c='raku -c'
alias -r 6e='raku -e'
# Test when inside the /t directory
alias -r 6t='raku -I ../lib'
alias -r Test='RAKUDOLIB=lib prove6'
# }}}

# Alias Repos {{{
# Absolute path to be able to be run by root
alias -r Actualitza="$Actius/Actualitza.zsh"
alias -r Correu='RunRepo Correu'
alias -r Kernel_Update="$Actius/KernelUpdate.zsh"
alias -r Mails='RunRepo Mails'
alias -r MountPortage="$Actius/MountPortage.zsh"
alias -r MuttAliases='RunRepo MuttAliases'
alias -r Rsync="$Actius/Rsync.zsh"
# Per testejar com funcionen els parametres en les zfunc
alias -r Test='RunRepo Test'
alias -r Vimdiff="$Actius/Vimdiff.zsh"
alias -r Vimdiff_Psicosocial='RunRepo Vimdiff_Server'
# }}}

# Alias Servidors {{{
#alias -r windows="TERM='xterm' ssh mimosinnet@windows11w"
alias -r mimomedia="$Actius/Entra.zsh mimomedia"
alias -r fx="$Actius/Entra.zsh fx"
alias -r mimoserver="$Actius/Entra.zsh mimoserver"
alias -r phenom="$Actius/Entra.zsh phenom"
alias -r mimomini12w="$Actius/Entra.zsh mimomini12w"
alias -r mimofeina12w="$Actius/Entra.zsh mimofeina12w"
alias -r nisomim12w="$Actius/Entra.zsh nisomim12w"
alias -r mimory="$Actius/Entra.zsh mimory"
# }}}

# Alias Shell Commands {{{
# alias -r rtorrent='ssh rtorrent@mimoalf'
alias -r Cating='cat /home/mimosinnet/Dades/Documents/Personal/Finances/ING_ibex35.txt'
alias -r Colors="print 'PrintColors to print colors' &&  source /home/mimosinnet/.zfunc/PrintColors.zsh"
alias -r Convert="convmv -f ISO-8859-1 -t UTF-8"
alias -r DF="$Actius/DF.zsh"
alias -r Dir='ls -d *(/)' # Llista directoris
alias -r Viming='vim /home/mimosinnet/Dades/Documents/Personal/Finances/ING_ibex35.txt'
alias -r bc='bc /home/mimosinnet/Dades/Scripts/bc/*.bc'
alias -r emerge='emerge --getbinpkgonly --usepkgonly'
alias -r feh='feh --edit --auto-zoom --full-screen -d'
alias -r ls='ls --color=auto'
alias -r lisah='ls -lisah'
alias -r lsUsb='mount /mnt/usb && ls -lisah /mnt/usb && umount /mnt/usb'
alias -r lsg='ls -lisah | grep'
alias -r lsm='cat ~/.mutt/data/aliases | grep'
alias -r ltr='ls -ltr'
alias -r mv='mv -i'
alias -r obre='xdg-open'
alias -r ping='ping -c 3'
alias -r rl='readlink -f'
alias -r tree='tree -AC'
alias -r Sis="source $Actius/Sistema.zsh" 
alias -r unzip="unzip -O utf8"
alias -r VideoYtbFromat="youtube-dl -o '%(upload_date)s_%(id)s_%(title)s.%(ext)s'"
alias -r VideoYoutubeBaixar="$Actius/VideoYoutubeBaixar.zsh"
# https://makandracards.com/jan0sch/9533-mass-renaming-files-with-zmv
# alias -r DelSpace=' zmv '* *' '$f:gs/ /_' '
# }}}

# Alias Sheel Commands Only Root {{{
alias -r Iotop='sysctl kernel.task_delayacct=1 && iotop; sysctl kernel.task_delayacct=0'
# }}}

# Alias Wake {{{
alias -r PowerOffMimoMedia="$Actius/Wake.zsh poweroff mimomedia10 none"
alias -r PowerOffFx="$Actius/Wake.zsh poweroff fx none"
alias -r PowerOffMimoServer="$Actius/Wake.zsh poweroff mimoserver /etc/portage"
alias -r PowerOffPhenom="$Actius/Wake.zsh poweroff phenom none"
alias -r PowerOffMimory="$Actius/Wake.zsh poweroff mimory none /home/mimosinnet/Dades/Documents"
alias -r WakeMimoMedia="$Actius/Wake.zsh wake mimomedia10"
alias -r WakeFx="$Actius/Wake.zsh wake fx" 
alias -r WakeMimoServer="$Actius/Wake.zsh wake mimoserver"
alias -r WakePhenom="$Actius/Wake.zsh wake phenom"
alias -r WakeMimory="$Actius/Wake.zsh wake mimory /home/mimosinnet/Dades/Documents"
# }}}

# Alias Zsh Functions {{{
# https://superuser.com/questions/681575/any-way-to-get-list-of-functions-defined-in-zsh-like-alias-command-for-aliases#684256
# List all zsh functions
alias -r FunctAll='print -l ${(ok)functions}'
# List underscore zsh functions
alias -r FunctUnder='print -l ${(ok)functions[(I)_*]}'
# List non-underscore zsh functions
alias -r Funct='print -l ${(ok)functions[(I)[^_]*]}'
# }}}
