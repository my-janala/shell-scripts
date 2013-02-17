#!/bin/bash
# list open ports using lsof
lsof -i | grep ":[0-9]\+->" -o | grep [0-9]\+ -o  | sort | uniq
