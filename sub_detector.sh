#!/bin/bash
#R3-S7S
url=$1
typeScan=$2

if [ -z $url ];then
echo "Error: Enter website! :)"
echo "Example -> bash sub_detector.sh yahoo.com {number of type Scanning}"
echo "select type Scanner ports {1->quick scan | 2-> frist 1000 ports | 3-> aggressive}"
exit
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
mkdir $sub
cd $sub
echo $sub > $sub.txt
cd ..
if [ ! -z $typeScan ];then
if [[ $typeScan == 1 ]];then
nmap -T4 $sub | tee -a $sub.text
elif [[ $typeScan ==  2 ]];then
nmap $sub | tee -a $sub.text
elif [[ $typeScan == 3 ]];then
nmap -sV $sub  | tee -a $sub.text
fi
else
echo "you don't select type scanning!!!"
fi
(( c++ ))
else
echo "$sub -----------> error/down"
 (( c++ ))
fi
done
echo "number of subdomain is $c"

echo "github: https://github.com/ELHussein565"
