#!/bin/bash
#File created Oct 7, 2021
#Indonesia
#Ondi
#
#
echo ""
echo "LOVEBIRD CENTOS7 | Hardening Automation v1.0"
echo "--------------------------------------------"
echo ""
echo "Getting File System configuration from /etc/fstab"
cat /etc/fstab|grep /home
cat /etc/fstab|grep /tmp
cat /etc/fstab|grep /var

fs_tmp=`cat /etc/fstab|grep /tmp`
echo $fs_tmp
