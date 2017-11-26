# Can be simplified by assuming bash, not sh.
#stty_orig=`stty -g`
#stty -echo
#echo "Enter your sudo password:"
#read line
read -s -p "Enter your sudo password:" line
export ANSIBLE_VAULT_PASSWORD="${line}"
#stty $stty_orig

export PATH="$PATH:/sbin:/usr/local/sbin:/usr/sbin"#:/snap/bin"
