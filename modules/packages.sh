
base_list="pkgs/base.list"
waybar_list="pkgs/waybar.list"
# needed: avoids reinstall already installed packages
# noconfirm: avoids -yes
pacman -Sq --needed --noconfirm - < "$base_list" 
pacman -Sq --needed --noconfirm - < "$waybar_list" 

