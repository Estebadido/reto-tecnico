variable "tags" {
    description = "Tags para los recursos"
    type        = map(string)
  
}
variable "vpc_id" {
  description = "ID de la VPC"
  type = string
}