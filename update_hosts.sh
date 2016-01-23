#!/bin/bash

echo -e "\n\033[31m\033[40;36m[*] Today is $(date +%F\ %r\ %a)\033[0m"

cd highsea_hosts
echo -e "\n\033[31m\033[40;36m[+] Now updating the highsea hosts... \033[0m"
git fetch --all
git pull -f
cd ..

cd racaljk_hosts
echo -e "\n\033[31m\033[40;36m[+] Now updating the racaljk hosts... \033[0m"
git fetch --all
git pull -f
cd ..


cd liuker0x007_hosts
echo -e "\n\033[31m\033[40;36m[+] Now updating the liuker0x007_hosts... \033[0m"
git fetch --all
git pull -f
cd ..

echo -e "\n\033[31m\033[40;36m[+] Assembling hosts files... \033[0m"
headline=" 
# ===========================================================================
# Copyright (C) 2016 nick All Rights Reserved
# Maintainer:   nick
# Created:      2016-01-24
# LastModify:   $(date +%F\ %r\ %a)
# Version:      v1.0"
echo -e "$headline" > final_hosts
cat highsea_hosts/hosts \
    racaljk_hosts/hosts \
    liuker0x007_hosts \
    >> final_hosts
unix2dos final_hosts

echo -e "\n\033[31m\033[40;33m[+] Writing the system hosts file... \033[0m"
hosts_path='/c/Windows/System32/drivers/etc/hosts'
cat final_hosts > $hosts_path

echo -e "\n\033[31m\033[40;36m[*] Done! \033[0m\n"
head $hosts_path


# vim: se ai si et sw=4 ts=4:

