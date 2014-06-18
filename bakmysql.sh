#! /bin/bash
date >> /tmp/time.log
#scriptsDir=`/tmp`
user=root
userPWD=123
dbNames="phpmyadmin"
dataBackUpDir=/tmp/backup
eMailFile=$dataBackUpDir/log/email.txt
eMail=tianxubao@1688zx.com
logFile=$dataBackUpDir/log/mysqlbackup.log
DATE=`date -d "now" +%Y%m%d`
echo `date -d "now" "+%Y-%m-%d %H:%M:%S"` > $eMailFile
for dbName in $dbNames
do
	dumpFile=$dataBackUpDir/db/$dbName-$DATE.sql.gz
	tmpFile = $dataBackUpDir/db/$dbName-$DATE.tar.gz
	mysqldump -u$user -p$userPWD $dbName | gzip > $dumpFile
done

if [ $? -eq 0 ]; then
	echo "DataBase Backup Success!" >> $eMailFile
else
    echo "DataBase Backup Fail!" >> $eMailFile
fi

echo "================" >> $logFile
cat $eMailFile >> $logFile
echo $dumpFile >> $logFile

