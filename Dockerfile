FROM ubuntu:latest

RUN apt update && apt -y upgrade &&\
    apt install -y sudo vim zsh git wget

ARG username
ARG password=password
RUN useradd -m $username && usermod -aG sudo $username && usermod --shell /bin/zsh $username
RUN echo "$username:$password" | chpasswd

USER $username
WORKDIR /home/$username