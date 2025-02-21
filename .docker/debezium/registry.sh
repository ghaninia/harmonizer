#!/bin/bash

script_path="$0"
full_path=$(realpath "$script_path")
dir_path=$(dirname "$full_path")

for connector in "$dir_path"/connectors/*.json

do
  connector_name=$(basename $connector .json)

  echo "Creating connector $connector_name"
  if curl -s -X GET http://localhost:8083/connectors | grep -q $connector_name; then
      curl -s -X DELETE http://localhost:8083/connectors/$connector_name | jq
      echo "Connector $connector_name already exists. Deleting it first."
  fi

  echo "Creating connector $connector_name"
  curl -s -X POST -H "Content-Type: application/json" --data @$connector http://localhost:8083/connectors | jq
  echo "Connector $connector_name created"
done

exit 0