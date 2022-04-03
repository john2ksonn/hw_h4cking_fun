#!/usr/bin/sh

# This script expects a csv file (w/ binary values in column 2) at stdin.

# Workflow:
# * capture samples
# * set UART analyzer to 9600 baud, 7 bits per transfer, 1 stop bit, odd parity bit, LSB first
# * set display format to binary
# * export data as csv file (e.g. rx30.csv for rx samples when the table is at position 30)
# * pipe the csv file into this script and get every unique 0b1000001 packet

awk -F',' '{print $2}' | tr -d '_' | tr -d 'b' | grep -Po '[01]{7}$' | tr '\n' ' ' | grep -Po '1000001.{57}0001101' | uniq

