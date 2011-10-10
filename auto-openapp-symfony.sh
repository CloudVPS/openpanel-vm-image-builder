##
## Firstbootscript for openapp image
## 

# Prelimenary check for openapp in sources.list.
# This should never run.

grep -i openapp /etc/apt/sources.list
if [ $? -eq 0 ]; then
    echo "Openapp found, please remove /root/firstboot.sh... exiting.."
    exit
fi

# Restart network for DHCP
/etc/init.d/networking restart
sleep 2

# Prepare sources.list
cat >> /etc/apt/sources.list << "EOF"

# OpenApp 
deb http://download.openpanel.com/.deb/ stable main openapp
deb-src http://download.openpanel.com/.deb/ stable main openapp
EOF

# Update and install packages
export DEBIAN_FRONTEND=noninteractive
apt-key adv --keyserver keyserver.stack.nl --recv-keys 4EAC69B9
apt-get update
apt-get install -qqy --force-yes openapp-symfony

# clean up
apt-get autoclean -y
apt-get autoremove -y

# Setup default openapp admin password:

openpanel-cli "update user password=openapp"

# Setup mysqlpassword

if [ -e /etc/mysql/my.cnf ]; then
    mysqladmin -u root password openapp-db
    exit
fi

# Remove the netrules.
rm -rf /etc/udev/rules.d/70-persistent-net.rules

# Clear tracks
for logs in `find /var/log -type f`; do > $logs; done
history -c
> /root/.bash_history

