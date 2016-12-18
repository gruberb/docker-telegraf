FROM debian:jessie

ENV INFLUXDB_URL http://influxdb:8086
ENV DEBIAN_FRONTEND noninteractive
ENV TELEGRAF_VERSION 1.1.1
ENV FLUSH_INTERVAL 10

RUN apt-get update && \
	apt-get install -y init-system-helpers curl lsof python-pip && \
	curl -O https://dl.influxdata.com/telegraf/releases/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
	dpkg -i telegraf_${TELEGRAF_VERSION}_amd64.deb && rm telegraf_${TELEGRAF_VERSION}_amd64.deb && \
  pip install envtpl && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY telegraf.conf.tpl /etc/telegraf/telegraf.conf.tpl
COPY run.sh /run.sh
RUN chmod +x /run.sh

HEALTHCHECK --interval=5s --retries=3 --timeout=3s CMD pidof image

CMD [ "/run.sh" ]
