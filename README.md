# Vagrant FTP Server and Client
## FTP Server

* CPU cores: 2
* RAM: 512MB
* Name: ftp-server
* Provider: Virtual Box
* OS: ubuntu/xenial64
* Service: vsftpd FTP Server
* FTP Server IP: 192.168.10.20
* FTP-Login: vagrant/vagrant




TCP Portfreigaben/forward to Host:
* 20
* 21
* 30000-30100

Generating a  "testfile.txt"

## Client

* CPU cores: 2
* RAM: 512MB
* Name: client
* Provider: Virtual Box
* OS: ubuntu/trusty64
* IP: 192.168.10.25



## Beschreibung

FTP server ist unter 192.168.10.20 erreichbar, von Windows Host und zweiter VM. VM Client holt testfile.txt von ftp server. Von (Server: /home/vagrant) nach (Client:/home/vagrant). Dieses Testfile.txt kann auch mit dem Windows Host über z.B Filezilla gedownloadet werden.