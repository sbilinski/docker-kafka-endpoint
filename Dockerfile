FROM kingcontext/confluent-platform:confluent2

ENV KAFKA_HOST localhost
ENV KAFKA_PORT 9092
ENV TOPIC test
ENV INTERVAL 1

ENV MESSAGE_SCHEMA '{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}'
ENV MESSAGE_PAYLOAD '{"f1": "value1"}'

ENV SCHEMA_REGISTRY_HOST schema-registry
ENV SCHEMA_REGISTRY_PORT 8081

RUN apt-get install -y telnet netcat tcpdump

ADD kafka-publisher.sh /kafka-publisher.sh 
RUN chmod 755 /kafka-publisher.sh

ENTRYPOINT ["/kafka-publisher.sh"]

