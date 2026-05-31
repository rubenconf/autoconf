
#this script must be executed with super user privileges
if [ "$EUID" -ne 0 ]; then
  echo "This script needs super user privleges."
fi

#hub config (laptop working with lid off)
./hub/config.sh
