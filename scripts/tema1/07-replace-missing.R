data <- read.csv("../../data/tema1/missing-data.csv", na.strings = "")
View(data)

#En lugar de saltarse los datos con Na pordemos reemplazarlos por otros 
#Por ejemplo podemos meter el promedio
data$Income.mean <- ifelse(is.na(data$Income), 
                            mean(data$Income, na.rm= TRUE),
                            data$Income
                           )

