FROM debian:stretch-slim
RUN apt-get update && apt-get -y install apt-utils
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN  apt-get -y install nvme-cli mdadm cryptsetup && apt-get -y clean && apt-get -y autoremove
COPY aks-nvme-ssd-provisioner.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/aks-nvme-ssd-provisioner.sh

ENTRYPOINT ["aks-nvme-ssd-provisioner.sh"]
