data <- read.csv("../../data/tema1/missing-data.csv", na.strings = "")
View(data)

#En lugar de saltarse los datos con Na pordemos reemplazarlos por otros 
#Por ejemplo podemos meter el promedio
data$Income.mean <- ifelse(is.na(data$Income), 
                            mean(data$Income, na.rm= TRUE),
                            data$Income
                           )

##Reemplazar huecos con valores aleatorios extraídos de una muestra aleatoria de los datos que no faltan
rand.impute <- function(x){ # x es un vector de datos que puede contener NA (númerico, categórico...)
  missing <- is.na(x) # missing contiene un vector de valores T/F dependiendo del NA de x, TRUE si es na , false si no
  n.missing <- sum(missing) #suma de los trues ( cuantos valores son NA)
  x.obs <- x[!missing] #valores que tienen dato diferente de NA en X , valores conocidos
  imputed <- x #por defecto, devolveré lo mismo que había entrado por parámetro
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE) #en los valores que faltaban, 
                                                               #los reemplazamos por una muestra de los conocidos
  
  return(imputed)
}

##Lo anterior es una técnica básica de probabilidad, el reemplazo aleatorio. Esta técnica sirve para variables de todo tipo, en
# el caso del promedio sólo servía para las numéricas

random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  
  for(col in cols){
    name <- paste(names[col], ".imputed", sep = "")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  return(dataframe)
}

data <- read.csv("../../data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income==0] <-NA
data <- random.impute.data.frame(data, c(1,2))

