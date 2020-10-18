#! /bin/bash

#Author:Ankita Angane
#Flip Coin Combination Program

#UC1:Flip a single coin to get Heads or Tails as a winner

result=$((RANDOM%2))
if [ $result -eq 0 ]
then
	echo "HEADS is a Winner!"
else
	echo "TAILS is a Winner!"
fi
