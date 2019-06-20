#!/usr/bin/python
import sys
import os

def create_files(fileIn, fileOut):
    os.chdir("/home/u3/kgc0019/COMP3500-Labs/lab3/TEST_RESULTS")
    behind_the_scenes = 'Behind Thee Scenes Numbers'
    run_data = 'Processes Managemenent Numbers'
    with open(fileIn) as fulldata:
        with open(fileOut, 'a') as summaryfile:
	    summaryfile.write("Summary for " + fileIn + "\n")
            for line in fulldata:
		    if behind_the_scenes in line or run_data in line:
                    	summaryfile.write(line)
			summaryfile.write(fulldata.next())
			summaryfile.write(fulldata.next())
			summaryfile.write(fulldata.next())
			summaryfile.write("\n")


#    turnAroundTimes = []
#    pids = []
#    jats = []
#    tjds = []
#    mems = []
#    comma = ","
#
#    with open(fileOut) as file1:
#        for line in file1:
#            if line.startswith("*") or line.startswith("P") or line.startswith("N") or line.startswith("A"):
#                continue
#
#            else:
#                # make line look like PID, JAT, TJD
#                turnAround = line[1:12].replace(" ", "")
#                pidValue = line[19:22].replace(" ", "")
#                jatValue = line[29:39].replace(" ", "")
#                tjdValue = line[45:55].replace(" ", "")
#                memValue = line[63:67].replace(" ", "")
#
#                turnAroundTimes.append(turnAround)
#                pids.append(pidValue)
#                jats.append(jatValue)
#                tjds.append(tjdValue)
#                mems.append(memValue)
#
#    with open(csvFileOut, 'w') as csv:
#        count = -1
#        while count < 249:
#            count += 1
#            stringToWrite = str(pids[count] + comma + jats[count] + comma + \
#                             turnAroundTimes[count] + comma + tjds[count] + comma + mems[count] + "\n")
#
#            csv.write(stringToWrite)


create_files(sys.argv[1], sys.argv[2]) 

