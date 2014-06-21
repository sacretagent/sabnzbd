FROM ubuntu:latest
MAINTAINER -=SeNsEi73=- <sensei73@gmail.com>
 
ENV DEBIAN_FRONTEND noninteractive
 
RUN locale-gen en_US en_US.UTF-8

RUN sudo apt-get install -y python-software-properties
RUN add-apt-repository -y ppa:jcfp/ppa
RUN apt-get update -q
RUN apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush
 
VOLUME /config
VOLUME /data
 
EXPOSE 8080 9090
 
ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file", "/config", "--server", ":8080"]
