#!/bin/bash

# case-menu: A case driven system information program

clear
echo "
Please select:

A. Display System Information
B. Display Disk Space
C. Display Progarms listening on ports
D. Display IP Addresses
E. Display network interfaces
F. Display Routing Information
G. Display Kernel Configuration
H. Display Kernel Messages (dmesg)
I. Display All Attached Disks (fdisk)
J. Display Disk Space with All Attached Disks (GB)
K. Show All Logical Volumes
Q. Quit
"

read -p  "Enter selection [A, B, C, D, E, F or Q ] >"

case $REPLY in 
        q|Q)    echo "Program terminated"
                exit 
                ;;
        a|A)    echo "Hostname : $HOSTNAME"
                uptime
                ;;
        b|B)    df -h
                ;;
        c|C)    netstat -ntlp
                ;;
        d|D)    ifconfig 
                ;;
        e|E)    netstat -ie
                ;;
        f|F)    netstat -r 
                ;;
        g|G)    sysctl -A
                ;;
        h|H)    sudo dmesg
                ;;
        i|I)    fdisk -l
                ;;
        j|J)    fdisk -l | grep GB
                ;;
        k|K)    lvdisplay
                ;;
        *)    echo "Invalid entry" >&2
              exit 1
              ;;
esac
