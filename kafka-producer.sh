#!/bin/bash

KAFKA_PRODUCER="./usr/bin/kafka-avro-console-producer"

while true; do 
    DATE=`date`
    echo "## Stardate: ${DATE}. Sending a Kafka message to ${KAFKA_HOST}:${KAFKA_PORT}/${TOPIC} ##"
    echo ${MESSAGE_PAYLOAD} | ${KAFKA_PRODUCER} \
        --broker-list ${KAFKA_HOST}:${KAFKA_PORT} \
        --topic ${TOPIC} \
        --property value.schema=${MESSAGE_SCHEMA} \
        --property schema.registry.url="http://${SCHEMA_REGISTRY_HOST}:${SCHEMA_REGISTRY_PORT}"
    
    sleep ${INTERVAL}
done
