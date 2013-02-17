#!/bin/bash

$ find . -type f -exec du -sh {} \; | sort -nrk 1 | head
