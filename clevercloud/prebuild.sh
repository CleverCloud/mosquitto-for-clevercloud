#! /bin/bash

set -x

curl https://mosquitto.org/files/source/mosquitto-${MOSQUITTO_VERSION}.tar.gz -o mosquitto.tar.gz -L
curl https://github.com/DaveGamble/cJSON/archive/refs/tags/v${CJSON_VERSION}.tar.gz -o cjson.tar.gz -L

tar xf cjson.tar.gz
tar xf mosquitto.tar.gz

cd cJSON-${CJSON_VERSION}
make

cd ../mosquitto-${MOSQUITTO_VERSION}
mkdir include/cjson
ln -s ${APP_HOME}/cJSON-${CJSON_VERSION}/cJSON.h include/cjson/cJSON.h
LDFLAGS=-L${APP_HOME}/cJSON-${CJSON_VERSION} make