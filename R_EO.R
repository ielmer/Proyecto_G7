5+ 5
10/3
3*3
###comentario
##Variables
x = 10
y <-5
d=5.5
precio <- 10
cantidad <-4
total=precio * cantidad
total
##Tipo de dato
r=1
w=2
y=3
##Texto
nombre= "Elmer"
##Logicos
logico_t= TRUE
##Obtenet tipo de variable
typeof(logico_t)
typeof(nombre)
typeof(d)
##comparaciones
logico_a= TRUE
logico_b= FALSE
5>3
5<3
5>=5
5==5
5==3
5> = 5 #ERROR

5!=3#Diferente
###Comaraciones con texto

"Julio"== "Mario"
"Julio"!= "Mario"

"A">"B" #falso debido a que A esta antes que B
"B">"A" #Verdadero debido a que B esta antes que A
"A">="B" #falso debido a que A esta antes que B
"B">="A" #Verdadero debido a que B esta antes que A
###Comparaciones con valores logicos

TRUE == 1 # R interpreta TRUE como si fuera 1
 
FALSE == 0 # R interpreta FALSO como si fuera 0


TRUE> FALSE # entonces esto es verdadero
FALSE> TRUE # entonces esto es FALSO

###Operaciones logicas

TRUE + TRUE 
TRUE-TRUE
TRUE+ FALSE

!TRUE #Resultado FALSE
!FALSE
#AND (y)
TRUE&FALSE
TRUE&TRUE
FALSE&TRUE
TRUE&TRUE&TRUE
TRUE&TRUE&FALSE
# OR (ó)
TRUE|FALSE
TRUE|TRUE
TRUE|TRUE|TRUE|TRUE
TRUE|TRUE|TRUE|FALSE
5>3|2>3
5>3&2>3
###OPERACIONES CON TEXTO
"a"+"a" #error
"a"*2  #error
#concatenar
p=cat("a","b")
rep("a", 5)
o=paste("a","b",sep="-")
o
paste("a","b",sep="*")
paste("a","b",sep="")
paste0("a","b","c")
paste("a","b",sep="+")
u=cat("a","b",sep = "+")

nombre="elmer"

apellido="Oliveros"
nombre_completo=cat(nombre,apellido)
nombre_completo2=paste(nombre,apellido,sep = "+")
nombre_completo2
rep(nombre_completo2,5)
rep(nombre_completo,5)
###Arreglos numericos
numeros=c(2,3,4,5)
###Arreglos de datos logicos
logicos=c(TRUE,FALSE,TRUE)
###Arreglos de caracteres
letras=c("r","t","e","Hola mundo")
###valores numericos con logicos
logico_munero=c(TRUE, FALSE, 2,3, 4)
(logico_munero=c(TRUE, FALSE, 2.3, 4))
###Valores numericos con texto
numeros_texto=c(2,10,50,"Elmer")
(numeros_texto=c(2,10,50,"Elmer"))
###LISTAS
(numerico_texto_lista=list(2,10,50,40,"elmer"))
(numerico_texto_lista=list(2,10,50,40,numeros_texto))

(lista_grande=list(4,"Hola mundo",FALSE,numerico_texto_lista))

(numerico_lista_1=list(10,20,30,40,50))
(numerico_lista_2=list(5,15,25,35,45,numerico_lista_1))

numerico_lista_1[4]
numerico_lista_1[1]
numerico_lista_1[1:3] #debuelve rangos de listas
###FUNCIONES
sin(45)
log(100)
seq(1,10)
runif(1000,7,10)
numeros
length(numeros)#numero de valores en el arreglo
min(numeros)#minimo valor del arreglo
max(numeros)#numero mayor
sum(numeros)#suma de los valores del arreglo
mean(numeros)#promedio
summary(numeros)#estadisticos basicos del arreglo


###Grupo de datos
install.packages("tidyverse")
library(tidyverse)#llamando la libreria
#DATAFRAMES
(lista_escolar=data.frame(nombre=c("Julio", "Juan","Luis","Oscar","Maria","Favian","Manuel","Rosa"),
                          apellido=c("Guadarra","Perez","Sulca","Condor","Bejar",NA,"Guardia","Aranguren"),
                          sexo=c("M","M","M","M","F","M","M","F"),
                          calificaciones=c(15,20,16,17,19,14,10,0)
                          ))
lista_escolar$nombre#llamando una columna
lista_escolar$nombre[3]#llamando a un dato del dataframe
lista_escolar$nombre[3:6]#llamando un rango de valores
lista_escolar$nombre[c(1,3,5)]#elijiendo valores de las posiciones mencionadas 
lista_escolar[1,1]#otra forma de llamar un valor del dataframe
lista_escolar[1:3,1:3]#otra forma de llamar por rango de datos
lista_escolar[c(1,3,5),c(1,2)]#ellejir elementos salteados

