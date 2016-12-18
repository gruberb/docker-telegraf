# Docker image for Telegraf

Docker image for [Telegraf](https://www.influxdata.com/time-series-platform/telegraf/), based on Debian.

## Run

This image is tailered towards running on Docker Cloud. But, it also works with the most basic run command:
```docker run -t -v /var/run/docker.sock:/var/run/docker.sock:ro gruberbastian/telegraf```

## Configuration for Docker container

To be able to analyse different docker containers on a specific node, you need to add following volume:
```/var/run/docker.sock```



## Configuration (ENV, -e)

Variable | Description | Default value | Sample value 
-------- | ----------- | ------------- | ------------
HOSTNAME | To pass in the docker host's actual hostname | os.Hostname() | $DOCKERCLOUD_NODE_HOSTNAME 
INFLUXDB_URL | Point to your InfluxDB | http://influxdb:8086 | http://localhost:8086
TELEGRAF_VERSION | Which version of Telegraf should be used | 1.1.1 | 1.0.0
FLUSH_INTERVAL | How many times should Telegraf send data to Influx (in s) | 10 | 60 


## Activated reportings (by default)

- CPU
- Disk
- DiskIO
- Kernel
- Mem
- Processes
- Swap
- System
- Docker
- Netstat
