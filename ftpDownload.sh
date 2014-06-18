#! /bin/bash
#DATE=`date -d "now" +%m%d%y`
DATE=`date -d "now" +%Y%m%d`
ftpServer=127.0.0.1
ftpUser=mike
ftpPasswd=123
remoteDir=/home/www
localDir=/tmp/backup/download

/usr/bin/ftp -niv <<!
open $ftpServer
user $ftpUser $ftpPasswd
binary
cd $remoteDir
lcd $localDir
mget phpmyadmin-$DATE.sql.gz
bye
!
