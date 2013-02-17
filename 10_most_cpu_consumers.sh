# Listing the top 10 CPU consuming process in a hour

#!/bin/bash
#Name: pcpu_usage.sh
#Description: Script to calculate cpu usage by processe s for 1 hour
SECS=3600
UNIT_TIME=60
#Change the SECS to total seconds for which monitoring is to be 
performed.
#UNIT_TIME is the interval in seconds between each sampling
STEPS=$(( $SECS / $UNIT_TIME ))
echo Watching CPU usage... ;
for((i=0;i<STEPS;i++))
do
  ps -eo comm,pcpu | tail -n +2 >> /tmp/cpu_usage.$$
  sleep $UNIT_TIME
done
echo
echo CPU eaters :
cat /tmp/cpu_usage.$$ | \
awk '
{ process[$1]+=$2; }
END{ 
  for(i in process)
  {
    printf("%-20s %s",i, process[i] ;
  }
   }' | sort -nrk 2 | head
rm /tmp/cpu_usage.$$
#Remove the temporary log file
