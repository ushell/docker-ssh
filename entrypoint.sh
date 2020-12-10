#!/bin/sh
set -e

# 启动ssh
mkdir -p /run/sshd

# 设置证书
mkdir -p /root/.ssh && cp /etc/ssh/id_rsa.pub /root/.ssh/authorized_keys

/usr/sbin/sshd -E /var/log/sshd.log

# 启动webssh
python /app/run.py --encoding=utf8 --log-file-prefix=/var/log/webssh.log