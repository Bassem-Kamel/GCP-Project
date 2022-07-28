#project _ vars : ---------------------------
variable "project_id" {
  type = string
}

#network _ vars : ----------------------------------------
variable "vpc_name" {
  type = string
}
variable "region" {
  type = string
}
variable "manage_cidr" {
  type = string
}
variable "restricted_cidr" {
  type = string
}

#vms _ vars :------------------------------------------------------
variable "vm_type" {
  type = string
}

variable "vm_zone" {
  type = string
}

variable "vm_image" {
  type = string
}