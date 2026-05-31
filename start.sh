
#this script must be executed with super user privileges
if [ "$EUID" -ne 0 ]; then
	echo "This script needs super user privleges."
  	exit 1
fi

#get real user (while using sudo or doas, $USER prints: root)
user=${SUDO_USER:-$USER}

chmod +x modules/*.sh
source ./modules/link.sh

#========================AutoInstall Scripts============================
#hub config (laptop working with lid off)
./modules/logind.sh
#install packages
./modules/packages.sh

#install scripts 
#to do.





#copy /tmp/autoconf/configs into configs/
#link_config "hyprland" "$HOME/.config/hypr"
link_config "waybar" "/home/$user/.config/waybar" "$user"
link_config "fastfetch" "/home/$user/.config/fastfetch" "$user"
link_config "swaync" "/home/$user/.config/swaync" "$user"
#reboot daemons
systemctl daemon-reload
echo "Please, reboot your system to make sure that all changes can be applied"
