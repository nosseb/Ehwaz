#!/bin/bash
version='0.2.1'

if [ -z "$1" ]
    then
        printf "No argument supplied" >&2
        exit 128
fi

# REQUIREMENTS
printf "\n\n\nInstalling requirements\n=======================\n\n"
sudo apt-get install steamcmd
printf "\n\nPath export\n===========\n"
export PATH=/usr/games:$PATH


# EBS PERSISTENT STORAGE

# mount
printf "\n\nMounting persistent storage\n===========================\n\n"
printf "#sudo nvme list\n"
sudo nvme list
ebsArma=$(sudo nvme list | grep $1 | cut -d " " -f1) # path to ebs storage
printf "\n\n#ebsArma : $ebsArma\n\n"
printf "mount\n"
sudo mount $ebsArma /home/steam/backup # mount
printf "\nChange owner\n"
sudo chown steam:steam /home/steam/backup # change owner

# links
printf "\nCreate Link\n"
sudo -u steam ln -s /home/steam/backup/config /home/steam/config