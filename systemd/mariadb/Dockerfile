FROM registry.access.redhat.com/redhat/rhel7beta
MAINTAINER scollier <scollier@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install net-tools psmisc mariadb-server mariadb; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
systemctl enable mariadb.service

ADD ./config_mariadb.sh /config_mariadb.sh

RUN chmod 755 /config_mariadb.sh
RUN /config_mariadb.sh
VOLUME [ "/sys/fs/cgroup" ]

ENV container docker

EXPOSE 3306

CMD [ "/usr/sbin/init" ]

