FROM ubuntu:18.04
RUN apt update && apt upgrade wget awscli unzip python3 python3-pip -y
WORKDIR /boxfuse
RUN wget https://hashicorp-releases.yandexcloud.net/terraform/1.7.5/terraform_1.7.5_linux_arm64.zip \
    && unzip terraform_1.7.5_linux_arm64.zip
RUN rm terraform_1.7.5_linux_arm64.zip
RUN pwd
RUN ls -la
RUN cp terraform /bin/terraform
#RUN apt install software-properties-common
#RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt install ansible -y
RUN ls -sa /etc/ansible
RUN pwd
RUN ls -la
