# Version: 0.0.1
# @edt M06 2018-2019
# hostsamba
# -------------------------------------
FROM fedora:27
LABEL author="@edt ASIX M06-ASO"
LABEL description="host SAMBA 2018-2019"
RUN dnf -y install procps passwd openldap-clients nss-pam-ldapd samba samba-client 
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh /opt/docker/installdir.sh /opt/docker/samba_users.sh
WORKDIR /opt/docker
CMD ["/opt/docker/startup.sh"]
