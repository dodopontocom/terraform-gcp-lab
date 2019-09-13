#!/bin/bash

CIRCLE_CI_BASEDIR="/root/project/"

export GCLOUD_DEVOPS_SA="$(find ${BASEDIR} -iname ".gcp-credentials")/credential.json"

export TF_VAR_project_id="${GCLOUD_PRODJECT_ID}"
export TF_VAR_region="${GCLOUD_PRODJECT_REGION}"
export TF_VAR_service_account_credential_path="${GCLOUD_DEVOPS_SA}"