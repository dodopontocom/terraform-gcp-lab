#!/bin/bash

BASEDIR="$(cd $(dirname ${BASH_SOURCE[0]})/../ >/dev/null 2>&1 && pwd )"
echo "basedir: ${BASEDIR}"

export GCLOUD_DEVOPS_SA_PATH=${BASEDIR}/gcp/credentials/credential.json

export TF_VAR_project_id=${GCLOUD_PRODJECT_ID}
export TF_VAR_region=${GCLOUD_PRODJECT_REGION}
export TF_VAR_service_account_credential_path=${GCLOUD_DEVOPS_SA_PATH}