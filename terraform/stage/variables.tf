variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default     = "europe-west1"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable connection_key {
  description = "Private key for provisioners connection"
}
variable zone {
  description = "instance zone"
  default     = "europe-west1-b"
}
variable server_count {
  default = 1
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
