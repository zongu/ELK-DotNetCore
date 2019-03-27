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
docker-compose up -d
```