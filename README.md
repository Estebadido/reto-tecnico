# Despliegue de la infra levantada en terraform con Linux
## Requisitos para modificar y desplegar la infraestructura:
1. Terraform
2. Extensión de Terraform para VSC
3. Visual Studio Code
4. Git/ Github
5. AWS CLI
###
Lo primero q debemos hacer es clonar el repositorio con:
```
git clone https://github.com/Estebadido/reto-tecnico.git
```
###
Despues de eso debemos iniciar el visual dentro de la carpeta del repositorio
```
code .
```
###
Posterior a eso configuramos el AWS CLI
```
aws configure
```
###
Si deseas crear tu propia llave ssh modifica el public_key del modulo ec2 generando una llave con putty, en caso quieras trabajar con la que he creado te dejo los link del las llaver para putty y para el bastion
```
https://www.mediafire.com/file/6klxa3vedil51y0/Reto_Tecnico_Key.ppk/file
https://www.mediafire.com/file/0wfg849vcy8gvky/Reto_Tecnico_Key/file
```
###
Despues de tener todo configurado abrimos la terminal de visual y ponemos 
```
terraform init
terraform apply
```
Nos pedira confirmar con "yes"
###
Esperamos a que la infraestructura se despliegue
###
###
###
## Como entrar al bastion y a instancia privada
###
Para poder ingresar al bastion se puede hacer de 2 formas, la primera es por ssm(en algunos casos deber reiniciar la instancia para que el rol se cargue) y la otra es por ssh
###
Ingresamos al bastion y creamos una llave con 
```
vi Reto_Tecnico_Key.pem
```
###
Pegamos el contenido de la llave y guardamos
###
Le damos permisos para que pueda usar la llave
```
chmod 400 Reto_Tecnico_Key.pem
```
###
Ingresamos del bastion a la instancia priv con 
```
ssh -i Reto_Tecnico_Key.pem ec2-user@10.0.4.10
```
###
###
###
## Nota:
### No podemos ingrsar por SSM a la instancia priv ya que antes de eso deberiamos crear un endpoint para el ec2, por eso usamos el bastion como metodo de ingreso
###
###
## Nota2:
### En caso de dudas, comentarios o sugerencias enviarme un correo a estebanrt17@gmail.com
###
###
###
## Diagrama de la arquitectura
https://lucid.app/lucidchart/79c7f20d-f273-424d-956a-0dd9b74f2412/edit?viewport_loc=-1953%2C-546%2C4556%2C2705%2C0_0&invitationId=inv_1dd79a87-48d1-4add-ae7b-e163b293f791
###
###
Saludoooooos
![Diagrama de una solicitud HTTP](https://i.pinimg.com/736x/09/04/91/090491a3b8106ba0cccf357cb203c570.jpg)
