#! /bin/bash

#Author:Ankita Angane
#Flip Coin Combination Program

#UC1:Flip a single coin to get Heads or Tails as a winner

#Declaration
declare -A singlet
declare -A doublet

singlet[h]=0
singlet[t]=0

dictsinglet[0]=0
dictsinglet[1]=0

doublet[hh]=0
doublet[ht]=0
doublet[tt]=0
doublet[th]=0

dictdoublet[0]=0
dictdoublet[1]=0
dictdoublet[2]=0
dictdoublet[3]=0

n=1

function percentage(){

	percen=`awk "BEGIN{print ($1*100/21)}"`
	echo "$percen"
}

#Singlate Calculation
while [ $n -le 21 ]
do
	result=$((RANDOM%2))
	result2=$((RANDOM%2))
	if [ $result -eq 0 ]
	then
		singlet[h]=$((${singlet[h]}+1))
	else
		singlet[t]=$((${singlet[t]}+1))
	fi

	if [ $result -eq 0 ]
	then
		if [ $result2 -eq 0 ]
		then
			doublet[hh]=$((${doublet[hh]}+1))
		else
			doublet[ht]=$((${doublet[ht]}+1))
		fi
	else
		if [ $result2 -eq 0 ]
		then
			doublet[th]=$((${doublet[th]}+1))
		else
			doublet[tt]=$((${doublet[tt]}+1))
		fi
	fi

	n=$((n+1))

done

echo "COUNTS for SINGLET are as below "
echo ${!singlet[@]}
echo ${singlet[@]}

echo "Percentage count for HEAD is "
percentage ${singlet[h]}

echo "Percentage count for TAIL is "
percentage ${singlet[t]}

echo "COUNTS for DOUBLET are as below "
echo ${!doublet[@]}
echo ${doublet[@]}

echo "Percentage count for HH occurrence "
percentage ${doublet[hh]}

echo "Percentage count for HT occurrence "
percentage ${doublet[ht]}

echo "Percentage count for TT occurrence "
percentage ${doublet[tt]}

echo "Percentage count for TH occurrence "
percentage ${doublet[th]}



