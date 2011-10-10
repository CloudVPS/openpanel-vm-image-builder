#!/bin/bash
# Restore image from backup (first delete from vmware player library)

rm -rf openapp-$1/*
cp backup/openapp-$1.vmdk openapp-$1/
cp conf/openapp-$1.vmx openapp-$1/

chown $OWNER:$OWNER openapp-$1 -R 

