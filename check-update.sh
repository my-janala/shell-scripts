#!/bin/bash

## This script will alert nagios server for available updates on this machine.
## The script is dependent on a cronjob on this server that produces /tmp/yum-check-update file.

number=$(cat /tmp/yum-check-update | egrep '(.i386|.x86_64|.noarch|.src)' | wc -l)

case $number in
0)
echo "OK- No updates available"
exit 0
;;
1)
echo "Warning- One update available"
exit 1
;;
*)
echo "Critical - $number updates available "
exit 2
;;

esac

