#!/bin/bash

## SED, if-else examples

## Two script file required:
###### Script (1)
# To run this script parallel (without copying) on multiple #nodes:
# To run script in all nodes, without copying it###
# for i in ukwfssymp{001..004}
# do
# ssh root@$i 'cat | bash /dev/stdin' "$@" < "script name"
# done
# ssh root@client2 'cat | bash /dev/stdin' "$@" < "script-path.sh"


### Script (2)  commenting out unwanted DNS servers and appending new DNS server lists

dns1="nameserver 10.255.253.1"
dns2="nameserver 10.255.254.1"

sed -i '/nameserver 10.232.1.2/, /nameserver 10.236.128.20/, /nameserver 10.235.97.20/s/^/#/' /etc/resolv.conf

sed -i /10.232.1.2/a"$dns1 \n$dns2"  /etc/resolv.conf

# Check line "hosts:" and append(if missing) parameters in /etc/nsswitch.conf

if grep -Fxq "hosts:      files dns nis" /etc/nsswitch.conf
then
        echo "no change needed in /etc/nsswitch.conf"
else

        sed -i -e 's/hosts:      files dns/hosts:      files dns nis/' /etc/nsswitch.conf
fi


## use pdsh to test this changes # 

