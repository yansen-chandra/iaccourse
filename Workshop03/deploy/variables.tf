variable do_token {
    type = string
    sensitive = true
}

variable "do_region" {
  type = string
  default = "sgp1"
}

variable "do_image" {
  type = string
  default = "135492600"
}

variable "do_size" {
  type = string
  default = "s-1vcpu-1gb"
}

variable "do_ssh_key" {
  type = string
  default = "aipc"
}

variable "ssh_private_key" {
  type = string
}

variable "cs_domain"{
  type = string

}

variable "cs_password" {
  type = string
  sensitive = true
}


