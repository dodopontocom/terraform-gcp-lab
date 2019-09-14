resource "google_storage_bucket_object" "function-zip" {
  name   = "${var.function_zip_name}"
  bucket = "${var.gcp_bucket}"
  source = "${var.function_zip_source_file}"
}

resource "google_cloudfunctions_function" "function-start" {
  name                  = "${var.start_function_name}"
  description           = "Start VM function"
  runtime               = "nodejs8"
  source_archive_bucket = "${var.gcp_bucket}"
  source_archive_object = "${google_storage_bucket_object.function-zip.name}"
  trigger_topic          = true
  //entry_point           = "helloGET"

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