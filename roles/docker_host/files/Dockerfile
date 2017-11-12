FROM ubuntu:latest

# Could use tar instead of unzip, but I want the image to have common packages anyway.
RUN apt-get update \
  && apt-get install -y ansible,unzip,wget \
  && rm -rf /var/lib/apt/lists/* \
  && useradd dan --create-home \
  && cd /root \
  && wget --no-check-certificate -O personal_ubuntu_setup.zip https://github.com/danieljamesrees/personal_ubuntu_setup/archive/master.zip \
  && unzip personal_ubuntu_setup.zip \
  && cd personal_ubuntu_setup-master \
  && ansible-playbook playbooks/container/setup_workstation_container.yml
