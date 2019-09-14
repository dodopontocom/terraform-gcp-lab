variable "project_id" {
    description = "Environment project id"
}
variable "region" {
    description = "Region for the project"
}
variable "key" {
    description = "The operations (devops) service account"
}
variable "start_topic" { }
variable "stop_topic" { }
variable "start_function_name" { }
variable "stop_function_name" { }
variable "gcp_bucket" { }
variable "function_zip_name" { }
variable "function_zip_source_file" { }
variable "schedule_stop" { }