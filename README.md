# Mosquitto MQTT broker for Clever Cloud

Create one static app and one FS Bucket in your Clever Cloud organisation.

### Environment variables

Add following environment variables to your "static" app :

```bash
CC_PRE_BUILD_HOOK="clevercloud/prebuild.sh"
CC_PRE_RUN_HOOK="clevercloud/prerun.sh"
CC_TROUBLESHOOT="true"
CC_WORKER_COMMAND="mosquitto-source/src/mosquitto -c clevercloud/config"
CJSON_VERSION="1.7.18"
MOSQUITTO_VERSION="2.0.18"
MQTT_PASSWORD="test"
MQTT_USER="test"
CC_FS_BUCKET="/storage:bucket-<bucket_uuid>-fsbucket.services.clever-cloud.com"
```
