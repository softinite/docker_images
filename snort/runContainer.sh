docker run -d --name=snort -e HOME_NET=192.168.1.0/24 -e INTERFACE=eth0 -e AD=192.168.1.241 --net=host --cap-add=NET_ADMIN snort:1.0.0
