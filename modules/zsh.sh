
#install oh-my-posh
yay -S oh-my-posh-bin

#copy .zshc config file into new folder
ln -sf "$(pwd)/config/zsh/.zshrc" "/home/$1/.zshrc"

#change actual shell to zsh
chsh -s /usr/bin/zsh

