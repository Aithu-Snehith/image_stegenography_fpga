#!/bin/bash

python v_gen.py

echo "Generating verilog file"

sleep 1

echo "Building executables"

sleep 1

make

sleep 1

echo "Sending .bin file to RasPi"

scp steg.bin pi@192.168.0.4:~/image_stegenography_fpga/uart/

echo "Copied"
