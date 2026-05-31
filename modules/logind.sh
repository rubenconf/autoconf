# why: if you put down the lid of your laptop, it autmaticaly suspends or shuts down the session.
# if we modify HandleLidSwitch from "suspend", to "ignore"
# and HandleLidSwitchExternalPower from "suspend to "ignore
# we avoid this situation.
# this is a systemd file, so needs sudo permissions to be modified
#
# edit /etc/systemd/logind.conf

dst_file="/etc/systemd/logind.conf"
backup_dir="/tmp/autoconf/backup"
backup_file="/tmp/autoconf/backup/logind.conf.bak"

mkdir -p "$backup_dir"
cp "$dst_file" "$backup_file"
 
sed -i "s/^#\?HandleLidSwitch=.*/HandleLidSwitch=ignore/g" "$dst_file"
sed -i "s/^#\?HandleLidSwitchExternalPower=.*/HandleLidSwitchExternalPower=ignore/g" "$dst_file"

if grep -q "^HandleLidSwitch=ignore" "$dst_file" && grep -q "^HandleLidSwitchExternalPower=ignore" "$dst_file"; then
	# logind.conf modified, service must be restarted
	# systemctl restart systemd-logind
	# with daemon-reload, at the main program should be fine
	echo "/etc/systemd/logind.conf config applied succesfully"
else
	mv "$backup_file" "$dst_file"
	echo "ERROR: /etc/systemd/logind.conf, configuration not applied"
	exit 1
fi

