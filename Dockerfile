FROM ubuntu:20.04
RUN apt update && apt upgrade wget unzip python3 python3-pip -y
RUN wget https://hashicorp-releases.yandexcloud.net/terraform/1.7.5/terraform_1.7.5_linux_arm64.zip \
    && unzip terraform_1.7.5_linux_arm64.zip
#RUN apt install software-properties-common
#RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install ansible -y
