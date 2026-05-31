
pkgs_list="pkgs/base.list"

# needed: avoids reinstall already installed packages
# noconfirm: avoids -yes
if pacman -Syu --needed --noconfirm - < "$pkgs_list";
	echo "Package installed succesfully"
else
	echo "ERROR: Something happened installing the packages"
	exit 1
fi
