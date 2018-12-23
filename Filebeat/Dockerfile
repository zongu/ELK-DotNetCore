# 基礎版本
FROM docker.elastic.co/beats/filebeat:5.2.1
# 複製設定檔
COPY /yml /yml
# 調整設定檔權限 filebeat設定檔 需要
USER root
RUN bash -c 'chown root:filebeat /yml/*.yml'
USER filebeat