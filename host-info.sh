#!/bin/bash

# case-menu: A case driven system information program

clear
echo "
Please select:

A. Display System Information
B. Display Disk Space
C. Display Progarms listening on ports
D. Display IP Addresses
E. Display Kernel Configuration
F. Display Kernel Messages (dmesg)
Q. Quit
"

read -p  "Enter selection [A, B, C, D, E, F or Q ] >"

case $REPLY in 
        q|Q)  echo "Program terminated"
              exit 
              ;;
        a|A)  echo "Hostname : $HOSTNAME"
              uptime
              ;;
        b|B)  df -h
              ;;
        c|C)  netstat -ntlp
              ;;
        d|D)  ifconfig 
              ;;
        e|E)  sysctl -A
              ;;
        f|F)  dmesg
              ;;
        *)    echo "Invalid entry" >&2
              exit 1
              ;;
esac

              
              
              


"