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
#echo ""
echo "######################################################"
echo "Filesystem Configuration"
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

echo "######################################################"

echo "Hardening Tools"
echo "yum -y install tcpdump logrotate aide iptables rsyslog tcp_wrappers"
echo "yum install -y epel-release"
echo "yum install -y rkhunter"
echo "rkhunter --update"
echo "rkhunter --propupd"

echo ""
echo "######################################################"
echo "SELinux Configuration"
echo "cp /boot/grub2/grub.cfg /boot/grub2/grub.cfg-bkp"
echo "grep selinux=0 /boot/grub2/grub.cfg"
echo "grep enforing=0 /boot/grub2/grub.cfg"
echo "cp /etc/selinux/config /etc/selinux/config-bkp"
echo "grep SELINUX /etc/selinux/config | grep -v ^#"
echo "yum erase setroubleshoot -y"

echo ""
echo "######################################################"
echo "Secure Boot"
echo "chown root:root /boot/grub2/grub.cfg"
echo "chmod og-rwx /boot/grub2/grub.cfg"
echo "cp /boot/grub2/grub.cfg /boot/grub2/grub.cfgbfrepass-bkp"
echo "grub2-setpassword"
echo "cat /boot/grub2/grub.cfg"


echo ""
echo "######################################################"
echo "pvdisplay"
echo "dd if=/dev/<disk to be backed up> of=/backup/path/of/disk/image"
echo "optional"
echo `rsync –aAXv –-exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found/*","/backup/*"} /* /path/to/backup/directory/`

echo ""
echo "######################################################"
echo "Security Updates"
echo "cp /etc/yum.conf /etc/yum.conf-bkp"
echo "sed -i 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.conf"
echo "cat /etc/yum.conf"
echo "yum check-update"
echo "yum update"
echo "yum update --security"

echo ""
echo "######################################################"
echo "Legacy Services"
