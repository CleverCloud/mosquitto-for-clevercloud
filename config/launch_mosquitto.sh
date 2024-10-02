#! /bin/bash

cd ${APP_HOME}
mosquitto-${MOSQUITTO_VERSION}/src/mosquitto -c config/mosquitto.conf
