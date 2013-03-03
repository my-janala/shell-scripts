#!/bin/bash
## Find nrpe.cfg file
## find current allowed_hosts entry
## replace it with the new allowed_hosts entry
## restart nrpe
## send email with confirmation

## Author:Mezbaur Rahman
## Date: 28/02/2013

## Setting variables
localHostName=`hostname`

currentnrpefile=`locate nrpe.cfg`
echo "found there current nrpe config file as $currentnrpefile"

export DIR=$(dirname ${currentnrpefile})

current_allowed_hosts=`grep 'allowed_hosts\|#allowed_hosts' $currentnrpefile`

new_allowed_hosts="allowed_hosts=127.0.0.1"

# replacing allowed_hosts entry
echo "replacing allowed_hosts entry for nrpe.cfg file"

sed s/${current_allowed_hosts}/$new_allowed_hosts/ <$currentnrpefile >${DIR}/nrpe.cfg.new

# rename nrpe.cfg file
mv -f ${DIR}/nrpe.cfg.new $currentnrpefile

## another way to to perform above two tasks in one line
# sed -i 's/${current_allowed_hosts}/$new_allowed_hosts/g' $currentnrpefile 

# restart nrpe
/etc/init.d/nrpe restart

sleep 10

# Find new entry on log file
found_connections=`grep 'Allowing connections from:' /var/log/messages`

# Mailing the Result
echo "Found new allowed_hosts connections: " $found_connections | mail -s "New Allowed_hosts entry for $localHostName" mezbaur.rahman@gmail.com

exit 0

