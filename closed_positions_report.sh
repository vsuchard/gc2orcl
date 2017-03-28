#!/bin/bash
ETXFILE=Positions
CONNECT=vsu/go2hell@XE
CONTROLFILE=${ETXFILE}.ctl
SEDCTL=${ETXFILE}.sed
DORENAME=Y
DOCSV=Y
DODOS2UNIX=N
DOSEDCR=Y
VERBOSE=Y
XLSTOCSV=/usr/bin/convertxls2csv

[ ! -d loaded ] && mkdir loaded

[ "$DORENAME" = "Y" ] && for f in *${ETXFILE}.xls; do echo $f; mv "$f" `echo $f | sed 's/ /_/g'`; done
[ "$DOCSV"    = "Y" ] && for f in *${ETXFILE}.xls; do $XLSTOCSV -x $f -c `echo $f|sed 's/xls$/csv/'`;mv $f loaded/; done

for i in `ls -1tr *${ETXFILE}.csv 2>/dev/null` ; do
  [ "$VERBOSE"    = "Y" ] && echo In-progress i=$i
  [ "$DODOS2UNIX" = "Y" ] && dos2unix $i
  [ "$DOSEDCR"    = "Y" ] && sed  -f $SEDCTL -i $i
  echo $ORACLE_HOME/bin/sqlldr userid=$CONNECT CONTROL=$CONTROLFILE data="$i"  skip=1
  $ORACLE_HOME/bin/sqlldr userid=$CONNECT CONTROL=$CONTROLFILE data="$i"  skip=1
  mv $i loaded/
done
exit 0
