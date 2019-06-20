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
	cd /home/u3/kgc0019/COMP3500-Labs/lab2
	mkdir "./TEST_RESULTS"
	cd ./TEST_RESULTS/
	declare -a TESTS=("PARTONE" "PARTTWO")
	for TEST in "${TESTS[@]}"
	do
		if [ ! -f $TEST ]
		then
			touch $TEST	
		fi
		if [[ $TEST == "PARTONE" ]]
		then
			../lab2-1 >> $TEST
		else
			../lab2-2 >> $TEST
		fi
	done
fi
if [[ $REPLY == "3" ]]
then
	declare -a TESTS=("FCFS" "SJF" "RR10MS" "RR20MS" "RR50MS" "RR250MS" "RR500MS")
	declare -a SUMFILELIST=()
	SUMFILE="Summary$TEST$POL"
	CSVFILE="CSVFILE$TEST$POL"
	declare -a QUANTA=(10 20 50 250 500)
	CURRENTQ=0
	POL="PAGING8192BYTE"
	cd /home/u3/kgc0019/COMP3500-Labs/lab3		
	mkdir "./TEST_RESULTS"
	cd ./TEST_RESULTS
	for TEST in "${TESTS[@]}"
	do

		FILE="$TEST$POL"
		SUMFILE="Summary$TEST$POL"
		CSVFILE="CSV$TEST$POL"
		touch $FILE
		touch $SUMFILE
		echo "Testing $TEST$POL..."
		if [[ $TEST$POL == FCFS* ]]
		then
			../pm 1 >> $FILE
		fi 
		if [[ $TEST$POL == SJF* ]]
		then
			
			../pm 2 >> $FILE
		fi
		if [[ $TEST$POL == RR* ]]
		then
			
			echo "Test with Q = ${QUANTA[$CURRENTQ]}"
			../pm 3 ${QUANTA[$CURRENTQ]} >> $FILE
			CURRENTQ=$CURRENTQ+1
		fi
		/home/u3/kgc0019/COMP3500-Labs/COMP3500-Automation-Code/MakeSummary.py $FILE $SUMFILE 
		/home/u3/kgc0019/COMP3500-Labs/COMP3500-Automation-Code/MakeCSV.py $SUMFILE $CSVFILE
	done

fi

