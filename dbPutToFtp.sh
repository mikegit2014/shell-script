#! /bin/bash
DATE=`date -d "now" +%Y%m%d`
ftpServer=127.0.0.1
ftpUser=mike
ftpPasswd=123
remoteDir=/tmp/backup/upload
localDir=/tmp/backup/db

/usr/bin/ftp -niv <<!
open $ftpServer
user $ftpUser $ftpPasswd
binary
cd $remoteDir
lcd $localDir
mput phpmyadmin-$DATE.sql.gz
bye
!
