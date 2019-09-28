#!/bin/bash
# Terraform variables

# Gcloud project id
export GCLOUD_PROJECT_ID="gcp-my-labs"

export TF_VAR_gcp_bucket="terraform-${GCLOUD_PROJECT_ID}"
export TF_VAR_project_id="${GCLOUD_PROJECT_ID}"
export TF_VAR_region="us-central1"
export TF_VAR_key="${CIRCLE_WORKING_DIRECTORY}/credentials/credential.json"
export TF_VAR_start_topic="start-instance-event"
export TF_VAR_stop_topic="stop-instance-event"
export TF_VAR_start_function_name="startInstancePubSub"
export TF_VAR_stop_function_name="stopInstancePubSub"
export TF_VAR_function_zip_name="index.zip"
export TF_VAR_function_zip_source_file="${CIRCLE_WORKING_DIRECTORY}/gcp-functions/index.zip"
export TF_VAR_schedule_stop="stop-job"
export TF_VAR_schedule_start="start-job"
export TF_VAR_machine_type="n1-standard-4"
export TF_VAR_zone="us-central1-a"
export TF_VAR_compute_instance_environment="dev"
export TF_VAR_ubuntu_image="ubuntu-os-cloud/ubuntu-1804-lts"
export TF_VAR_startup_script="${CIRCLE_WORKING_DIRECTORY}/scripts/${STARTUP_SCRIPT}"

# GCLOUD service account credentials path
export GOOGLE_APPLICATION_CREDENTIALS=${TF_VAR_key}
