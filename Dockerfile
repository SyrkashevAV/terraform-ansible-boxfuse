FROM ubuntu:20.04
RUN ls
RUN apt update && apt install -y gnupg software-properties-common curl
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt update && apt install terraform
RUN apt install software-properties-common && add-apt-repository --yes --update ppa:ansible/ansible && apt install ansible -y