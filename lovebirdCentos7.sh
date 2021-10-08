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
#cat /etc/fstab|grep /home
#cat /etc/fstab|grep /tmp
#cat /etc/fstab|grep /var

fs_tmp=`cat /etc/fstab|grep /tmp`
#if [${#fs_tmp} == 0 ]; then echo "$fs_tmp not found"
len_tmp=${#fs_tmp}
#res=""
if [ $len_tmp -ge 1 ];then
	echo "Found:"
	echo "$fs_tmp"
fi
#echo $res
