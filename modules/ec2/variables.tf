variable "tags" {
    description = "Tags para los recursos"
    type        = map(string)
  
}
variable "region" { 
    description = "Region de AWS"
    type        = string
    
}
variable "public_subnets_ids" {
    description = "ID de la subred publica"
    type        = map(string)
  
}
variable "private_subnets_ids" {
    description = "ID de la subred privada"
    type        = map(string)
  
}
variable "iam_instance_profile_name" {
    description = "Nombre del Instance Profile para asociar a la EC2"
    type        = string
  
}
variable "sg_bastion_host_id" {
    description = "ID del Security Group del Bastion Host"
    type        = list(string)
  
}
variable "sg_private_instance_id" {
    description = "ID del Security Group de la Instancia Privada"
    type        = list(string)
  
}
variable "eip_id" {
    description = "ID de la Elastic IP"
    type        = string
  
}