# Barbarian Hadoop Distribution

[https://barbarians.io/](https://barbarians.io)

## ZooKeeper Docker image

This repo contains the configuration files and build scripts for the Barbarian Hadoop Distribution **ZooKeeper Docker image**.

The latest release of the ZooKeeper Docker image is based on the following Apache Foundation software releases:
- Apache Zookeeper

## Releases

| Release | Notes |
| -- | -- |
| 0.1-INTERNAL | Prelease PoC for demo |
| -- | -- |

## Building

**todo:** buildscripts missing

## Running

This image is designed to be run as a part of the Barbarian Hadoop distribution - a Kubernetes based platform for data processing at scale, founded on free software developed by the [Apache Software Foundation](https://www.apache.org/).

Launching this image is done using [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) and the provided [yaml](http://yaml.org) configuration file (see in the directory ./yaml). Successful deployment depends on:
- A running Kubernetes cluster with sufficient resource to deploy the full platform

Launch a 3-node ZooKeeper ensemble with ```kubectl create -f yaml/zookeeper.yaml```

## Features

The image includes support for the following features:
- Zookeeper
- Zookeeper health check monitoring
- Loadbalancer-based access

