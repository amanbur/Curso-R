data <- read.csv("../../data/tema1/missing-data.csv", na.strings="") ##Rellenamos los huecos con NA

View(data)

data.cleaned <- na.omit(data) ##Elimina las filas con NA

View(data.cleaned)

is.na(data[4,2]) #Comprueba si hay na
is.na(data$Income) #Toda la columna income
