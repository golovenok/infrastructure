provider "google" {
  version = "3.0.0"
  project = var.project
  region  = var.region
}

module "storage-bucket" {
  source  = "SweetOps/storage-bucket/google"
  version = "0.3.1"
  name =  "sddsdxvcfdsgrdgegeg"
  location = var.region
  project = var.project
}

output storage-bucket_url {
  value = "module.storage-bucket.url"
}
