################QUITAR NAs ELIMINANDO LA INFORMACIÓN###########


housing.data <- read.csv("../../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)


summary(housing.data) #minimo, primer cuartil, mediana , promedio, segundo cuartil , máximo

#Eliminar observaciones con NA
housing.data.1 <- na.omit(housing.data)

summary(housing.data.1)

#Sólo eliminamos los na de alguna variable o columna
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


#######################QUITAR NAS SUSTITUYENDO INFORMACIÓN##############
install.packages("Hmisc")
library(Hmisc)

housing.data.copy1 <- housing.data
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean) # Sustituir NAs por un valor, en este caso el promedio
housing.data.copy1$rad <- impute(housing.data.copy1$ptratio, mean) # Sustituir NAs por un valor, en este caso el promedio
summary(housing.data.copy1)
