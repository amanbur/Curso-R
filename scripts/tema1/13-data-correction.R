install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("../../data/tema1/USArrests.csv", stringAsFactors = FALSE)

View(crime.data)

crime.data <- cbind(state = rownames(crime.data), crime.data)  #Añadir columnas al dataframe

crime.data.1 <- gather(crime.data,
                       key = "crime_type", value = "arrest_estimate",
                       Murder : Rape)

crime.data.2 <- gather(crime.data, 
                       key="crime_type",
                       value="arrest_estimate",
                       -state) ## Todas las vars excepto la que se indica tras el -

crime.data.3 <- gather(crime.data,
                       key ="crime_type",
                       value = "arrest_estimate")

crime.data.3 <- gather(crime.data,                # Sólo algunas columnas
                       key ="crime_type",
                       value = "arrest_estimate",
                       Murder, Assault)

################Función contraria a gather : spread ##########

crime.data.4 <- spread(crime.data.2, key="crime_type", value="arrest_estimate")


#### Función unit : toma varias columnas y las unifica en una sola ###

crime.data.5 <- unite(crime.data, 
                      col = "Murder_Assault",
                      Murder, Assault,
                      sep = "_") # Lo junta en una col separados por un _


####### Contrario a unit :   separate ######
crime.data.6 <- separate(crime.data.5, 
                         col = "Murder_Assault",
                         into = c("Murder","Assault"),
                         sep = "_")
