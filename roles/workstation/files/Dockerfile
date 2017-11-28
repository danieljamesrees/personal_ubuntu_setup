FROM ubuntu:artful-20171019

# Could use tar instead of unzip, but I want the image to have common packages anyway.
RUN apt-get update \
  && apt-get install --yes ansible git sudo unzip \
  && rm --recursive --force /var/lib/apt/lists/* \
  && useradd dan --create-home \
  && adduser dan sudo \
  && sed --in-place 's/%sudo.ALL=(ALL:ALL) ALL/%sudo  ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers \
  && mkdir /home/dan/Projects \
  && cd /home/dan/Projects \
  && git clone https://github.com/danieljamesrees/personal_ubuntu_setup.git \
  && chown --recursive dan: /home/dan

# Need to use docker secrets to set up the vault password and the user password for sudo
#  && useradd dan --create-home --password=THIS \
#  && cd personal_ubuntu_setup \
#  && ansible-playbook playbooks/setup_ansible.yml --verbose \
