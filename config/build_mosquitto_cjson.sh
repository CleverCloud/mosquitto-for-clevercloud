#! /bin/bash

cd ${APP_HOME}

curl -sL https://mosquitto.org/files/source/mosquitto-${MOSQUITTO_VERSION}.tar.gz -o mosquitto.tar.gz
curl -sL https://github.com/DaveGamble/cJSON/archive/refs/tags/v${CJSON_VERSION}.tar.gz -o cjson.tar.gz

tar xf cjson.tar.gz
tar xf mosquitto.tar.gz

cd ${APP_HOME}/cJSON-${CJSON_VERSION}
make

cd ${APP_HOME}/mosquitto-${MOSQUITTO_VERSION}
mkdir include/cjson
ln -s ${APP_HOME}/cJSON-${CJSON_VERSION}/cJSON.h include/cjson/cJSON.h
LDFLAGS=-L${APP_HOME}/cJSON-${CJSON_VERSION} make
