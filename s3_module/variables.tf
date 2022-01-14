variable "name" {
  type    = string
  default = "Bucket name"
}

variable "acl" {
  type        = string
  description = ""
  default     = "private"
}

variable "policy" {
  type        = string
  description = ""
  default     = null
}

variable "key_prefix" {
  type    = string
  default = ""
}

variable "files" {
  type    = string
  default = ""
}

variable "website" {
  type        = map(string)
  description = ""
  default     = {}
}

variable "versioning" {
  type        = map(string)
  description = ""
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Instance tags"
  default = {
    "Name"    = "Static Site Test"
    "Project" = "Terraform Modules Test Provisioner"
  }
}
