FROM oraclelinux:8.5

RUN dnf -y install openssh-server coreutils &&\
    dnf clean all

RUN groupadd -r sftponly &&\
    useradd -m -g sftponly -b /home -s /bin/bash -c 'SFTP account for username' sftpuser
ADD etc/ssh/* /etc/ssh/

USER sftpuser
RUN ls -alh $HOME
RUN mkdir -p $HOME/.ssh &&\
    chmod 700 $HOME/.ssh

USER root
ENTRYPOINT [ "/usr/sbin/sshd"]
CMD [ "-D" ]