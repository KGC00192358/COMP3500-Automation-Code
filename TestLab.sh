#!/bin/bash
read -p "Wich lab?[123]" -n 1 -r
if [[ $REPLY == "1" ]]
then
declare -a TESTS=("FCFS" "SJF" "RR1MS" "RR5MS" "RR10MS" "RR15MS" "RR20MS" "RR25MS" "RR50MS")
declare -a QUANTA=(1 5 10 15 20 25 50)
CURRENTQ=0

cd /home/u3/kgc0019/COMP3500-Labs/lab1
mkdir "./TEST_RESULTS"
cd ./TEST_RESULTS
	for TEST in "${TESTS[@]}"
	do
		if [ -f "$TEST" ]
		then
			read -p " $TEST Found, Overwite? " -n 1 -r
			echo
			if [[ $REPLY =~ ^[Yy]$ ]]
			then	
				echo "Testing $TEST..."
				if [[ $TEST == "FCFS" ]]
				then
					../pm 1 >> "$TEST"
				fi 
				if [[ $TEST == "SJF" ]]
				then
					../pm 2 >> "$TEST"
				fi
				if [[ $TEST == RR* ]]
				then
					echo "Test with Q = ${QUANTA[$CURRENTQ]}"
					../pm 3 ${QUANTA[$CURRENTQ]} >> "$TEST"
					CURRENTQ=$CURRENTQ+1
				fi
			fi
		else
			touch "$TEST"
			echo "Testing $TEST..."
			if [[ $TEST == "FCFS" ]]
			then
				../pm 1 >> "$TEST"
			fi 
			if [[ $TEST == "SJF" ]]
			then
				../pm 2 >> "$TEST"
			fi
			if [[ $TEST == RR* ]]
			then
				echo "Test with Q = ${QUANTA[$CURRENTQ]}"
				../pm 3 ${QUANTA[$CURRENTQ]} >> "$TEST"
				CURRENTQ=$CURRENTQ+1
			fi
		fi
		echo "$TEST test results: " >> "Summary"
		sed -n 1253,1261p "$TEST">tmp
		cat tmp >> "Summary"
		(cat ""; echo) >> "Summary"	
		echo "$TEST test complete!"
	done
fi
if [[ $REPLY == "2" ]]
then
	declare -a TESTS=("PARTONE" "PARTTWO")
fi

