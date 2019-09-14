resource "google_cloudfunctions_function" "function-start" {
  name                  = "${var.start_function_name}"
  description           = "Start VM function"
  runtime               = "nodejs8"

  available_memory_mb   = 128
  timeout               = 60
}

resource "google_cloudfunctions_function" "function-stop" {
  name                  = "${var.stop_function_name}"
  description           = "Start VM function"
  runtime               = "nodejs8"

  available_memory_mb   = 128
  timeout               = 60
}