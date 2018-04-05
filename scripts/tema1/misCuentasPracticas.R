tmp <- read.csv("../../data/tema1/tmp1981404305.csv")

tmp$Ingresos.cero <- ifelse(is.na(tmp$Ingresos), 
                           0,
                           tmp$Ingresos
)

tmp$Pagos.cero <- ifelse(is.na(tmp$Pagos), 
                            0,
                            tmp$Pagos
)

pagos <- data.frame( c(sum(tmp$Pagos.cero)), row.names = c("Pagos"))
