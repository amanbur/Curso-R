#Reescalado de valores muy grandes, que dominan la estadística, en el rango 0-1
install.packages("scales")
library(scales)
students <- read.csv("../../data/tema1/data-conversion.csv")

students$Income.rescaled <- rescale(students$Income) ##Reescalamos income a 0-1

(students$Income - min(students$Income))/(max(students$Income - min(students$Income))) #Fórmula de reescalado , lo mismo de arriba
                                                                                       #(Valor - minimo) / (maximo -minimo)

rescale(students$Income, to = c(0, 100)) #Indicamos el rango de escalado

rescale.many <- function(dataframe, cols){
  names <- names(dataframe)  
  
  for(col in cols){
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col])
  }
  cat(paste("Hemos reescalado ", length(cols), " variable(s)"))
  dataframe
}

#Reescalar varias variables a la vez
students <- rescale.many(students, c(1,4))