###Seleccion de filas y columnas
library(tidyverse)
filter(lista_escolar,sexo=="F")#filtra solo los de sexo F
lista_escolar$sexo=="F"##Devuelve True o False
filter(lista_escolar,sexo=="F"& calificaciones==19)##mujer y nota 19
filter(lista_escolar,sexo=="F"| calificaciones==19)##mujer o nota 19

select(lista_escolar,nombre,calificaciones)##seleccionar columnas
lista_escolar%>%select(nombre,calificaciones)##lo mismo que la linea anterior

lista_escolar%>%filter(sexo=="F"& calificaciones==19) %>%
  select(nombre,calificaciones) ##operaciones con dos condiciones
###Operaciones con datos 
lista_escolar%>%group_by(sexo)%>%summarise(mean(calificaciones))#dos consulas, agruparlos por sexo y hacer un promedio
lista_escolar%>%group_by(sexo)%>%
  summarise(calificacion_promedio=mean(calificaciones))#mejorando la consulta anterior

lista_escolar%>%group_by(sexo)%>%
  summarise(calificacion_mediana=median(calificaciones))#dos consulas, agruparlos por sexo y CALCULAR LA MEDIANA

lista_escolar%>%group_by(sexo)%>%
  summarise(calificacion_minima=min(calificaciones))#dos consulas, agruparlos por sexo y OBTENER NOTA MINIMA

lista_escolar%>%group_by(sexo)%>%
  summarise(calificacion_maxima=max(calificaciones))#dos consulas, agruparlos por sexo y OBTENER NOTA maxima

lista_escolar%>%group_by(sexo)%>%
  summarise(numero_estudiante=n())#dos consulas, agruparlos por sexo y contarlos

###Creacion de columnas en una dataframe
lista_escolar
(lista_escolar=lista_escolar%>%mutate(Grupo=1))#Agregar una columna con valor de 1
(lista_escolar=lista_escolar%>%mutate(nombre_completo=paste(nombre,apellido,sep=" "))) #Agregar la columna nombre y apellido con las columnas nombre y apellido

lista_escolar=lista_escolar%>%select(-nombre,-apellido)

###Creando una fila a nuestro dataframe
(lista_escolar=lista_escolar%>%
    rbind(c(sexo="F",calificaciones=16,Grupo=1,nombre_completo="Luisa Hurado")))##agregar una fila

(lista_escolar=lista_escolar%>%
    rbind(data.frame(sexo=c("F","F","F"),calificaciones=c(16,11,10),Grupo=c(1,1,1),nombre_completo=c("Vanesa Hurado","Elva Salas","Evelyn Miranda"))))##agregar una fila

###DATASET DE R
help('mean')
mean(c(NA,3,4,5),na.rm= TRUE) ##ELIMINA LOS na PARA SACAR UN PROMEDIO

x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))##10%


help("select")
starwars##base de datos cargadas por defecto
starwars %>% select(height)

data()##total de base de datos precargadas
CR=CO2%>%nrows=10,skip.head = 10

view(CO2)##ver las distintas columnas que tiene la base de datos
view(starwars)
starwars$height%>%mean(na.rm=TRUE) ##Promedio de una columna eliminando los NA

###BASE DE DATOS PARA R
help("read.csv")
base=read.csv("C:/Data/Data2.csv",fileEncoding="utf-8",stringsAsFactors=FALSE)
base_2=read.csv("C:/Users/elmer/Desktop/Repositorio/Proyecto_G7/Informe_de_virus.csv.csv",fileEncoding="utf-8",stringsAsFactors=FALSE)


base$CyberattackType%>%table()#suma total por tipo de elementao
base$CyberattackType%>%table()%>%prop.table()#lo mismo que la consulta anterio pero en porcentaje
base$CyberattackType%>%table()%>%addmargins()###suma total por tipo de elementao y le agrega la suma total
base$CyberattackType%>%table()%>%prop.table()%>%addmargins()##lo mismo que la consulta anterior soloa que en porcentaje y muestra tambien una columan del 100%
nrow(base)##numero total de filas

install.packages('readxl')
library(readxl)
library(tidyverse)
library(markdown)
base_usuarios=read_xlsx("C:/Data/UdeDmasI.xlsx",sheet="Details",range="A1:M447")
base_usuarios$`Detected object` %>% table()
base_usuarios$`Detected object` %>% table()%>%addmargins()
base_usuarios$`Detected object` %>% table()%>%prop.table()%>%addmargins()
nrow(base_usuarios)




####LOOPS ED PROGRAMACION USANDO R
##IFELSE
titanic = Titanic %>% data.frame()##abrir una base de datos
##ejercicio1: obtener un filtro para los pasajeros que sean de primera clase del sexo masculino para saber el porcentaje de sobrevivencia
titanic%>%head()##inprimier los primeros 5 resultados
titanic%>%filter(Sex=="Male"& Class=="1st")

