FROM ubuntu:artful-20171019

# Could use tar instead of unzip, but I want the image to have common packages anyway.
RUN apt-get update \
  && apt-get install --yes ansible git sudo unzip \
  && rm --recursive --force /var/lib/apt/lists/* \
  && useradd dan --create-home \
  && cd /home/dan \
  && git clone https://github.com/danieljamesrees/personal_ubuntu_setup.git \
  && chown --recursive dan: personal_ubuntu_setup-master
