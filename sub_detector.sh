#!/bin/bash
#R3-S7S
url=$1
if [ -z $url ];then
echo "Error: Enter website! :)"
echo "Example -> yahoo.com,google.com Or facebook.com"
else
if [ ! -d $url ];then
mkdir $url
cd $url
else
cd $url
fi
fi
assetfinder $url > subs.txt
c=0
for sub in `cat subs.txt`
do
if [[ `ping -c 1 $sub 2> /dev/null` ]]
then
echo "$sub +++++++++++> pong"
(( c++ ))
else
echo "$sub -----------> error/down"
 (( c++ ))
fi

done
echo "number of subdomain is $c"
echo "github :https://github.com/ELHussein565"
