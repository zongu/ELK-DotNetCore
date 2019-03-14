# ELK-DotNetCore
ELK實作, .NetCore WebApi應用

## 自定義logstash, filebeat, nlogapp container
```
## logstash
docker build /logstash -t logstash:CustomVersion .

## filebeat
docker build /Filebeat -t filebeat:CustomVersion .

## nlogapp
docker build /NLogApp -t nlogapp:CustomVersion .
```

## 基礎環境建設
```
## custom network
docker network create nlogapp

## redis
docker run -d --name redis \
    -v ~/data/redis:/data \
    -p 6379:6379 \
    --net nlogapp \
    redis:3.2.4

## elasticsearch
docker run -d --name elasticsearch \
    -v ~/data/elasticsearch:/usr/share/elasticsearch/data \
    -p 9200:9200 \
    --net nlogapp \
    elasticsearch:5.6-alpine

## logstash
docker run -d --name logstash \
    --net nlogapp \
    logstash:CustomVersion

## kibana
docker run -d --name kibana \
    --net nlogapp \
    -e ELASTICSEARCH_URL="http://elasticsearch:9200" \
    -p 5601:5601 \
    kibana:5.2.1

## filebeat 
docker run -d --name filebeat \
    -v ~/data/LogFiles:/var/LogFiles \
    --net nlogapp \
    filebeat:CustomVersion \
    /usr/share/filebeat/filebeat -e -c /yml/filebeat_nlogapp.yml

## nlogapp
docker run -d --name nlogapp \
    -v ~/data/LogFiles:/nlogapp/LogFiles \
    -p 8080:80 \
    --net nlogapp \
    nlogapp:CustomVersion
```