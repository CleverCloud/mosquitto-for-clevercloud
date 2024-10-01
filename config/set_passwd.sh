#! /bin/bash

cd ${APP_HOME}
touch passwdfile
chmod 600 passwdfile
mosquitto-${MOSQUITTO_VERSION}/apps/mosquitto_passwd/mosquitto_passwd -b passwdfile ${MQTT_USER} ${MQTT_PASSWORD}
