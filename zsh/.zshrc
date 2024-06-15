# Variables {{{
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
Zsh=/home/mimosinnet/.zsh
Actius=$Zsh/ZScripts
# }}}

# Options {{{
# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
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
# setopt prompt_subst

# Directory stack
# http://zsh.sourceforge.net/Intro/intro_6.html
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'
# }}}

# plugins {{{

# Antidote {{{
# https://getantidote.github.io/install
zsh_plugins=${Zsh}/zsh_plugins
fpath=(${Zsh}/antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

source ${zsh_plugins}.zsh
# }}}

# zsh-autocomplete {{{
# pass argument to compinit: no to check for insecure files
zstyle '*:compinit' arguments -u

# Make Tab go straight to the menu and cycle there
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
# }}}

# Make Enter submit the command line straight from the menu
bindkey -M menuselect '\r' .accept-line

autoload -U edit-command-line zmv run-help promptinit
promptinit
prompt pure

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

# zstyle kill menu
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
# source ~/.zfunc/prompt
source ~/.zfunc/Interface.zsh
# }}}

# keybindings {{{
# https://bbs.archlinux.org/viewtopic.php?id=70801
# bindkey '^?' backward-delete-char	# back space
# bindkey '^[[7~' beginning-of-line	# home
# bindkey '^[[5~' up-line-or-history	# page up
# bindkey '^[[3~' delete-char		# del
# bindkey '^[[8~' end-of-line		# end
# bindkey '^[[6~' down-line-or-history	# page donw
# bindkey '^[[A' up-line-or-search	# up
# bindkey '^[[D' backward-char		# left
# bindkey '^[[B' down-line-or-search	# down
# bindkey '^[[C' forward-char 		# right
# bindkey '^[[2~' overwrite-mode		# insert
# }}}

source ${Zsh}/aliases.zsh
