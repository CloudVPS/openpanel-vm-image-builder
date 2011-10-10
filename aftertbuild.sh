#!/bin/bash
# Mady by: Rosco Nap - rosco@xlshosting.nl
# Copy vm image from ubuntu-vmserver to openapp directory. (TODO: Fix target with vmbuilder script)
# Make a from vm image in backupdir.
# Copy correct vmx file to openapp directory.
# Usage: ./afterbuild.sh <appname>

DIR=ubuntu-vmserver
BACKUP=backup
CONF=conf

cp $DIR/*vmdk $BACKUP/openapp-$1.vmdk
ls $BACKUP/openapp-$1.vmdk -palht 
cp $CONF/openapp-$1.vmx openapp-$1/
mv $DIR/*vmdk openapp-$1/openapp-$1.vmdk
ls openapp-$1/openapp-$1.vmdk -palht
rm $DIR -rf
ls -palht
