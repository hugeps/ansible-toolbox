FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install sshpass software-properties-common && apt-add-repository ppa:ansible/ansible && apt-get update && apt-get -y install ansible python-dev libkrb5-dev krb5-user wget gcc && apt-get -y install vim python3-pip python3-dev python-pip python-dev unzip
RUN pip install pywinrm kerberos requests_kerberos botocore boto3 pyvmomi python-openstackclient python-neutronclient python-barbicanclient
RUN cd /usr/local/bin && wget https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip -O terraform.zip && unzip terraform.zip
RUN cd /usr/local/bin && wget https://releases.hashicorp.com/packer/1.5.4/packer_1.5.4_linux_amd64.zip -O packer.zip && unzip packer.zip
COPY main.tf /usr/local/bin/
RUN cd /usr/local/bin && terraform init
