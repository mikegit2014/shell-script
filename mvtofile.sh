#! /bin/bash
#把当前目录下，所有大于10k的文件移动到/tmp下
start=$(date +%N)
localdir=`echo $PWD`
todir='/tmp/old/'
find $localdir -type f -size +10 -exec cp {} $todir  \;
ls -al $todir
echo "Done!"
end=$(date +%N)
declare -i differ=$end-$start
echo "Time taken to exec is $differ"


function lsinfo()
{
	cd ~
	ls -al 
	echo "list all files ${1}${2}";
	echo 'first:'$1;
	echo $2;
	echo "$@";
	echo "$*"
}

lsinfo 123 456;

count=0
for img in  ~/pic/*.png ~/pic/*.jpg

do
new=image-$count.${img##*.}
mv "$img" "~/pic/$new" 2> /dev/null
if [ $? -eq 0 ];
then
 echo "Rename $img to $new"
 let count++
 fi
 done

