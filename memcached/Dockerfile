FROM 10.3.13.125:5000/brew/rhel7:latest
MAINTAINER  scollier <scollier@redhat.com>

RUN  yum -y update; yum clean all
RUN yum -y install memcached; yum clean all

EXPOSE  11211

CMD  ["memcached", "-u", "daemon"]
