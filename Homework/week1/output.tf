output "gcs_bucket" {
    value = "${google_storage_bucket.gcs.name}"
}

output "gbq" {
    value = "${google_bigquery_dataset.gbq.dataset_id}"
}