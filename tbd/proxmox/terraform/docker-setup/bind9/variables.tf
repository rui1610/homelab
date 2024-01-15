variable "docker_host" {
  type        = string
  description = "The docker host"
  default     = "unix:///var/run/docker.sock"
}

variable "host_path_named_conf" {
  type        = string
  description = "Local configuration path for file named.conf"
  default     = "/Users/D045023/container/data/bind9/conf"
}

variable "host_path_cached_data" {
  type        = string
  description = "Location where locally cached data can be dumped."
  default     = "/Users/D045023/container/data/bind9/cached_data"
}

variable "host_path_resource_records" {
  type        = string
  description = "Location of Resource Records defining various domain information."
  default     = "/Users/D045023/container/data/bind9/resource_records"
}

variable "host_port_53" {
  type        = string
  description = "The port used on the host for container port 53"
  default     = "30053"
}

variable "user" {
  type        = string
  description = "The user"
  default     = "bind"
}

variable "timezone" {
  type        = string
  description = "The timezone"
  default     = "Europe/Berlin"
}
