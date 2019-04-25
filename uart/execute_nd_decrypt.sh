#!/bin/bash

echo "Checking if .bin file exists"

if [ -f 'steg.bin' ]
then
	echo "Found"
	sleep 1
	echo "Dumping in progress"
	icoprog -p < steg.bin
	echo "Receiving encrypted image and saving to mod.png"
	python regen_img.py
	sleep 1
	echo "Decrypting image"
	python decrypt.py
fi
