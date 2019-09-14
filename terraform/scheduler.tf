resource "google_cloud_scheduler_job" "stop_job" {
  name     = "${var.schedule_stop}"
  description = "stop test job"
  schedule = "35 20 * * *"
  time_zone = "America/Sao_Paulo"

  pubsub_target {
    topic_name = "${var.stop_topic}"
    //data = "${base64encode("test")}"
    data = "${base64encode("{\"zone\":\"us-central1-a\", \"label\":\"env=dev\"}")}"
  }
}