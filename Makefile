registry:
	@/bin/bash ./.docker/debezium/registry.sh
plugins:
	@curl -s http://localhost:8083/connector-plugins | jq
connectors:
	@curl -s http://localhost:8083/connectors | jq
