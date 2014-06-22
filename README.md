Based on Ubuntu 14.04

This is a Dockerfile setup for sabnzbd - http://sabnzbd.org/
With par2 multithreaded - http://chuchusoft.com/par2_tbb/

To run:

docker run -d --name="sabnzbd" -v /path/to/nzbdrone/data:/config -v /path/to/downloads:/downloads -p hostport:8080 -p hostport:9090 sensei73/sabnzbd


Thanks to jpon, nas, needo and limetech.
