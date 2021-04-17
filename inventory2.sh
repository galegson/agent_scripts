#!/bin/bash

CPU=`nproc`

KERN=`uname -r | awk -F. '{print $1}'`

MEM=`free -m | sed -n '2p' |awk '{print $2}'`

#USR=cat /etc/passwd | awk -F: '{print $1}' | grep

echo "The number(s) of cpus on this server is(are): ${CPU}."

echo -e "\nThe total memory on this server is ${MEM}mb."

echo -e "\nThe first number of the kernel is ${KERN}."
if [ ${KERN} -ge 3 ]
then echo -e "Kernel is fine / CPU pass for kernel\n"
else
echo -e "CPU fail for Kernel\n"
fi

find  /etc/group -prune
if [ $? -eq 0 ]
then
echo -e "CPU pass for etc/group\n"
else
echo -e "CPU failed for etc/group\n"
fi

find  /etc/passwd -prune
if [ $? -eq 0 ]
then
echo -e "CPU pass for etc/passwd\n"
else
echo -e "CPU failed for etc/passwd\n"
fi


find  /etc/kubertnetes -prune
if [ $? -eq 0 ]
then
echo -e "CPU pass for etc/kubernetes\n"
else
echo -e "CPU failed for etc/kubernetes\n"
fi

find  /etc/httpd -prune
if [ $? -eq 0 ]
then
echo -e "CPU pass for etc/httpd"
else
echo -e "CPU failed for etc/httpd"
fi
