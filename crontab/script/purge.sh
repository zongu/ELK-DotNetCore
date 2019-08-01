#!/bin/sh

# LOG 保留天數
KEEP_DAY=14
ES_URL_AND_PORT=elasticsearch:9200
i=0
KEEPS=""

# 組裝要保留的日期字串 ex: 2019.07.30|2019.07.29|2019.07.28
while [ $i -lt $KEEP_DAY ]
do
  DAY_TEMP=$(date -d "-$i days" +%d)
  MONTH_TEMP=$(date -d "-$i days" +%m)
  YEAR_TEMP=$(date -d "-$i days" +%Y)
  KEEPS="$KEEPS\-$YEAR_TEMP\.$MONTH_TEMP\.$DAY_TEMP|"
  ((i++))
done

echo "KEEPS = $KEEPS"

if [[ $i != 0 ]]; then
  EXPIRED_INDICES=`curl "http://$ES_URL_AND_PORT/_cat/indices?v&h=i" | grep -P "\-\d{4}\.\d{2}\.\d{2}$" | grep -Pv "(${KEEPS::-1})\b"`
  for name in $EXPIRED_INDICES
  do
    #echo "curl -XDELETE $ES_URL_AND_PORT/$name"
    curl -XDELETE "$ES_URL_AND_PORT/$name"
  done
fi

curl -XDELETE "$ES_URL_AND_PORT/*\[fields\]\[source_type\]*"
curl "$ES_URL_AND_PORT/_cat/indices"