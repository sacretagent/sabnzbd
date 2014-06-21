FROM ubuntu:latest
MAINTAINER -=SeNsEi73=- <sensei73@gmail.com>
 
ENV DEBIAN_FRONTEND noninteractive
 
RUN locale-gen en_US en_US.UTF-8
 
RUN sudo add-apt-repository ppa:jcfp/ppa
RUN echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu $(lsb_release -c -s) main" | sudo tee -a /etc/apt/sources.list && sudo aptkey adv --keyserver hkp://keyserver.ubuntu.com:11371 --recv-keys 0x98703123E0F52B2BE16D586EF13930B14BB9F05F
 
RUN apt-get update -q
RUN apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush python-yenc unrar unzip
 
VOLUME /config
VOLUME /data
 
EXPOSE 8080 9090
 
ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file", "/config", "--server", ":8080"]
