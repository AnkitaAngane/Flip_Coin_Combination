#! /bin/bash

#Author:Ankita Angane
#Flip Coin Combination Program

#UC1:Flip a single coin to get Heads or Tails as a winner

#Declaration
declare -A singlet
declare -A doublet
declare -A triplet

singlet[h]=0
singlet[t]=0

doublet[hh]=0
doublet[ht]=0
doublet[tt]=0
doublet[th]=0

triplet[hhh]=0
triplet[hht]=0
triplet[hth]=0
triplet[htt]=0
triplet[thh]=0
triplet[tht]=0
triplet[tth]=0
triplet[ttt]=0

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
	result3=$((RANDOM%3))

	#For Singlet
	if [ $result -eq 0 ]
	then
		singlet[h]=$((${singlet[h]}+1))
	else
		singlet[t]=$((${singlet[t]}+1))
	fi

	#For Doublet
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

	#For Triplet
	if [ $result -eq 0 ]
	then
		if [ $result2 -eq 0 ]
                then
			if [ $result3 -eq 0 ]
                	then
				triplet[hhh]=$((${triplet[hhh]}+1))
			else
				triplet[hht]=$((${triplet[hht]}+1))
			fi
		else
			if [ $result3 -eq 0 ]
                        then
                                triplet[hth]=$((${triplet[hth]}+1))
                        else
                                triplet[htt]=$((${triplet[htt]}+1))
                        fi
		fi
	else
		if [ $result2 -eq 0 ]
                then
                        if [ $result3 -eq 0 ]
                        then
                                triplet[thh]=$((${triplet[thh]}+1))
                        else
                                triplet[tht]=$((${triplet[tht]}+1))
                        fi
                else
                        if [ $result3 -eq 0 ]
                        then
                                triplet[tth]=$((${triplet[tth]}+1))
                        else
                                triplet[ttt]=$((${triplet[ttt]}+1))
                        fi
                fi
	fi

	n=$((n+1))

done

echo "SINGLET CALCULATION"
echo "COUNTS for SINGLET are as below "
echo ${!singlet[@]}
echo ${singlet[@]}

echo "Percentage count for HEAD is "
percentage ${singlet[h]}

echo "Percentage count for TAIL is "
percentage ${singlet[t]}


echo "DOUBLET CALCULATION"
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


echo "TRIPLET CALCULATION"
echo "COUNTS for TRIPLET are as below "
echo ${!triplet[@]}
echo ${triplet[@]}

echo "Percentage count for HHH occurrence "
percentage ${triplet[hhh]}

echo "Percentage count for HHH occurrence "
percentage ${triplet[hht]=0}

echo "Percentage count for HHH occurrence "
percentage ${triplet[hth]=0}

echo "Percentage count for HHH occurrence "
percentage ${triplet[htt]=0}

echo "Percentage count for HHH occurrence "
percentage ${triplet[thh]=0}

echo "Percentage count for HHH occurrence "
percentage ${triplet[tht]=0}

echo "Percentage count for HHH occurrence "
percentage ${triplet[tth]=0}

echo "Percentage count for HHH occurrence "
percentage ${triplet[ttt]=0}



#for k in "${!doublet[@]}"
#do
#	echo "$k = ${doublet[$k]}"
#done | sort -rn -k3

if [ ${singlet[h]} -gt ${singlet[t]} ]
then
	echo "WINNER of SINGLET Combination is h who won ${singlet[h]} times"
else
	echo "WINNER of SINGLET Combination is t who won ${singlet[t]} times"
fi


maxdoublet=${doublet[hh]}
maxdoubletkey=hh

for k in "${!doublet[@]}"
do
	if [ "$maxdoublet" -lt "${doublet[$k]}" ]
	then
		maxdoublet="${doublet[$k]}"
		maxdoubletkey="$k"
	elif [ "$maxdoublet" -eq "${doublet[$k]}" ]
        then
                maxdoubletkey="$maxdoubletkey + $k"
        fi

done

echo "WINNER for DOUBLET Combination is $maxdoubletkey who won $maxdoublet times."

maxtriplet=${triplet[hhh]}
maxtripletkey=hhh

for k in "${!triplet[@]}"
do
        if [ "$maxtriplet" -lt "${triplet[$k]}" ]
        then
                maxtriplet="${triplet[$k]}"
                maxtripletkey="$k"
        elif [ "$maxtriplet" -eq "${triplet[$k]}" ]
        then
                maxtripletkey="$maxtripletkey + $k"
        fi

done

echo "WINNER for TRIPLET Combination is $maxtripletkey who won $maxtriplet times."

