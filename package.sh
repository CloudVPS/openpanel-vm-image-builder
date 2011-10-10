#!/bin/bash
# Mady by: Rosco Nap - rosco@xlshosting.nl
# Zip the image .
# Please run ./cleanup.sh first
# Usage: ./package.sh <appname>

zip openapp-$1.zip openapp-$1/*
mv openapp-$1.zip final/
