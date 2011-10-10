#!/bin/bash
# Mady by: Rosco Nap - rosco@xlshosting.nl
# Cleanup image for packaging and restore .vmx
# after the mess vmplayer makes. Also includes
# the README.txt
# Usage: ./cleanup.sh <appname>

# Remove files
rm openapp-$1/nvram
rm openapp-$1/openapp-$1.vmem
rm openapp-$1/openapp-$1.vmss
rm openapp-$1/openapp-$1.vmxf
rm openapp-$1/openapp-$1.vmsd
rm openapp-$1/openapp-$1.vmx
rm openapp-$1/vmware.log
rm -rf openapp-$1/openapp-$1.vmx.lck

# Restore vmx
cp conf/openapp-$1.vmx openapp-$1/
cp conf/README.txt openapp-$1/

sed -i s/openapp-appliance/$1/g openapp-$1/README.txt 
