# Mosquitto MQTT broker for Clever Cloud

Clone this repository, install [Clever Tools](https://github.com/CleverCloud/clever-tools) and create one static app and one FS Bucket in your Clever Cloud organisation.

```
clever create -t static-apache -a mosquitto_static
clever addon create fs-bucket mosquitto_fs --link mosquitto_static
```

### Environment variables

Note the FS Bucket `Real ID` and declare it as the `/storage` folder of your application:

```
clever env set CC_FS_BUCKET "/storage:bucket-<bucket_real_id>-fsbucket.services.clever-cloud.com"
```

Add the following environment variables to set up your app (edit the values according to your needs):

```
clever env set CJSON_VERSION "1.7.18"
clever env set MOSQUITTO_VERSION "2.0.18"
clever env set CC_WEBROOT "/www"
clever env set MQTT_USER "user_name"
clever env set MQTT_PASSWORD "a_good_password"
clever env set CC_PRE_BUILD_HOOK "config/build_mosquitto_cjson.sh"
clever env set CC_PRE_RUN_HOOK "config/set_passwd.sh"
clever env set CC_WORKER_COMMAND "config/launch_mosquitto.sh"
```

### TCP redirection

Add a TCP redirection. If you use a `cleverapps.io` (for testing purposes only):

```
clever domain # to show the domain name of your app
clever tcp-redirs add --namespace cleverapps
```

If you've set up a custom domain:

```
clever domain add your_domain.com
clever tcp-redirs add --namespace default
```

An external port will be attributed to your app, use it to connect to your MQTT broker.

### Deploy your application

```
clever deploy
```

### Upgrade your application

To upgrade cJSON and Mosquitto, modify the `CJSON_VERSION` and/or `MOSQUITTO_VERSION` environment variables and rebuild your app:

```
clever env set CJSON_VERSION "NEW_VERSION"
clever env set MOSQUITTO_VERSION "NEW_VERSION"
clever restart --without-cache
```

### MQTT broker

You can use `mosquitto_sub` client in debug mode to test connection to your broker:

```
mosquitto_sub -h your_domain_name.tld -p tcp_redir_port -u user_name -P a_good_password -t test -d
```
