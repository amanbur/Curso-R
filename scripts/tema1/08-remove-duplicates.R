family.salary = c(40000, 60000, 50000, 80000, 60000, 70000, 60000)
family.size = c(4, 3, 2, 2, 3, 4, 3)
family.car = c("Lujo", "Compacto", "Utilitario", "Lujo", "Compacto", "Compacto", "Compacto")

family <- data.frame(family.salary, family.size, family.car)

# Unique nos devuelve el vector pasado sin duplicados
family.unique <- unique(family)

duplicated(family) #vector de booleanos indicando si cada fila es o no duplicado de alguien, se marca sólo cuando llega el duplicado
                   # la primera ocurrencia no se indica como duplicada 

family[duplicated(family),] # Para indicar que me devuelva sólo las duplicadas

family[!duplicated(family),] # Para indicar que me devuelva sólo las no duplicadas (mismo que unique)
