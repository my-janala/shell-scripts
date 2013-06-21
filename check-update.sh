#!/bin/bash
yumtmp="/tmp/yum-check-update.$$"
yum="/usr/bin/yum"

#/sbin/runuser -s /bin/sh -m root -c "/usr/bin/yum check-update >& $yumtmp"

sudo /bin/su - root -c "/usr/bin/yum check-update > /tmp/yum-check-update"
#sudo /bin/su - root -c "/usr/bin/yum check-update > $yumtmp"
#yum check-update >& $yumtmp

number=$(cat /tmp/yum-check-update | egrep '(.i386|.x86_64|.noarch|.src)' | wc -l)
#number=$(cat $yumtmp | egrep '(.i386|.x86_64|.noarch|.src)' | wc -l)
#number=`cat $yumtmp | wc -l`
#number=2

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

