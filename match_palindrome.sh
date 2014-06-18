#! /bin/bash
#检验某个字符串是否为回文。
#回文：（palindrome）可以时单词，短语，数字等，其特点时从任何一个方向读来，无论从左至右，还是从右至左，都会得到同样的结果，例如acca,"was it a rat I sam "ABBA,ABA
if [ $# -ne 2 ]
then
	echo "Usage: $0 filename string_length"
	exit -1
fi

filename=$1
basepattern='/^\(.\)'
declare -i count=$2/2
#echo $count

for((i=1;i<$count;i++))
do
	basepattern=$basepattern'\(.\)'
done
#echo $basepattern
if [ $(($2%2)) -ne 0 ]
then
	basepattern=$basepattern'.'
fi
#echo $basepattern;
for ((count;count>0;count--))
do
	basepattern=$basepattern'\'"$count"
done
#echo $basepattern
basepattern=$basepattern'$/p'

echo $basepattern
sed -n "$basepattern" $filename

#翻转词语
sentence='this is line from sentence'
echo $sentence | rev | tr ' ' '\n' | tac | tr '\n' ' ' | rev
	
