FROM ubuntu:22.04
RUN apt update && apt upgrade wget unzip -y
RUN wget https://hashicorp-releases.yandexcloud.net/terraform/1.7.5/terraform_1.7.5_linux_arm64.zip \
    && unzip terraform_1.7.5_linux_arm64.zip
ENV LC_ALL=C.UTF-8
RUN apt install software-properties-common
RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install ansible -y
