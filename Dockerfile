FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt -y upgrade &&\
    apt install -y sudo vim zsh git make ansible

ARG username
ARG password=password
ENV ANSIBLE_BECOME_PASS=$password

RUN useradd $username && usermod -aG sudo $username && usermod --shell /bin/zsh $username
RUN echo "$username:$password" | chpasswd

USER $username
WORKDIR /home/$username
SHELL ["/bin/zsh"]
ENTRYPOINT ["/bin/zsh", "-d", "-f"]