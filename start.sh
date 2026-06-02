
user=$(whoami)

#=======================AutoInstall Dotfiles============================
link_config "waybar" "$HOME/.config/waybar"
link_config "fastfetch" "$HOME/.config/fastfetch"
link_config "swaync" "$HOME/.config/swaync"
link_config "kitty" "$HOME/.config/kitty"
link_config "zsh" "$HOME/.config/zsh"


sudo chmod +x modules/*.sh
source ./modules/link.sh

#========================AutoInstall Scripts============================
#install yay
./modules/yay.sh

#configure shell
./modules/zsh.sh

#install scripts 
#to do.

#needs super user permissions
#=======================Super User=====================================
#install packages
sudo ./modules/packages.sh

#hub config (laptop working with lid off)
sudo ./modules/logind.sh

#reboot daemons
systemctl daemon-reload
echo "Please, reboot your system to make sure that all changes can be applied"
