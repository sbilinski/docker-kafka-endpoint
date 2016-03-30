#!/bin/bash

case $ENDPOINT_TYPE in
    producer)
      echo "Running in PRODUCER mode..."
      ./kafka-producer.sh
      ;;
    consumer)
      echo "Running in CONSUMER mode..."
      ./kafka-consumer.sh
      ;;
    *)
      echo "Unsupported endpoint type: ${ENDPOINT_TYPE}"
      exit 1
      ;;
esac

