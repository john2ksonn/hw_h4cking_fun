#!/usr/bin/sh

# for more info: comments in process_tx.sh

# input file   -> get second columns    ->  drop _  -> drop leading '0b'  -> replace \n  -> packets ending in 0x0D -> unique -> add a prefix
cat "rx$1.csv" | awk -F',' '{print $2}' | tr -d '_' | grep -Po '[01]{7}$' | tr '\n' ' ' | grep -Po '\S.+?0001101' | sort -u | awk "{print \"$1: \"\$0}"

