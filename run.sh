export PROMETHEUSDATA=/root/prometheus/docker/prometheus-data
export ALERTMANAGERDATA=/root/prometheus/docker/alertmanager-data

if [[ ! -z $1 ]]; then
	service=$1
	if [[ $service == "prometheus" ]]; then
		if [[ -z ${PROMETHEUSDATA} ]]; then
			echo "Please set the PROMETHEUSDATA env variable for prometheus data"
			exit
		else
			chown -R 65534:65534 ${PROMETHEUSDATA}
		fi
	elif [[ $service == "alertmanager" ]]; then
		if [[ -z ${ALERTMANAGERDATA} ]]; then
			echo "Please set the ALERTMANAGERDATA env variable for alertmanager data"
			exit
		else
			chown -R 65534:65534 ${ALERTMANAGERDATA}
		fi
	fi
fi

#docker compose down $service
docker compose up -d $service
