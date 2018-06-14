#!/bin/sh

/root/google-cloud-sdk/bin/gcloud beta emulators pubsub start --data-dir "${DATA_DIR}" --host-port "0.0.0.0:${HOST_PORT}"