#!/bin/bash


docker exec kafka kafka-topics --zookeeper zookeeper:2181 \
 --create --topic gitoperator-in \
 --partitions 1 \
 --replication-factor 1

docker exec kafka kafka-topics --zookeeper zookeeper:2181 \
 --create --topic gitoperator-out \
 --partitions 1 \
 --replication-factor 1

docker exec kafka kafka-topics --zookeeper zookeeper:2181 \
 --create --topic gitoperator-batch-in \
 --partitions 1 \
 --replication-factor 1