FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install sshpass software-properties-common && apt-add-repository ppa:ansible/ansible && apt-get update && apt-get -y install ansible python-dev libkrb5-dev krb5-user wget gcc && apt-get -y install vim python3-pip python3-dev python-pip python-dev 
RUN pip install pywinrm kerberos requests_kerberos botocore boto3 pyvmomi
RUN pip install python-openstackclient python-neutronclient python-barbicanclient
