#!/bin/bash
path=$1
echo $path
files=$(ls $path)
if [ ! -d "$path/src" ];then
	mkdir "$path/src"
fi

if [ ! -d "$path/fix" ];then
	mkdir "$path/fix"
fi

num="1234567890"
for filename in $files
do

	result=$(echo $num | grep "$filename")
	if [[ "$result" != "" ]];then
		echo "$path/$filename"
		java -jar baksmali-2.2.7.jar d "$path/$filename" -o "$path/src/$filename"
		java -jar smali-2.2.7.jar a "$path/src/$filename" -o "$path/fix/$filename.dex"
	fi

done




