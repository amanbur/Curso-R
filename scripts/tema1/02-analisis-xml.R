install.packages("XML")
library(XML)


url <- "../../data/tema1/cd_catalog.xml"

xmldoc <- xmlParse(url) #XMLInternalDocument

rootnode <- xmlRoot(xmldoc)
rootnode[1]
rootnode[2]

cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x, xmlValue))
cds.catalog <- data.frame(t(cds_data), row.names = NULL)
head(cds.catalog, 2)
cds.catalog[1:5,]
cds.catalog[1:5,2]
cds.catalog[1:5,2:1]

xpathSApply()
#xpathSApply()
#getNodeSet()

population_url <- "../../data/tema1/WorldPopulation-wiki.htm"
tables <- readHTMLTable(population_url)

most_populated <- tables[[6]]
head(most_populated, 3)

custom_table <- readHTMLTable(population_url, which = 6)

liga_url <- "https://es.wikipedia.org/wiki/Anexo:Clasificación_histórica_de_la_Primera_División_de_España"
tablesLiga <- readHTMLTable(liga_url)
clas_liga <- tablesLiga[[1]]
head(clas_liga, 50)
