# Comprehensive prometheus stack for docker nodes

## Thanks
[hiveco-prometheus-docker](https://github.com/hiveco/prometheus-docker)

## Pre-requisites

* Set PROMETHEUSDATA variable.
* Set ALERTMANAGERDATA variable.
* Set EXTERNAL_NAME variable.
* Set CLUSTER_NAME variable.
* Supported in Linux only.

## Update the json files inside config directory

* Update the label values in prometheus.json and alertmanager.json.
* Update the node-exporter.json with other node-exporter targets and labels.

## Enable SSL to nginx-proxy

* Create a certs directory inside config directory.
* Make sure certs directory contains the .crt and .key starting with the node fqdn name. For an exmaple if the nodename is foo.bar.com then the cert is going to be foo.bar.com.crt and key is going to be foo.bar.com.key

## RUN complete stack

```
./run-prometheus-stack.sh
```

## RUN prometheus/alertmanager alone

```
./run-prometheus-stack.sh prometheus
./run-prometheus-stack.sh alertmanager
```

## RUN node-exporter alone

```
./run-node-exporter.sh node-exporter
```

**__NOTE__** To accmmodate prometheus docker user 65534 run.sh will modify user permissions to 65534:65534 which may appear as nobody:nogroup in the host when you run as regular user. User might have to use `sudo` while editing target json files in config directory.

## Alertmanager Configuration

Update alertmanager configuration in config/alertmanager/alertmanager.yml

## Resource limits

* Adjust the resource limits/reservations as per need in docker-compose.yaml
