FROM ubuntu:latest

#general update
RUN apt-get -y update
RUN apt-get -y upgrade

#set locales
RUN apt-get install -y --fix-missing locales locales-all
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV TZ=Europe/Moscow

RUN apt-get install -y cmake nano
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y gcc
RUN apt-get install -y g++-13

#set up ssh
COPY "./.auth" "/root/.ssh/authorized_keys"
RUN chmod 600 /root/.ssh/authorized_keys
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN apt-get install -y clangd