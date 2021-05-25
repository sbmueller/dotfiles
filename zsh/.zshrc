unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
export TERM="xterm-256color"
export LANG="en_US.UTF-8"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

POWERLEVEL9K_MODE='nerdfont-complete'
#ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="spaceship"

# Spaceship Configuration
SPACESHIP_RUST_SYMBOL='\uE7A8 '

# Powerlevel9k configuration
if [ ${machine} = "Cygwin" ]; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)
else
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir background_jobs)
fi
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs anaconda status)
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0B4"
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0B6"
#POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR="\uE0C0"
#POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR="\uE0C2"
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_SHOW_CHANGESET=false
POWERLEVEL9K_DIR_PATH_SEPARATOR=" \uE0B1 "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_beginning"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_TIME_BACKGROUND="black"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="\UF43A %D{%I:%M  \UF133  %m.%d.%y}"
POWERLEVEL9K_RVM_BACKGROUND="black"
POWERLEVEL9K_RVM_FOREGROUND="249"
POWERLEVEL9K_RVM_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='white'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='black'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='blue'
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
POWERLEVEL9K_VCS_COMMIT_ICON="\uf417"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
TMUX_ICON=
DISABLE_UPDATE_PROMPT=true


export PATH=/usr/local/opt/python/libexec/bin:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH
export PATH=/usr/local/opt/qt/bin:$PATH
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"
if [ ${machine} = "Cygwin" ]; then
    plugins=(git
             gitfast
             fasd
             zsh-autosuggestions)
else
    plugins=(git
             gitfast
             zsh-autosuggestions
             fasd
             osx
             zsh-syntax-highlighting)
    # Miniconda path
    export PATH=$HOME/miniconda3/bin:$PATH
    # Macports path
    export PATH=/opt/local/bin:$PATH
    # init fasd
    eval "$(fasd --init auto)"
fi

source $ZSH/oh-my-zsh.sh

# Load alias file
if [ -f ~/.dotfiles/aliases ]; then
    source ~/.dotfiles/aliases
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bitcomplete bit


eval $(thefuck --alias)
