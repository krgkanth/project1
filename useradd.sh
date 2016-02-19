#!/bin/bash
#########################################
# Author        : Sunny Ahmad.
# Company       : NMI.
# Discription   : Create Users account.
# Date          : 4-14-4014.
# Options       : None.
#########################################


# Create admin account.
# User account will be expired in 90 days. Evey user will get a notification
# before 15 days of expiration date.

USERS="skadmin vpadmin nbadmin sbadmin pbadmin tkadmin"

for USER in $USERS
do
if [ -n "`grep $USER /etc/passwd | cut -d ':' -f1`" ]
then
        printf "User '%s' exists! \n" "$USER"
exit 1
else
echo "%wheel ALL=(ALL)  ALL" >> /etc/sudoers
echo "AllowGroups wheel" >> /etc/ssh/sshd_config
useradd -u 825 skadmin -c "Tavant Offshore Account" -G sshusers && echo skadmin:abc123 | chpasswd && passwd -e skadmin
useradd -u 826 vpadmin -c "Tavant Offshore Account" -G sshusers && echo vpadmin:abc123 | chpasswd && passwd -e vpadmin
useradd -u 1100 nbadmin -c "Tavant Offshore Account" -G sshusers && echo nbadmin:abc123 | chpasswd && passwd -e nbadmin
useradd -u 822 sbadmin -c "Tavant Offshore Account" -G sshusers && echo sbadmin:abc123 | chpasswd && passwd -e sbadmin
useradd -u 817 pbadmin -c "Tavant Offshore Account" -G sshusers && echo pbadmin:abc123 | chpasswd && passwd -e pbadmin
useradd -u 823 tkadmin -c "Tavant Offshore Account" -G sshusers && echo tkadmin:abc123 | chpasswd && passwd -e tkadmin
fi
exit 0
done
service sshd reload