titanic%>%filter(Sex=="Male"& Class=="1st")%>%select(Survived,Freq)%>%table()

titanic=titanic%>%mutate(hombre_1clase=ifelse(Sex=="Male"& Class=="1st",TRUE,FALSE))##Si es sexo masculino y de primera clase le asigan true de lo contrario false
titanic%>%head()
##if
numero=-1
if (numero>=0) {
  print("positivo")
}else{
  print("numero negativo")
}
##For
#For con numeros
for (i in 1:100) {
 resultado=i/2
  print(paste0(resultado,"=",i,"/2"))
}
paste0(1:10)
##for contexto
starwars$name
for (personaje in starwars$name) {
  print(paste0("Hola ",personaje))
}
for (j in 1:100000) {
  cat("\r",j,"->",100*j/100000,"%")
}
total=0
for (j in 1:100000) {
  total=total+j
  cat("\r",j,"->",100*j/100000,"%")
}
total
##WHILE
numero=10000
sumanumero=0
while (numero>0) {
  sumanumero=sumanumero+numero
  numero=numero-1
  cat("\r",numero)
}
##CREACION DE FUNCIONES EN R
numeros=c(9,2,0,5,3)
mean(numeros)
sum(numeros)

sumanumeros=function(numero1, numero2){
  resultado=numero1+numero2
  return(resultado)
}
sumanumeros(numero1=5,numero2=10)
sumanumeros(45,610)##no es necesario poner numero1 y numero2

sumanumeros=function(numero1=4, numero2=67){##tambien se puede predefinir los valosres de nemero1 y numero2
  resultado=numero1+numero2
  return(resultado)
}
sumanumeros()

###APLICANDO FUNCIONES A UN DATAFRAME

imc=function(masa,estatura){
  indice=masa/estatura^2
  return(indice)
}

imc(masa=80,estatura = 1.89)
starWars=data.frame(starwars)
starWars=starWars%>%mutate(indice=imc(masa=mass,estatura = height/100))
starWars%>%select(name,mass,height,indice)%>%View()

###GRAFICAS EN R
##cargamos la base de datos interna llamada Iris
base_iris=data.frame(iris)
qplot(data=base_iris, x=Petal.Width)
qplot(data=base_iris, x=Species, y=Petal.Width)
qplot(data=base_iris, x=Sepal.Width, y=Sepal.Length,color=Species)
qplot(data=base_iris, x=Petal.Width, y=Petal.Length,color=Species)
qplot(data=base_iris, x=Petal.Width, y=Petal.Length,size=Species)

ggplot(data=base_iris, aes(x=Petal.Width, y=Petal.Length, color=Species))+
  geom_point() + theme_light()


ggplot(data=base_iris, aes(x=Petal.Width, y=Petal.Length, color=Species))+
  geom_point() + facet_grid(.~Species)

ggplot(data=base_iris, aes(x=Petal.Width, y=Petal.Length, color=Species))+
  geom_point() + facet_grid(Species~.)

data=data.frame(mtcars)

#Datos
#Geometria
#Estetica
#Formato

#variables continuas: Es aquella que tiene numeros decimales
#variables distretas: son todos numero enteros o son tipos de caracteristicas(sexo: hombre o mujer, etc)

#ejemplo de de Cheat Sheets
#e+geom_point() ->ejemplo de grafica con dos variables continuas
ggplot(data, aes(x=wt, y=mpg))+geom_point()

# f + geom_violin() -> ejmplo de variable discreta(x) y continua (y)

ggplot(data, aes(x=cyl, y=mpg))+geom_violin()


##COMBINACIONES DE DATAFRAMES

Starwars = data.frame(starwars)
#dividir en dos el dataframe
Starwars_A=Starwars[1:40,]
Starwars_B=Starwars[41:87,]

##Apilar las bases de forma vertical
Starwars_AB=bind_rows(Starwars_A,Starwars_B)

Starwars_AB=Starwars_A%>%bind_rows(Starwars_B)#otra forma de hacer lo mismo





#########################################
#########################################
base_infectados=read_xlsx("C:/Users/elmer/Desktop/Repositorio/Proyecto_G7/Informe de virus.xlsx",sheet="Detalles",range="A1:O1460")


base_infectados$`Detected object` %>% table()
base_infectados$`Detected object` %>% table()
qplot(data=base_infectados, x=`Detected object`)
qplot(data=base_infectados, x=`Detected object`,color=`Detected object`)

base_infectados%>%table()%>%select(Device,`Detected object`)
#######################################
#######################################




Informe_de_virus
Informe_de_virus%>%select(Device,`Object type`)
summarise(calificacion_mediana=median(calificaciones))#dos consulas, agruparlos por sexo y CALCULAR LA MEDIANA


