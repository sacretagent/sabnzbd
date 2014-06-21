FROM ubuntu:latest
MAINTAINER -=SeNsEi73=- <sensei73@gmail.com>
 
ENV DEBIAN_FRONTEND noninteractive
 
RUN locale-gen en_US en_US.UTF-8

RUN sudo apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:jcfp/ppa
RUN apt-get update -q
RUN apt-get install -qy --force-yes sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush libttb2 libtbb-dev

apt-get remove --purge -y par2
ADD http://www.chuchusoft.com/par2_tbb/par2cmdline-0.4-tbb-20100203-lin64.tar.gz par2cmdline-0.4-tbb-20100203-lin64.tar.gz
RUN tar -zxvf par2cmdline-0.4-tbb-20100203-lin64.tar.gz
RUN rm par2cmdline-0.4-tbb-20100203-lin64.tar.gz
RUN cp par2cmdline-0.4-tbb-20100203-lin64/par2 /usr/bin/
RUN rm -rf par2cmdline-0.4-tbb-20100203-lin64
RUN chmod 777 /usr/bin/par2
RUN chmod +x /usr/bin/par2
 
VOLUME /config
VOLUME /data
 
EXPOSE 8080 9090
 
ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file", "/config", "--server", ":8080"]
