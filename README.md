# kafka-mirrormaker

Kafka's MirrorMaker wrapped up to be configured with environment variables.

## Configuration

Available environment variables:

| ENV Variable  | Description |
| ------------- | ------------- |
| MM_CONSUMER_GROUP_ID  | Consumer group it   |
| MM_CONSUMER_BROKERS   | Broker(s) to consume from     |
| MM_PRODUCER_BROKERS   | Broker(s) to produce to       |
| MM_TOPICS             | List of topics to mirror (whitelist, comma-separated)       |

Note that all variables are required.

## Notes

If the consumer group is not already known to Kafka, it consumes topics from the end of the topic (`auto.offset.reset=latest`, this is Kafka's default).

MirrorMaker is restart-safe (inside the retention interval) - it behaves just like a normal consumer.
