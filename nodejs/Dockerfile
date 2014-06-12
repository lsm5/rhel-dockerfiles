FROM 10.3.13.125:5000/brew/rhel7:latest
MAINTAINER "Jason Clark" <jclark@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install npm; yum clean all

ADD . /src

RUN cd /src; npm install

EXPOSE 8080

CMD ["node", "/src/index.js"]
