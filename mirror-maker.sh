#!/bin/bash

if [ -z "$MM_CONSUMER_GROUP_ID" ]; then
  echo "MM_CONSUMER_GROUP_ID missing from env"
  exit -1
fi


if [ -z "$MM_TOPICS" ]; then
  echo "List of topics in MM_TOPICS is empty. Supply as comma-separated list."
  exit -2
fi

cat <<EOF > /opt/consumer.props
bootstrap.servers=$MM_CONSUMER_BROKERS
group.id=$MM_CONSUMER_GROUP_ID
partition.assignment.strategy=org.apache.kafka.clients.consumer.RoundRobinAssignor
EOF

cat <<EOF > /opt/producer.props
bootstrap.servers=$MM_PRODUCER_BROKERS
acks=all
EOF

/opt/kafka_2.11-0.10.2.0/bin/kafka-mirror-maker.sh \
  --consumer.config=/opt/consumer.props \
  --producer.config=/opt/producer.props \
  --whitelist=$MM_TOPICS \
  --offset.commit.interval.ms=30000
