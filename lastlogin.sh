#!/bin/bash
#Días que han pasado desde el 01/01/1970 00:00:00 UTC hasta ahora, con la división pasamos de segundos a días.
NOW=$(((`date +%s`)/86400))

#Fecha del último login en el sistema.
USRDATE=$(lastlog | grep -v 'Never logged in' | awk 'BEGIN{ORS=" "}NR==2{print $5; print $6; print $9}')

#Días que han pasado desde el 01/01/1970 00:00:00 UTC hasta la fecha del último login.
(( USRDATE = $(date --date "$USRDATE" +%s) / 86400 ))
  
(( DAYS = NOW - USRDATE ))
#El último login fue hecho hace $DAYS días.
echo "$DAYS"
