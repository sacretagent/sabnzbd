FROM ubuntu:14.04
MAINTAINER -=SeNsEi73=- <sensei73@gmail.com>
 
ENV DEBIAN_FRONTEND noninteractive
 
RUN locale-gen en_US en_US.UTF-8

# Install Sabnzbd Dependencies & clean
RUN sudo apt-get install -y software-properties-common

RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) multiverse"
RUN apt-get update -q
RUN apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush python-yenc unrar unzip
RUN apt-get clean

# Install par2 multithreaded / dirty but it works!
apt-get remove --purge -y par2
ADD http://www.chuchusoft.com/par2_tbb/par2cmdline-0.4-tbb-20100203-lin64.tar.gz par2cmdline-0.4-tbb-20100203-lin64.tar.gz
RUN tar -zxvf par2cmdline-0.4-tbb-20100203-lin64.tar.gz
RUN rm par2cmdline-0.4-tbb-20100203-lin64.tar.gz
RUN cp par2cmdline-0.4-tbb-20100203-lin64/par2 /usr/bin/
RUN cp par2cmdline-0.4-tbb-20100203-lin64/libtbb* /usr/bin
RUN rm -rf par2cmdline-0.4-tbb-20100203-lin64
RUN chmod 777 /usr/bin/par2
RUN chmod +x /usr/bin/par2

# Sabnzbd configuration 
VOLUME /config

#Downloads repertory
VOLUME /downloads
 
EXPOSE 8080 9090

# run as nobody instead of root & fix permissions  
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody
RUN chown nobody:users /usr/bin/par2
RUN chown -R nobody:users /usr/bin/sabnzbdplus
USER nobody 

ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file", "/config", "--server", ":8080"]
