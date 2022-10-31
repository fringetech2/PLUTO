resource "google_cloudfunctions_function" "function" {      
  project             = var.project_id
  name                = var.function
  available_memory_mb = 256
  runtime             = "python39"
  source_repository {
    url = "https://github.com/fringetech2/PLUTO/tree/master/cloudfunction/"
  }
  entry_point       = "pubsub_to_bigquery"
  timeout = 60
  event_trigger {
    resource   = google_pubsub_topic.topic.name
    event_type = "google.pubsub.topic.publish"
  }
  depends_on = [google_pubsub_topic.topic]
}
