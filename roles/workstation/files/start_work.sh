#!/bin/sh

gnome-terminal --working-directory=Projects/personal_ubuntu_setup/ 
gnome-terminal --working-directory=Projects/personal_practice_projects/
gnome-terminal --working-directory=Projects/bringit.bitbucket_io/
gnome-terminal --working-directory=Projects/bringit/

firefox &

cd Projects/personal_ubuntu_setup

ansible-playbook playbooks/local/fix_wifi.yml

cd ../..
