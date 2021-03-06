housing <- read.csv("../../data/tema1/BostonHousing.csv")

housing.z <- scale(housing) #normaliza, resta su media  divide por desviaci�n t�pica
# en este caso center = true scale =true 
housing.z <- scale(housing, center = TRUE, scale = TRUE)

housing.none <- scale(housing, center = FALSE, scale = FALSE) #en este caso el dataframe queda igual que
                                                          # el original

housing.mean <- scale(housing, center = TRUE, scale = FALSE ) #resta el promedio pero no divide por la desviaci�n t�pica

housing.sd <- scale(housing, center = FALSE, scale = TRUE) #no resta promedio, divide por desv. t�pica

#desviaci� estandar sd= sqrt(sum(x^2)/(n-1))

scale.many = function(dataframe, cols){ #sustraer categ�ricas, escalar s�lo algunas variables
  names <- names(dataframe)
  
  for(col in cols){
    name<-paste(names[cols], "z", sep=".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ", length(cols), " variable(s)"))
  
  dataframe
}

housing <- scale.many(housing, c(1,3,5:8))
