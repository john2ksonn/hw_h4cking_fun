#!/usr/bin/sh

# This script reads a file with a filename of txAAA.csv where AAA is the first argument to the script

# Workflow:
# * capture samples
# * set UART analyzer to 9600 baud, 7 bits per transfer, 1 stop bit, odd parity bit, LSB first
# * set display format to binary
# * export data as csv file (e.g. tx30.csv for tx samples when the table is at position 30)
# * invoke this script with e.g. 30 as single argument and get every unique packet

cat "tx$1.csv" | awk -F',' '{print $2}' | tr -d '_' | grep -Po '[01]{7}$' | tr '\n' ' ' | grep -Po '\S.+?0001101' | sort -u | awk "{print \"$1: \"\$0}"

