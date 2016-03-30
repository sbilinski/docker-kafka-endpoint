#!/bin/bash

KAFKA_CONSUMER="./usr/bin/kafka-avro-console-consumer"

while true; do 
    DATE=`date`
    echo "## Stardate: ${DATE}. Reading Kafka messages from ${KAFKA_HOST}:${KAFKA_PORT}/${TOPIC} ##"
    ${KAFKA_CONSUMER} \
      --zookeeper ${ZOOKEEPER_HOST}:${ZOOKEEPER_PORT} \
      --topic ${TOPIC} \
      --property value.schema=${MESSAGE_SCHEMA} \
      --property schema.registry.url="http://${SCHEMA_REGISTRY_HOST}:${SCHEMA_REGISTRY_PORT}"
    
    sleep ${INTERVAL}
done
