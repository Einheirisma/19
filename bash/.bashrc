# ~/.bashrc

# If not running interactively, don't do anything
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# Aliases
alias e="nvim"
alias vim="nvim"
alias se="sudoedit"

alias cat="bat"
alias img="feh"
alias top="btop"
alias cp="cp -r"
alias rm="rm -rf --"
alias mkdir="mkdir -p"
alias reboot="sudo reboot"
alias grep="grep --color=auto"
alias shutdown="sudo shutdown -h now"
alias updateriver="sh ~/.config/river/init"

alias ls='eza --icons --color=always'
alias sl='eza --icons --color=always'
alias ll='eza -laghm@ --all --icons --git --color=always'
alias ltree="eza -lTag --level=4 --icons=always"
alias tree='eza --all --icons --sort=type -T'

export HISTCONTROL="ignoredups:erasedups"         # No duplicate entries
export HISTIGNORE="ls:ll:exit:clear:sl:history*" # Ignore commands
shopt -s cdspell                 # Autocorrects cd misspellings
shopt -s checkwinsize            # Checks term size when bash regains control
shopt -s histappend              # Do not overwrite history
shopt -s no_empty_cmd_completion # Do not TAB expand empty lines
# Usage: ignores single-word commands
HISTIGNORE=$'*([\t ])+([-%+,./0-9\:@A-Z_a-z])*([\t ])'

# Functions
# Usage: '.. 3' takes you 3 folders up
..() { cd "$(eval printf '../%.0s' {1..$1})" || return 1; }

# Usage: extract file
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1                  ;;
            *.tar.gz)    tar xvzf $1                  ;;
            *.bz2)       bunzip2 $1                   ;;
            *.rar)       unrar x $1                   ;;
            *.gz)        gunzip $1                    ;;
            *.tar)       tar xvf $1                   ;;
            *.tbz2)      tar xvjf $1                  ;;
            *.tgz)       tar xvzf $1                  ;;
            *.zip)       unzip $1                     ;;
            *.Z)         uncompress $1                ;;
            *.7z)        7z x $1                      ;;
            *)           echo "can't extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

[[ ${BLE_VERSION-} ]] && ble-attach
