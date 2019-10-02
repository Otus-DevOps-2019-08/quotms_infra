variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  default = "europe-west1"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable disk_image {
  description = "Disk image"
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
