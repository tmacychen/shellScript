#!/bin/bash

IP_LIST="192.168.1.1 192.168.1.2"

USER="test"

for ip in $IP_LIST;
do
    utime=$(ssh $USER@$IP uptime | awk '{ print $3}')
    echo $IP uptime: $utime
done
