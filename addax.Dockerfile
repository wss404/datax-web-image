FROM python:3.8.13

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list \
    && apt-get update \
    && apt-get -y install  --assume-yes openjdk-11-jdk-headless \
    && rm -rf /var/lib/apt/lists/*

ADD addax-4.1.5.tar.gz /opt/