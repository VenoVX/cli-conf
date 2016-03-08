#Initialize
source "${HOME}/cli-conf/.boot"

#Theme
ZSH_THEME="cloud"

#Using case-sensitive completion
CASE_SENSITIVE="true"

#Display red dots whilst waiting for completion
COMPLETION_WAITING_DOTS="true"

#Hack to make VCS status checking faster
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins to load for zsh
plugins=(git osx sudo brew chucknorris pass)

#Load the oh-my-zsh config
source "${ZSH}/oh-my-zsh.sh"
