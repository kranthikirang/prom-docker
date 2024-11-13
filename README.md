# Comprehensive prometheus stack for docker nodes

## Thanks
[hiveco-prometheus-docker](https://github.com/hiveco/prometheus-docker)

## Pre-requisites

* Set PROMETHEUSDATA variable.
* Set ALERTMANAGERDATA variable.
* Set EXTERNAL_NAME variable

## Update the json files inside config directory

* Update the label values in prometheus.json and alertmanager.json.
* Update the node-exporter.json with other node-exporter targets and labels.

## Deploy

```
./run.sh
```
