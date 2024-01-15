variable "docker_host" {
    type = string
    description = "The docker host"
    default     = "unix:///var/run/docker.sock"
}

variable "pm_api_token_id" {
    type = string
    description = "The proxmox api token id"
}

variable "pm_api_token_secret" {
    type = string
    description = "The proxmox api token secret"
}

variable "pm_api_url" {
    type = string
    description = "The proxmox api url"
    default = "https://0.0.0.0:8006/api2/json"
  
}

variable "timezone" {
    type = string
    description = "The timezone"
    default     = "Europe/Berlin"
}
