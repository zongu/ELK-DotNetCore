# 基礎版本
FROM logstash:5.2.1
# 複製設定檔
COPY /conf.d /etc/logstash/conf.d
# 調整設定檔權限 filebeat設定檔 需要
USER root
RUN bash -c 'chown root:logstash /etc/logstash/conf.d/*.conf'
CMD ["-f", "/etc/logstash/conf.d"]
USER logstash