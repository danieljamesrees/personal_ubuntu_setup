# Can be simplified by assuming bash, not sh.
#stty_orig=`stty -g`
#stty -echo
#echo "Enter your sudo password:"
#read line
read -s -p "Enter your sudo password:" line
export ANSIBLE_VAULT_PASSWORD="${line}"
#stty $stty_orig

# Set the terminal title.
echo -ne "\033]0;$(basename $PWD)\007"

if [ -f ~/.bash_aliases ]
then
  . ~/.bash_aliases
fi