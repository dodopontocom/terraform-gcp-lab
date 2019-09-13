#!/bin/bash

export GCLOUD_DEVOPS_SA="$(find ${CIRCLE_WORKING_DIRECTORY} -iname ".gcp-credentials")/credential.json"

export TF_VAR_project_id="${GCLOUD_PRODJECT_ID}"
export TF_VAR_region="${GCLOUD_PRODJECT_REGION}"
export TF_VAR_service_account_credential_path="${GCLOUD_DEVOPS_SA}"