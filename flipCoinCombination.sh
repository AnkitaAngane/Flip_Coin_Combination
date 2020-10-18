#! /bin/bash

#Author:Ankita Angane
#Flip Coin Combination Program

#UC1:Flip a single coin to get Heads or Tails as a winner

#Declaration
declare -A singlate

singlate[h]=0
singlate[t]=0
n=1

function percentage(){

	percen=`awk "BEGIN{print ($1*100/21)}"`
	echo "$percen"
}

#Singlate Calculation
while [ $n -le 21 ]
do
	result=$((RANDOM%2))
	if [ $result -eq 0 ]
	then
		singlate[h]=$((${singlate[h]}+1))
	else
		singlate[t]=$((${singlate[t]}+1))
	fi
	n=$((n+1))

done

echo "COUNTS for Singlate are as below "
echo ${!singlate[@]}
echo ${singlate[@]}

echo "Percentage of Winning HEAD is "
percentage ${singlate[h]}

echo "Percentage of Winning TAIL is"
percentage ${singlate[t]}
