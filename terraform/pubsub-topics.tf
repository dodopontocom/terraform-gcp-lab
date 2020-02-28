resource "google_pubsub_topic" "start-event-topic" {
  name = var.start_topic
}

resource "google_pubsub_topic" "stop-event-topic" {
  name = var.stop_topic
}
