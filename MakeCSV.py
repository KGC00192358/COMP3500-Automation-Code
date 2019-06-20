#!/usr/bin/python
import sys
import os
import re

def create_csv(summaryFile, csvFile):
	os.chdir("/home/u3/kgc0019/COMP3500-Labs/lab3/TEST_RESULTS")
	scheduling = ""
	ATAT = 0
	ART = 0
	CBT = 0
	T = 0
	AWT = 0
	JQ = 0
	comma = ", "

	with open(summaryFile) as dataFile:
		with open(csvFile, 'a') as inFile:
			for line in dataFile:
				if line.startswith("Summary"):
					line = re.sub('Summary for', '', line)
					line = line.strip()
					scheduling = line
				if "JQ" in line:
					line = re.sub('[A-Za-z]', '', line)
					line = line.strip()
					line = line[1:]
					ATAT, ART, CBT, T, AWT, JQ = line.split("=")
					outline = scheduling + comma + ATAT + comma + ART + comma + CBT + comma + T + comma + AWT + comma + JQ
					inFile.write(outline)
					inFile.write("\n")

create_csv(sys.argv[1], sys.argv[2])

