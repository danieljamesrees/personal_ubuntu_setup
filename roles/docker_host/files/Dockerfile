FROM ubuntu:artful-20171019

# Could use tar instead of unzip, but I want the image to have common packages anyway.
RUN apt-get update \
  && apt-get install -y ansible sudo unzip vim wget \
  && rm -rf /var/lib/apt/lists/* \
  && useradd dan --create-home \
  && cd /home/dan \
  && wget --no-check-certificate -O personal_ubuntu_setup.zip https://github.com/danieljamesrees/personal_ubuntu_setup/archive/master.zip \
  && unzip personal_ubuntu_setup.zip \
  && chown dan: personal_ubuntu_setup.zip \
  && chown --recursive dan: personal_ubuntu_setup-master
