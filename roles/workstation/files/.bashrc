read -s -p "Enter your Ansible Vault password:" line
export ANSIBLE_VAULT_PASSWORD="${line}"

# Set the terminal title.
echo -ne "\033]0;$(basename $PWD)\007"

if [ -f ~/.bash_aliases ]
then
  . ~/.bash_aliases
fi
