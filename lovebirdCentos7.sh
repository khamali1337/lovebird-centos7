#!/bin/bash
#File created Oct 7, 2021
#Indonesia
#khamali
#
#
#Global var
lnx=0
lfdef=0
lnosuid=0
lnoexec=0
lnodev=0
buff=""
#
echo ""
echo "LOVEBIRD CENTOS7 | Hardening Automation v1.0"
echo "--------------------------------------------"
echo ""
echo "Getting File System configuration from /etc/fstab"
#cat /etc/fstab|grep /home
#cat /etc/fstab|grep /tmp
#cat /etc/fstab|grep /var

fs_var=`cat /etc/fstab|grep /var`
fs_tmp=`cat /etc/fstab|grep /tmp`
fs_home=`cat /etc/fstab|grep /home`

##BOF var fstab
len_var=${#fs_var}
if [ $len_var -ge 1 ];then
	#echo "$fs_var"
	fdef=`echo $fs_var|grep defaults`
	lfdef=${#fdef}
	if [ $lfdef -ge 1 ];then
		buff=$fdef
		nosuid=`echo $buff|grep nosuid` 
		lnosuid=${#nosuid}
		if [ $lnosuid -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,nosuid/g'`
		fi
		noexec=`echo $buff|grep noexec`
		lnoexec=${#noexec}
		if [ $lnoexec -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,noexec/g'`
		fi
		nodev=`echo $buff|grep nodev`
		lnodev=${#nodev}
		if [ $lnodev -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,nodev/g'`
		fi
		echo "Original:"
		echo $fdef
		echo "Update to:"
		echo $buff
	fi
	
fi
##EOF var fstab

echo "---------------------------------------------------"

##BOF tmp fstab
len_tmp=${#fs_tmp}
if [ $len_tmp -ge 1 ];then
	#echo "$fs_tmp"
	fdef=`echo $fs_tmp|grep defaults`
	lfdef=${#fdef}
	if [ $lfdef -ge 1 ];then
		buff=$fdef
		nosuid=`echo $buff|grep nosuid` 
		lnosuid=${#nosuid}
		if [ $lnosuid -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,nosuid/g'`
		fi
		noexec=`echo $buff|grep noexec`
		lnoexec=${#noexec}
		if [ $lnoexec -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,noexec/g'`
		fi
		nodev=`echo $buff|grep nodev`
		lnodev=${#nodev}
		if [ $lnodev -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,nodev/g'`
		fi
		echo "Original:"
		echo $fdef
		echo "Update to:"
		echo $buff
	fi
	
fi
#EOF tmp fstab

echo "---------------------------------------------------"


##BOF home fstab
len_home=${#fs_home}
if [ $len_home -ge 1 ];then
	#echo "$fs_home"
	fdef=`echo $fs_home|grep defaults`
	lfdef=${#fdef}
	if [ $lfdef -ge 1 ];then
		buff=$fdef
		nosuid=`echo $buff|grep nosuid` 
		lnosuid=${#nosuid}
		if [ $lnosuid -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,nosuid/g'`
		fi
		noexec=`echo $buff|grep noexec`
		lnoexec=${#noexec}
		if [ $lnoexec -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,noexec/g'`
		fi
		nodev=`echo $buff|grep nodev`
		lnodev=${#nodev}
		if [ $lnodev -eq 0 ];then
			buff=`echo $buff|sed 's/defaults/defaults,nodev/g'`
		fi
		echo "Original:"
		echo $fdef
		echo "Update to:"
		echo $buff
	fi
	
fi
#EOF home fstab