a=Informe_de_virus%>%select(Device,`Object type`)%>%arrange(Device,`Object type`)

W=Informe_de_virus%>%select(Device,`Object type`)

group_by(w,`Object type`)




##Primera consulta
wt=Informe_de_virus%>%select(`Object type`)%>%group_by(`Object type`)%>%summarise(n_incidencias = n())
pie(wt$n_incidencias,wt$`Object type`)


install.packages("pie3D")
install.packages("plotrix")
library(plotrix)
pie3D(wt$n_incidencias,labels = wt$`Object type`,explode = 0.2,border = "white", main = "Incidencias")


pie3D

##Segunda consulta
(Inf_n=Informe_de_virus%>%select(Device,`Object type`)%>%group_by(Device,`Object type`)%>%summarise(n_incidencias = n())%>%arrange(desc(n_incidencias)))
(Inf_2=Informe_de_virus%>%select(Device,`Object type`)%>%group_by(Device,`Object type`)%>%summarise(n_incidencias = n())%>%arrange(desc(n_incidencias))%>%head(15))

qplot(data=Inf_2, x=Device, y=n_incidencias,color=`Object type`)
ggplot(Inf_2, aes(x=Device, y=n_incidencias,color=`Object type`)) + geom_count(size=7)


##Tercera consulta
(Inf_3=Informe_de_virus%>%select(Device,`Object type`,Action,Details,Account)%>%group_by(Device,`Object type`,Action,Account)%>%summarise(n_incidencias = n())%>%arrange(desc(n_incidencias))%>%head(10))

ggplot(Inf_3, aes(x=Account, y=n_incidencias,color=`Object type`)) + geom_count(size=7)


##Cuarta consulta
Inf_4=Informe_de_virus%>%select(`Detected at`,Device,Account,`Object type`,`Path to file`,Details,Action)


##Quinta consulta
glimpse(Inf_4)
install.packages("lubridate",dependencies = TRUE)
library(lubridate)

fecha_tiempo=parse_date_time(Inf_4$`Detected at`,"dmy HM")

df=as.data.frame(fecha_tiempo)
df$fecha=date(df$fecha_tiempo)

df$tiempo=format(df$fecha_tiempo,format = "%H:%M")

qplot(data=df, x=df$fecha, y=df$tiempo)
qplot(data=df, x=df$fecha)
qplot(data=df, x=df$tiempo)


ggplot(df, aes(x=`fecha`, y=`tiempo`)) + geom_line()
##*******************************************##



#(Inf_1=Informe_de_virus%>%select(`Object type`)%>`Object type`)%>%summarise(n_incidencias = n())%>%arrange(desc(n_incidencias))%>%head(15))
#qplot(data=Inf_1, x=Device, y=n_incidencias,color=`Object type`)


Inf_5=Inf_4%>%mutate(fecha_hora=parse_date_time(Inf_4$`Detected at`,"dmy HM"))%>%
  filter(fecha_hora>= as.Date('2022-04-27'),
         fecha_hora<= as.Date('2022-05-04'))%>%
  group_by(horas=floor_date(fecha_hora,unit = 'hour'))%>%
  summarise(conteo=n())

## rellenando lo ceros
horas_completas=data.frame(
  horas=seq(floor_date(min(Inf_5$horas),unit = 'hour'),
            floor_date(max(Inf_5$horas),unit = 'hour'),
            by='hour'))
##left join con horas
Inf_5_hora=horas_completas%>%group_by(horas_redondeadas=floor_date(horas,unit = 'hour'))%>%
  left_join(Inf_5)%>%
  mutate(conteo= ifelse(is.na(conteo),0,conteo))
##grafica inicial
ggplot(data=Inf_5,
       aes(x=horas,
           y=conteo)) +
  geom_line()

##Creando el objeto ts para el modelo
conteo_ts=ts(Inf_5_hora$conteo,
             start = 1,
             frequency = 24)

install.packages('forecast')
library(forecast)
ajuste=auto.arima(y=conteo_ts)
  
summary(ajuste)

predicciones=forecast(ajuste)

min(predicciones[['lower']])
max(predicciones[['upper']])

##grafica de predicciones
p_predict=autoplot(predicciones)

p_predict





install.packages("dplyr")



pie()


install.packages("lessR")
library(lessR)

PieChart(`Object type`,n_incidencias)


#r <- d + geom_bar()




#%>%group_by(`Object type`)%>%count(`Object type`)
#starWars%>%select(name,mass,height,indice)
#%>%summarise(Total_incidentes=count()
#Informe_de_virus%>%group_by(`Object type`)


library(readr)
Informe_de_virus_2 <- read_delim("Informe de virus.csv", 
                               delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(Informe_de_virus)








