library(mice)

housing.data <- read.csv("../../data/tema1/housing-with-missing-value.csv", header = TRUE, stringsAsFactors = FALSE)

columns <- c("ptratio", "rad")

imputed_data <- mice(housing.data[,names(housing.data) %in% columns],
                     m = 5, # número de muestras
                     maxit = 50, ##iteraciones que toma para calcular cada valor
                     method = "pmm", #predictive mean matching, hay hasta 4 tipos 
                                    #(pmm, 
                                     #logreg, regresión logística 1 col con factor 2 niveles,
                                    #regresión logística politómica 1col con factor con 2 o más niveels)
                                    #modelo de probabilidades proporcionales
                     seed = 2018 #para que siempre los resultados sean los mismos , no cambie aleatoriamente
                     )

## pmm - comparación predictiva de medias
## logreg - regresión logística
##polireg - regresión logística politómica
##polr - modelo de probabilidades proporcionales

summary(imputed_data)

complete.data <- mice::complete(imputed_data) ##indicamos el paquete delante sipuede haber conflicto

housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

anyNA(housing.data) #indica cuantos na hay

## Otra forma ##########
impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)

impute_arg

impute_arg$imputed$rad
