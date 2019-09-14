resource "google_pubsub_topic" "start-event-topic" {
  name = "${var.project_id}-${var.start_topic}"
}

resource "google_pubsub_topic" "stop-event-topic" {
  name = "${var.project_id}-${var.stop_topic}"
}