export TERM="xterm-256color"
# Path to your oh-my-zsh installation.
export ZSH=/Users/senpo/.oh-my-zsh

POWERLEVEL9K_MODE='awesome-patched'

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true

plugins=(git zsh-autosuggestions fasd osx)

source $ZSH/oh-my-zsh.sh

# Macports path
export PATH=/opt/local/bin:$PATH

# Load alias file
if [ -f ~/.dotfiles/.alias ]; then
	source ~/.dotfiles/.alias
fi

# Powerlevel9k configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon root_indicator virtualenv context dir vcs background_jobs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
