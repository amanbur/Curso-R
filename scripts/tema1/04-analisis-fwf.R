#Leer ficheros txt con cada columna con un ancho fijo
students_data <-  read.fwf("../../data/tema1/student-fwf.txt",
                           widths=c(4, 15, 20, 15, 4), col.names= c("id", "nombre", "email", "carrera", "año"))

students_data_header <- read.fwf("../../data/tema1/student-fwf-header.txt", 
                                 widths = c(4,15,20,15,4), header = TRUE, 
                                 sep="\t", #separador tabulador
                                 skip=2 # salta las 2 primeras líneas
                                 )
                                 
#Quitar una columna, ponemos el ancho en negativo y quitamos la cabecera
students_data_no_email <-  read.fwf("../../data/tema1/student-fwf.txt",
                           widths=c(4, 15, -20, 15, 4), 
                           col.names= c("id", "nombre",  "carrera", "año"))
