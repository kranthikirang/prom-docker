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

## RUN complete stack

```
./run.sh
```

## RUN node-exporter alone

```
./run.sh node-exporter
```

**__NOTE__** To accmmodate prometheus docker user 65534 run.sh will modify user permissions to 65534:65534 which may appear as nobody:nogroup in the host when you run as regular user. User might have to use `sudo` while editing target json files in config directory.

## Alertmanager Configuration

Update alertmanager configuration in config/alertmanager/alertmanager.yml
