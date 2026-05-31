
pkgs_list="../pkgs/base.list"

# needed: avoids reinstall already installed packages
# noconfirm: avoids -yes
pacman -Syu --needed --noconfirm - < "$pkgs_list"
