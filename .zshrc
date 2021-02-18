## il-mich zsh config
#
#
#                `........`
#            .--::--------::.
#         .-:----------------:`
#       .:--------------------/
#      ::---------------------:-                        ``....`
#     :-----------------------:.                  .--:::-----:.
#    `/------------:::--------:                  ::-------:-+.
#    `:----------::...-::---::                `.:-------/h+.
#     /-------:::/-..-..::--:  ``          `.-:--:::-:+/.
#     .:-----/-...:./h/..::-/::::/.     `.-:-::-.`
#      `::---/-.+:.:::ys.-::/::---::---/:::-.`
#        `....--+ho/:::/:/::----:/:--::/.`
#              `-:+o---//-:/-sy+yho+/.
#              .:--+-::--//oso++++o/`
#              :-///:--:/---os+o/.
#              -://---/:----++++o:
#               -:---++/:::+o++++o/
#               +://oo+:-  ++++++++/
#               `--..      :+++++++o.
#                          +++++++++/
#                         -o+oooooo+o
#                         ++/:----://
#                        `/--------:`
#                       `+-//:::-:::
#                       .``.`.`.`.``

#
## Shell options
#

# Enable prompt substring processing
setopt PROMPT_SUBST

# Don't cd automatically when only the name of a folder is passed
setopt NO_AUTO_CD

# Print error if no matches for the pattern are found
setopt NO_MATCH

# Don't beep on error
setopt NO_BEEP

# Don't treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns
setopt NO_EXTENDED_GLOB

# Don't report the status of background jobs immediately
setopt NO_NOTIFY


#
## Visited folders stack
#

# Push the current directory visited on the stack
setopt AUTO_PUSHD

# Do not store duplicates in the stack
setopt PUSHD_IGNORE_DUPS

# Do not print the directory stack after pushd or popd
setopt PUSHD_SILENT


#
## Aliases
#

# Directory history
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CFh --color=auto'

# Colored output
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Quit away
alias :q='exit'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


#
## Keymaps
#

# Jump words with ctrl
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Up and down for substring search of history
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#
## History options
#

# Share history across multiple zsh sessions
setopt SHARE_HISTORY

# Append to history
setopt APPEND_HISTORY

# Adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY

# Delete an old recorded event if a new event is a duplicate
setopt HIST_IGNORE_ALL_DUPS

# Removes blank lines from history
setopt HIST_REDUCE_BLANKS

# Do not record an event starting with a space
setopt HIST_IGNORE_SPACE


#
## Prompt
#

PROMPT='%2~ %F{red}>%f '
RPROMPT='%(?.◕‿◕.%F{red}ಠ_ಠ)%f' # expanded dynamically

#
## Plugins
#

# Search in history for similar commands
source $ZSH_HOME/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

# Highlight commands' syntax
source $ZSH_HOME/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# Move to a parent directory without ../
source $ZSH_HOME/plugins/zsh-bd/bd.zsh

# Make manpages more readable
source $ZSH_HOME/plugins/zsh-colored-man-pages/colored-man-pages.plugin.zsh


#
## Completion
#

# Enable shift-tab to move backwards in completions
zmodload zsh/complist
autoload -Uz complist
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Add zsh-completions plugin
fpath=($ZSH_HOME/plugins/zsh-completions/src $fpath)

# Case insensitive globbing
setopt NO_CASE_GLOB

# Complete from both ends of a word
setopt COMPLETE_IN_WORD

# Move cursor to the end of a completed word
setopt ALWAYS_TO_END

# Completion styles used
zstyle ':completion:*' completer _complete _approximate

# Fuzzy completion options
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Case insensitive completions
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# Highlight selected item
zstyle ':completion:*:*:*:*:*' menu select

# Describe suggested options
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'

# Use caching to make completion for commands
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "/tmp/zsh_cache"

# Group matches
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Use lscolors in directory completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Formatting and messages
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

