export CLUSTER_NAME="talos-cluster"

sudo sed -i -E "s/\"cluster\": (.*)/\"cluster\": \"${CLUSTER_NAME}\",/g" config/node-exporter.json

#docker compose down $service
docker compose -f node-exporter-compose.yaml up -d
