install.packages("jsonlite")
library(jsonlite)



dat.1 <- fromJSON("../../data/tema1/students.json")
dat.2 <- fromJSON("../../data/tema1/student-courses.json")



install.packages('curl')
library(curl)

url <- "https://finance.yahoo.com/webservice/v1/symbols/allcurrencies/quote?format=json"
currencies <- fromJSON(url)

currency.data <- currencies$list$resources$resource$fields

install.packages("rjson")
library(rjson)

dat.3 <- toJSON(currencies)

show(dat.3)


dat.1$Major

currency.data[1:3, 1:3]

dat.1[c(2,5,8),] #Estudiantes 2,5 y 8 y todas las columnas
dat.1[,c(2,5)] ##Todas los estudiantes y las columnas 2 y 5

head(dat.2, 4)
