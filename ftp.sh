#!/bin/bash
HOST='192.168.10.20'
USER='vagrant'
PASSWD='vagrant'

ftp -n -v $HOST << EOT
user $USER $PASSWD
get "testfile.txt"
bye
EOT
