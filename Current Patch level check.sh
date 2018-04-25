#!/bin/bash

## node-name = file in same patch where script present and will hold target node names.
## Refering file name as cmd "hostname" will not work.
## echo $HOSTNAME = will echo parent hostname not remote hostname.

for i in $(cat node-name)
do
ssh $i "hostname -f; echo "------------------------------------";ls /boot/ |grep vmlinuz; echo "===================================="; 2>&1" >> node-patch-level.txt
done

