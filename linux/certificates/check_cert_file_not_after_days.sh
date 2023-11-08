#!/bin/bash
FILE=$1
SUBJECT_CN=$(openssl x509 -subject -noout -in "$FILE" | grep -o '[^= ]*$')
EXPIRE_DATE=$(openssl x509 -enddate -noout -in "$FILE" | cut -d "=" -f 2)
EXPIRE_EPOCH=$(date -d "$EXPIRE_DATE" +%s)
NOW_EPOCH=$(date +%s)
EXPIRE_DAYS="$(( ($EXPIRE_EPOCH - $NOW_EPOCH ) / (3600 * 24) ))"

echo "$SUBJECT_CN expires in $EXPIRE_DAYS days"
