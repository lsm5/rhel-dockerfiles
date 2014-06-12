FROM 10.3.13.125:5000/brew/rhel7:latest
MAINTAINER William Henry <whenry@redhat.com>

RUN yum -y update
RUN yum install -y python-qpid qpid-cpp-server && yum clean 
all

ADD . /.qpidd

WORKDIR /.qpidd

EXPOSE 5672

ENTRYPOINT ["qpidd", "-t", "--auth=no"]`
