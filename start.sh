
#this script must be executed with super user privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script needs super user privleges."
fi

#hub config (laptop working with lid off)
./scripts/logind.sh

#install packages
#to do.

#install scripts 
#to do.




#reboot daemons
systemctl daemon-reload
echo "Please, reboot your system to make sure that all changes can be applied"
