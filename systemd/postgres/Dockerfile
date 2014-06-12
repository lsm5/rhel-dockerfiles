FROM registry.access.redhat.com/redhat/rhel7beta
MAINTAINER scollier <scollier@redhat.com>

ENV container docker

RUN yum -y update; yum clean all
RUN yum -y install postgresql-server postgresql postgresql-contrib; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
systemctl enable postgresql.service

VOLUME [ "/sys/fs/cgroup" ]

# ADD ./postgresql-setup /usr/bin/postgresql-setup
ADD ./postgres_user.sh /postgres_user.sh

# RUN chmod +x /usr/bin/postgresql-setup
RUN chmod +x /postgres_user.sh

# RUN /usr/bin/postgresql-setup initdb

# ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf

# RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

RUN echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf

RUN /postgres_user.sh

EXPOSE 5432

USER postgres
# CMD [ "/usr/bin/postgres", "-D", "/var/lib/pgsql/data", "-p", "5432" ]
CMD [ "/usr/sbin/init" ]



