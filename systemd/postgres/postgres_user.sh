#!/bin/bash -x

__mod_user() {
usermod -G wheel postgres
}

__create_db() {
# su --login postgres --command "/usr/bin/postgres -D /var/lib/pgsql/data -p 5432" &


yum -y install postgresql-server postgresql postgresql-contrib; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
systemctl enable postgresql.service

exec /usr/sbin/init &
systemctl start postgresql
ps aux | grep init
systemctl status postgreql
/usr/bin/postgresql-setup initdb
sleep 10
ps aux 

su --login - postgres --command "psql -c \"CREATE USER dockeruser with CREATEROLE superuser PASSWORD 'password';\""
su --login - postgres --command "psql -c \"CREATE DATABASE dockerdb;\""
su --login - postgres --command "psql -c \"\du;\""
}

# Call functions
__mod_user
__create_db
