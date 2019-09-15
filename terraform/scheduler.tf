
/*resource "google_app_engine_application" "app" {
  project     = "${var.project_id}"
  location_id = "us-central"
}*/

resource "google_cloud_scheduler_job" "stop_job" {
  name     = "${var.schedule_stop}"
  description = "stop test job"
  schedule = "0 21 * * *"
  time_zone = "America/Sao_Paulo"

  pubsub_target {
    //topic_name = "${var.stop_topic}"
    topic_name = "projects/gcp-laboratories/topics/stop-instance-event"
    //data = "${base64encode("test")}"
    data = "${base64encode("{\"zone\":\"us-central1-a\", \"label\":\"env=dev\"}")}"
  }

  /*depends_on = [
    "google_app_engine_application.app"
  ]*/
}