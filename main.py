

def create_files(fileIn, fileOut, csvFileOut):
    with open(fileOut, 'w') as parsedFile:
        with open(fileIn) as file1:
            for line in file1:
                if line.startswith("J") or line.startswith('*') \
                        or line.startswith("P") or line.startswith("N") \
                        or line.startswith("A"):
                    parsedFile.write(line)

    turnAroundTimes = []
    pids = []
    jats = []
    tjds = []
    mems = []
    comma = ","

    with open(fileOut) as file1:
        for line in file1:
            if line.startswith("*") or line.startswith("P") or line.startswith("N") or line.startswith("A"):
                continue

            else:
                # make line look like PID, JAT, TJD
                turnAround = line[1:12].replace(" ", "")
                pidValue = line[19:22].replace(" ", "")
                jatValue = line[29:39].replace(" ", "")
                tjdValue = line[45:55].replace(" ", "")
                memValue = line[63:67].replace(" ", "")

                turnAroundTimes.append(turnAround)
                pids.append(pidValue)
                jats.append(jatValue)
                tjds.append(tjdValue)
                mems.append(memValue)

    with open(csvFileOut, 'w') as csv:
        count = -1
        while count < 249:
            count += 1
            stringToWrite = str(pids[count] + comma + jats[count] + comma + \
                             turnAroundTimes[count] + comma + tjds[count] + comma + mems[count] + "\n")

            csv.write(stringToWrite)


create_files("rr1.txt", "rr1Parsed.txt", "rr1Csv.txt")
create_files("rr5.txt", "rr5Parsed.txt", "rr5Csv.txt")
create_files("rr10.txt", "rr10Parsed.txt", "rr10Csv.txt")
create_files("rr15.txt", "rr15Parsed.txt", "rr15Csv.txt")
create_files("rr20.txt", "rr20Parsed.txt", "rr20Csv.txt")
create_files("rr25.txt", "rr25Parsed.txt", "rr25Csv.txt")
create_files("rr50.txt", "rr50Parsed.txt", "rr50Csv.txt")

