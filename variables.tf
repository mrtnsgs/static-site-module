variable "aws_region" {
  type        = string
  description = "AWS Region"
  default     = "us-east-2"
}

variable "aws_profile" {
  type        = string
  description = "AWS Profile with the credentials"
  default     = "default"
}
