FROM python:3.6-slim

# 下載 cron, curl, dos2unix
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    cron && \
    apt-get install -y --no-install-recommends \
    curl && \
    apt-get install -y --no-install-recommends \
    dos2unix && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

COPY /script /script

USER root

# 轉換 windows文字編碼到unix可以看懂的格式
RUN dos2unix /script/*.sh
RUN chmod +x /script/*.sh
RUN touch /var/log/cron.log
RUN touch /var/spool/cron/crontabs/root
RUN crontab -l > mycron
# 加入定時排成 每天晚上 00:05 執行
RUN echo "5 0 * * * bash /script/purge.sh" >> mycron
RUN crontab mycron
RUN rm mycron

ENTRYPOINT cron && tail -f /var/log/cron.log