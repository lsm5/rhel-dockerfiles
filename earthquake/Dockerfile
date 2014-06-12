FROM 10.3.13.125:5000/brew/rhel7:latest

MAINTAINER "Maciej Lasyk" <maciek@lasyk.info>

# install main packages:
RUN yum -y update; yum clean all
RUN yum -y install openssl-devel openssl readline readline-devel gcc gcc-c++ rubygems rubygems-devel ruby ruby-devel; yum clean all

# install earthquake
RUN gem install earthquake

# set the env:
RUN useradd -d /home/twitter twitter
USER twitter 
ENV HOME /home/twitter
WORKDIR /home/twitter

CMD ["earthquake"]
