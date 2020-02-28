
resource "google_app_engine_application" "appengine" {
  project     = "${var.project_id}"
  location_id = "us-central"
}

resource "google_cloud_scheduler_job" "start_job" {
  name     = "${var.schedule_start}"
  description = "start test job"
  schedule = "0 8 * * *"
  time_zone = "America/Sao_Paulo"

  pubsub_target {
    topic_name = "projects/${var.project_id}/topics/start-instance-event"
    data = "${base64encode("{\"zone\":\"us-central1-a\", \"label\":\"env=dev\"}")}"
  }
  
  depends_on = [
    "google_app_engine_application.appengine"
  ]
}
resource "google_cloud_scheduler_job" "stop_job" {
  name     = "${var.schedule_stop}"
  description = "stop test job"
  schedule = "0 23 * * *"
  time_zone = "America/Sao_Paulo"

  pubsub_target {
    topic_name = "projects/${var.project_id}/topics/stop-instance-event"
    data = "${base64encode("{\"zone\":\"us-central1-a\", \"label\":\"env=dev\"}")}"
  }

  depends_on = [
    "google_app_engine_application.appengine"
  ]
}
