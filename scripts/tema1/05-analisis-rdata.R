clientes <- c("Juan Grabiel", "Ricardo", "Pedro")
fechas <- as.Date(c("2017-12-27", "2017-11-1", "2018-1-1")) #Indica que son fechas
pago <- c(315, 192.55, 40.15)
pedidos <- data.frame(clientes, fechas, pago) #Creando un dataFrame

save(pedidos, file = "../../data/tema1/pedidos.Rdata") #Guardar el dataFrame en fichero

saveRDS(pedidos, file = "../../data/tema1/pedidos.rds")

clientes_vip <- c("Juan Gabriel", "Pedro")

#Podemos guardar más de un objeto a la vez
save(pedidos, clientes_vip, file = "../../data/tema1/pedidos.Rdata") 

remove(pedidos)

#Cargar fichero Rdata
load("../../data/tema1/pedidos.Rdata")

#RDS hay que crear una variable donde guardarlo, no guarda el nombre d ela variable
orders <- readRDS("../../data/tema1/pedidos.rds")

#Paquetes de dataset precargados en R
data(iris)
view(iris)

data(cars)
View(cars)

data(clientes_vip)
View(clientes_vip)

##Guardar todos los objetos de una sesión
save.image(file = "../../data/tema1/alldata.Rdata")

load("../../data/tema1/alldata.Rdata")

#Cargar directamente los vectores en el Rdata
primes <- c(2,3,5,7,11,13)
pow2 <- c(2,4,8,16,32,64,128)
save( list = c("primes", "pow2"), file ="../../data/tema1/primes_and_pow2.Rdata")

load("../../data/tema1/primes_and_pow2.Rdata")

attach("../../data/tema1/primes_and_pow2.Rdata") #Si ya están cargados da error

data() #Información de datasets y paquetes instalados
