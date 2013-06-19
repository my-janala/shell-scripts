#!/bin/bash

yumtmp="/tmp/yum-check-update.$$"
yum="/usr/bin/yum"

yum check-update >& $yumtmp
number=$(cat $ymptmp | egrep '(.i386|.x86_64|.noarch|.src)' | wc -l)
#yumstatus="$?"

case $number in
0)
echo "OK- No updates available"
exit 0
;;

*)
echo "Critical - $number of updates available "
exit 1

esac
