variable "region" { 
    description = "Region de AWS"
    type        = string
    default     = "us-east-1"
    
}
variable "evironment" { 
    description = "Variables que define el entorno"
    type        = string
    default     = "develop"
}
variable "project" { 
    description = "Nombre del proyecto"
    type        = string
    default     = "reto_tecnico"
  
}
variable "owner" { 
    description = "Nombre del propietario del proyecto"
    type        = string
    default     = "esteban"
}