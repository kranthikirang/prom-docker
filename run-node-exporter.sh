export CLUSTER_NAME="talos-cluster"

sudo sed -i -E "s/\"cluster\": (.*)/\"cluster\": \"${CLUSTER_NAME}\",/g" config/node-exporter.json

#docker compose down $service
docker compose up -d node-exporter
