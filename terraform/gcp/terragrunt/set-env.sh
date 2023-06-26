#!/bin/bash
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
 find . -name .terragrunt-cache -type d -exec rm -rf {} +
 find . -name .terraform -type d -exec rm -rf {} +
## EDIT VALUES BELOW (IF NEEDED) for the ./set-env.sh file generated by
# make setup-set-env

# Assumes logged in to the core platform subscription
export ENV_CONFIG_FILE_NAME=config_env_sampleapp.yaml

export ORCHESTRATION_PATH=${THIS_DIR}/orchestration
export MAIN_CONFIG_PATH=${THIS_DIR}/orchestration
export MAIN_CONFIG_FILE_NAME=config_main.yaml

GOOGLE_APPLICATION_CREDENTIALS=/root/.config/gcloud/application_default_credentials.json