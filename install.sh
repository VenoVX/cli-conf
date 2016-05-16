#!/bin/bash
#Initialize
source "${HOME}/cli-conf/.boot"

#Prepare the computer, install brew etc.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install htop tmux vim tree wget iperf python3 ssh-copy-id wakeonlan cowsay fortune

#Install pip and some tools
sudo easy_install pip
sudo pip install ansible

#Remove any annoying already existing file
rm "${HOME}/.ansi-colors"
rm "${HOME}/.bash_profile"
rm "${HOME}/.bashrc"
rm "${HOME}/.zshrc"
rm "${HOME}/.vim"
rm "${HOME}/.vimrc"
rm "${HOME}/.nvim"
rm "${HOME}/.nvimrc"
rm "${HOME}/.config/htoprc"
rm "${HOME}/.gitconfig"

#Make a new .config directory for the htoprc to live in
mkdir "${HOME}/.config"

#Create some softlink to get most stuff setup
ln -s "${CLI_CONF}/.bash_profile" "${HOME}"
ln -s "${CLI_CONF}/.bashrc" "${HOME}"
ln -s "${CLI_CONF}/.zshrc" "${HOME}"
ln -s "${FSMAXB}/.vim" "${HOME}"
ln -s "${FSMAXB}/.vimrc" "${HOME}"
ln -s "${HOME}/.vim" "${HOME}/.nvim"
ln -s "${HOME}/.vimrc" "${HOME}/.nvimrc"
ln -s "${FSMAXB}/htoprc" "${HOME}/.config"

#Hack for FSMaxB's .bashrc
ln -s "${FSMAXB}/.ansi-colors" "${HOME}"

#Configure vim as per FSMaxB's definiton
hash vim 2> /dev/null && vim +PlugInstall +qall
hash vim 2> /dev/null && vim +GitGutterEnable +qall

#Configure git
ln -s "${CLI_CONF}/.gitconfig"

#Launch the freshly configured shell
if [[ $BASH == *"bash"* ]]; then
	source "${HOME}/.bash_profile"
elif [[ $ZSH_NAME == *"zsh"*  ]]; then
	source "${HOME}/.zshrc"
else
	echo "ERROR: No suitable shell config found!"
fi

chsh -s /bin/zsh $USER
