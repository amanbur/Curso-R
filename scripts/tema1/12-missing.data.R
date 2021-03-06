################QUITAR NAs ELIMINANDO LA INFORMACI�N###########


housing.data <- read.csv("../../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)


summary(housing.data) #minimo, primer cuartil, mediana , promedio, segundo cuartil , m�ximo

#Eliminar observaciones con NA
housing.data.1 <- na.omit(housing.data)

summary(housing.data.1)

#S�lo eliminamos los na de alguna variable o columna
drop_na <- c("rad") #indicamos cuales queremos conservar de las que tienen na
housing.data.2 <- housing.data[ 
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),]

summary(housing.data.2)
  
##Eliminar toda una columna
housing.data$rad <- NULL

summary(housing.data)

##Eliminar varias variables que tengan NAs  
drops <- c("rad", "ptratio")

housing.data.3 <- housing.data[, !(names(housing.data)%in% drops)]


#######################QUITAR NAS SUSTITUYENDO INFORMACI�N##############
install.packages("Hmisc")
library(Hmisc)

housing.data.copy1 <- housing.data
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean) # Sustituir NAs por un valor, en este caso el promedio
housing.data.copy1$rad <- impute(housing.data.copy1$ptratio, mean) # Sustituir NAs por un valor, en este caso el promedio
summary(housing.data.copy1)

housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <-impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <-impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)

housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <-impute(housing.data.copy2$ptratio, 18)
housing.data.copy3$rad <-impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)


install.packages("mice")
library(mice)

md.pattern(housing.data) #An�lisis del daataframe , que es conocido y que no , cuantos registros de cada....

install.packages("VIM")
library(VIM)

aggr(housing.data)  # Ver gr�ficamente el an�lisis

aggr(housing.data,
     col = c('green', 'red'), #color de se encuentra o si no
     numbers = TRUE, # porcentajes
     sortVars = TRUE,#ordena en consola las vars de mayor a menor
     labels = names(housing.data), #etiquetas
     cex.axis=0.7, #tama�o de fuente
     gap = 1,  #espacio entre gr�ficos
     ylab = c("histograma de NAs", "Patr�n") #Cambio de los t�tulos
     )  
