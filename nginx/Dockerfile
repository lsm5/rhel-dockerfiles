FROM 10.3.13.125:5000/brew/rhel7:latest
MAINTAINER scollier <scollier@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install nginx; yum clean all
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN echo "nginx on Fedora" > /usr/share/nginx/html/index.html

EXPOSE 80

CMD [ "/usr/sbin/nginx" ]

