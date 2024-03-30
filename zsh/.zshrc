# Variables {{{
HISTFILE=~/.zshhistory
HISTSIZE=3000
SAVEHIST=3000
Actius=/home/mimosinnet/Dades/Scripts/Actius
Plugins=/home/mimosinnet/.zsh/plugins

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
# }}}

# Plugins {{{
source $Plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $Plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# autocomplete gives me error when in root
if [[ $UID -eq 0 ]]
then
    autoload -U compinit edit-command-line zmv run-help
    # Skip security checks for root, as we are using the same configuration than the user
    compinit -u
else
    # Remove any calls to compinit
    source $Plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh 
    autoload -U edit-command-line zmv run-help
fi
# }}}

# opcions {{{
# història: elimina duplicats, ignora els que comencen amb espai
setopt hist_ignore_all_dups hist_ignore_space
# no fa falta cd
setopt autocd
# regex en operacions amb arxius: cp ^*.(tar|bz2|gz).
setopt extendedglob
# corregeix instruccions
setopt correctall
# Fem servir aquesta funció per a que funcioni el prompt, veure .zfunc/prompt
# funció que permet "parameter expansion, command substitution and arithmetic expansion"
setopt prompt_subst

# Directory stack
# http://zsh.sourceforge.net/Intro/intro_6.html
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'
# }}}

# Alias {{{

# Alias Actius {{{
alias -r BaixaG='raku /home/mimosinnet/Dades/Scripts/Actius/Baixa.raku generatech'
alias -r BaixaP='raku /home/mimosinnet/Dades/Scripts/Actius/Baixa.raku psicosocial'
alias -r Files="$Actius/Files.zsh"
# }}}

# Alias Aplicacions {{{
# alias -r lynx-proxy='lynx -cfg=/~/.config/lynx/lynx-proxy.cfg http://config.privoxy.org/'
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
alias -r Mount='mount | grep nfs && mount | grep vg'
# alias -r MountDocuments='RunRepo   Mount phenom /home/mimosinnet/Dades/Documents'
alias -r MountMultimedia="$Actius/MountFolder.zsh /mnt/MultiMedia"
alias -r MountVirtualbox="$Actius/MountFolder.zsh /home/mimosinnet/Dades/VirtualBox"
alias -r MountZoteroBkp=" $Actius/MountFolder.zsh /home/mimosinnet/Dades/Backup/bkp_zotero"
# }}}

# Alias MoveLast {{{
alias -r MoveLastBaixades="$Actius/MoveLast.zsh Baixades"
alias -r MoveLastScreenShots="$Actius/MoveLast.zsh Dades/ScreenShots"
# }}}

# Alias Presentacions {{{ 
alias -r PresCopyMedia="$Actius/PresCopyMedia.zsh"
alias -r PresCrea="$Actius/PresCrea.zsh"
alias -r PresRsyncServer="$Actius/PresRsyncServer.zsh"
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
alias -r mimomedia="$Actius/Entra.zsh mimomedia10"
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
alias -r Youtubedl="youtube-dl -o '%(upload_date)s_%(id)s_%(title)s.%(ext)s'"
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
alias -r WakeMimoMedia="$Actius/Wake.zsh wake mimomedia10 6c:b3:11:4b:34:36"
alias -r WakeFx="$Actius/Wake.zsh wake fx 40:8d:5c:59:f3:7d"
alias -r WakeMimoServer="$Actius/Wake.zsh wake mimoserver 18:c0:4d:3d:1c:75"
alias -r WakePhenom="$Actius/Wake.zsh wake phenom 6c:f0:49:5e:90:c0"
alias -r WakeMimory="$Actius/Wake.zsh wake mimory d4:5d:64:c2:80:7e /home/mimosinnet/Dades/Documents"
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

# }}}

# zsh add-ons {{{
# Stored in /usr/share/zsh/5.6.2/functions

# https://wiki.gentoo.org/wiki/Zsh#Add-on
# http://zsh.sourceforge.net/Doc/Release/Functions.html
# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#SEC283
# man zshbuiltins

# http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#SEC283
zle -N edit-command-line
bindkey -M vicmd v edit-command-line # ESC-v to edit in an external editor.

# run-help {{{
# https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Accessing-On_002dLine-Help
unalias run-help
autoload run-help
alias h=run-help
# }}}


# zmv: https://blog.thecodewhisperer.com/permalink/renaming-magically-with-zmv
# tcp_open: man zshtcpsys

# # compinit {{{
# ATENCIÓ: REVISAR
# # http://lethalman.blogspot.com/2009/10/speeding-up-zsh-completion.html
# # https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' accept-exact false
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# # ignore completion to commands we don't have
zstyle ':completion:*:functions' ignored-patterns '_*'
# 
# # completion menus will look very nice
zstyle ':completion:*' menu select
# 
# # Afegit de: https://www.nesono.com/node/309
# # format autocompletion style
zstyle ':completion:*:descriptions' format "%{$fg_bold[green]%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$fg_bold[yellow]%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$fg_bold[red]%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$fg_bold[red]%}%d%{$reset_color%}"
# zstyle show completion menu if 2 or more items to select
zstyle ':completion:*'                        menu select=2
# 
# # zstyle kill menu
zstyle ':completion:*:*:kill:*'               menu yes select
zstyle ':completion:*:kill:*'                 force-list always
zstyle ':completion:*:*:kill:*:processes'     list-colors "=(#b) #([0-9]#)*=36=31"
# https://github.com/marlonrichert/zsh-autocomplete?tab=readme-ov-file
# This will make Autocomplete behave as if you pressed CtrlR at the start of each new command line
# zstyle ':autocomplete:*' default-context history-incremental-search-backward
# }}}

# https://github.com/agkozak/zsh-z
# source /home/mimosinnet/Dades/Scripts/Zsh/zsh-z/zsh-z.plugin.zsh

# Modules
# https://stackoverflow.com/questions/63661238/difference-between-zmodload-vs-autoload-in-zsh
# Stored in: /usr/share/zsh/*/functions

# https://zsh.sourceforge.io/Doc/Release/Arithmetic-Evaluation.html
# zmodload zsh/mathfunc

# }}}

# Funcions {{{

# Activar funcions:
source ~/.zfunc/Mask
source ~/.zfunc/Puja
source ~/.zfunc/RunRepo
source ~/.zfunc/adreça
source ~/.zfunc/auto_ls
source ~/.zfunc/marks
source ~/.zfunc/prompt
source ~/.zfunc/Interface.zsh
# }}}

# keybindings {{{
# https://bbs.archlinux.org/viewtopic.php?id=70801
bindkey '^?' backward-delete-char	# back space
bindkey '^[[7~' beginning-of-line	# home
bindkey '^[[5~' up-line-or-history	# page up
bindkey '^[[3~' delete-char		# del
bindkey '^[[8~' end-of-line		# end
bindkey '^[[6~' down-line-or-history	# page donw
bindkey '^[[A' up-line-or-search	# up
bindkey '^[[D' backward-char		# left
bindkey '^[[B' down-line-or-search	# down
bindkey '^[[C' forward-char 		# right
bindkey '^[[2~' overwrite-mode		# insert
# }}}

