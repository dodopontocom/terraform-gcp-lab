#terraform variables
export TF_VAR_gcp_bucket="gcp-laboratories-tf-state"
export TF_VAR_project_id="gcp-laboratories"
export TF_VAR_region="us-central1"
export TF_VAR_start_topic="start-instance-event"
export TF_VAR_stop_topic="stop-instance-event"
export TF_VAR_start_function_name="startInstancePubSub"
export TF_VAR_stop_function_name="stopInstancePubSub"
export TF_VAR_function_zip_name="index.zip"
export TF_VAR_function_zip_source_file="/root/terraform-gcp-lab/gcp-functions/index.zip"
export TF_VAR_schedule_stop="stop-job"
export TF_VAR_schedule_start="start-job"
export TF_VAR_machine_type="f1-micro"
export TF_VAR_zone="us-central1-a"
export TF_VAR_compute_instance_environment="dev"
export TF_VAR_ubuntu_image="ubuntu-os-cloud/ubuntu-1804-lts"

export TF_VAR_key=/root/terraform-gcp-lab/credentials/credential.json
