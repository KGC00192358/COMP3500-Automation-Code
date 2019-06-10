import matplotlib.pyplot as plt
import csv


pids = []
jats = []
turnAround = []
tjds = []
mems = []


with open('fcfsCsv.txt', 'r') as csvfile:
    plots = csv.reader(csvfile, delimiter=',')
    for row in plots:
        pids.append(float(row[0]))
        jats.append(float(row[1]))
        turnAround.append(float(row[2]))
        tjds.append(float(row[3]))
        mems.append(float(row[4]))


plt.plot(pids, jats, turnAround, tjds, mems, marker='o')

plt.title('Data from the CSV File: People and Expenses')

plt.xlabel('N')
plt.ylabel('Expenses')

plt.show()