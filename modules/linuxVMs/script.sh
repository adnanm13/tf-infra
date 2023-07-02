#!/bin/bash
set -e

sudo yum update -y
sudo yum -y install sssd realmd oddjob oddjob-mkhomedir adcli samba-common samba-common-tools krb5-workstation openldap-clients policycoreutils-python ntp ntpupdate

sudo systemctl disable NetworkManager || true
sudo systemctl stop NetworkManager || true
sudo systemctl mask NetworkManager.service || true
# export host=\$(hostname)
sudo hostnamectl set-hostname `hostname`.${ad_domain}.local

echo "nameserver ${ad_ip}" | sudo tee  /etc/resolv.conf
echo "${ad_ip} ${ad_domain^^}.LOCAL ${ad_domain^^}" | sudo tee -a /etc/hosts
echo "%${group_name} ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/devopsinsiders

sudo chattr +i /etc/resolv.conf

sudo authconfig  --enablesssd --enablesssdauth --enablemkhomedir --update
sudo systemctl enable --now oddjobd.service

sudo realm leave || true

export pass=${adpass}
echo $pass | sudo realm join -U sandeep1 ${ad_domain}.local
sudo systemctl restart sssd
sudo realm permit --all

