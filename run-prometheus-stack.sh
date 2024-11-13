export PROMETHEUSDATA=/home/ubuntu/prom-docker/prometheus-data
export ALERTMANAGERDATA=/home/ubuntu/prom-docker/alertmanager-data

export EXTERNAL_NAME="talos-cp1"
#export EXTERNAL_SCHEME="http"
export CLUSTER_NAME="talos-cluster"

sudo chown -R 65534:65534 config && sudo chmod +x config/entrypoint.sh

if [[ ! -z $1 ]]; then
	service=$1
fi

sudo sed -i -E "s/\"cluster\": (.*)/\"cluster\": \"${CLUSTER_NAME}\",/g" config/prometheus.json
sudo sed -i -E "s/\"cluster\": (.*)/\"cluster\": \"${CLUSTER_NAME}\",/g" config/alertmanager.json
sudo sed -i -E "s/\"cluster\": (.*)/\"cluster\": \"${CLUSTER_NAME}\",/g" config/node-exporter.json

if [[ ! -z ${PROMETHEUSDATA} ]]; then
	if [[ ! -d ${PROMETHEUSDATA} ]]; then
		sudo mkdir -p ${PROMETHEUSDATA}
	fi
	sudo chown -R 65534:65534 ${PROMETHEUSDATA}
fi

if [[ ! -z ${ALERTMANAGERDATA} ]]; then
	if [[ ! -d ${ALERTMANAGERDATA} ]]; then
		sudo mkdir -p ${ALERTMANAGERDATA}
	fi
	sudo chown -R 65534:65534 ${ALERTMANAGERDATA}
fi

#docker compose down $service
docker compose -f prometheus-stack-compose.yaml up -d $service
