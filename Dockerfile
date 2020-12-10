FROM python:3.7-slim

LABEL maintainer="ushell"

WORKDIR /app

# apt-get source
ADD repositories /etc/apk/repositories

# ssh key file
ADD ./keys /etc/ssh

# application code
ADD ./src /app

# application entry
ADD entrypoint.sh /app

RUN apt-get update && apt-get install openssh-server vim -y --no-install-recommends 

RUN pip install -r requirements.txt

EXPOSE 8888

ENTRYPOINT [ "/app/entrypoint.sh" ]
