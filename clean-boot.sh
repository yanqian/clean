#!/bin/bash
kernels=$(dpkg --get-selections | grep linux-image-[0-9] | awk '{print $1}')
counts=$(dpkg --get-selections | grep linux-image-[0-9] | wc -l)
count=1
for ele in $kernels
do
    if [ $count -lt $counts ];then
        # keep the last newest kernel and remove others
        #sudo apt-get --purge remove $ele
        echo $ele
        #sudo dpkg -P linux-image-extra-3.13.0-70-generic
        count=$(expr $count + 1)
    else
        break
    fi
done
