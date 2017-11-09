FROM ubuntu:latest

RUN cd /root; \
    wget --no-check-certificate -O personal_ubuntu_setup.zip https://github.com/danieljamesrees/personal_ubuntu_setup.git; \
    unzip personal_ubuntu_setup.zip; \
    cd personal_ubuntu_setup; \
    ansible-playbook playbooks/container/setup_workstation_container.yml
