# Despliegue de la infra levantada en terraform con Linux
## Requisitos para modificar y desplegar la infraestructura:
1. Terrafomr
2. Extencion de Terrafomr para VSC
3. Visual Studio Code
4. Git
5. AWS CLI
###
Lo primero q debemos hacer es clonar la repo con 
```
gitn clone https://github.com/Estebadido/reto-tecnico.git
```
###
Despues de eso debemos iniciar el visual dentro de la carpeta de la repo
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
Para que se pueda crear la instancia por favor descomenta esto del main del modulo de ec2, ya que con eso protejo a la instancia de ser eliminada por algun cambio a nivel de sg, iam rol entre otros ya que terraform no puede hacer modificaciones en caliente
```
lifecycle {
  ignore_changes = all
}
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
Despues de terminar el despliegue y queremos modificar algo a nivel de sg, iamrol, tablas de rutas entre otros, volvemos a comentar el lifecycle para proteger los ec2 
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
### Actualmente 

