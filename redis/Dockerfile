FROM 10.3.13.125:5000/brew/rhel7:latest
MAINTAINER Aditya Patawari <adimania@fedoraproject.org>

RUN yum -y update
RUN yum -y install redis

EXPOSE 6379

CMD [ "redis-server" ]

