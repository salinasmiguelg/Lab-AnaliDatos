library(ggplot2)
library(ggpubr)
library(FactoMineR)
library(factoextra)
data <- read.csv2(choose.files(), sep=",")
#eliminar NA's. Hay 16 NA's en la data, todas en el atributo BareNuclei.
data <- na.omit(data)

#https://gitlab.com/nameless999/material-analisis-de-datos/-/blob/main/1_PCA.ipynb
#http://www.sthda.com/english/articles/31-principal-component-methods-in-r-practical-guide/112-pca-principal-component-analysis-essentials/
d<-data[,-11]
pca <- PCA(d[,-1], scale.unit = TRUE, ncp = 5, graph = TRUE)
pca


#funcion para hallar moda. https://r-coder.com/moda-r/
modes <- function(x) {
  return(as.numeric(names(which.max(table(x)))))
}
columns <- data.frame(
  "op" = c("Mediana", "Media", "Moda", "Desviacion", "Varianza"),
  "SampleCode"= c(median(data$SampleCode),mean(data$SampleCode),modes(data$SampleCode),sd(data$SampleCode),var(data$SampleCode)),
  "ClumpThickness"= c(median(data$ClumpThickness),mean(data$ClumpThickness),modes(data$ClumpThickness),sd(data$ClumpThickness),var(data$ClumpThickness)),
  "UOCSize"= c(median(data$UOCSize),mean(data$UOCSize),modes(data$UOCSize),sd(data$UOCSize),var(data$UOCSize)),
  "UOCShape"= c(median(data$UOCShape),mean(data$UOCShape),modes(data$UOCShape),sd(data$UOCShape),var(data$UOCShape)),
  "MarginalAdhesion"= c(median(data$MarginalAdhesion),mean(data$MarginalAdhesion),modes(data$MarginalAdhesion),sd(data$MarginalAdhesion),var(data$MarginalAdhesion)),
  "SingleEpithelialCellSize"= c(median(data$SingleEpithelialCellSize),mean(data$SingleEpithelialCellSize),modes(data$SingleEpithelialCellSize),sd(data$SingleEpithelialCellSize),var(data$SingleEpithelialCellSize)),
  "BareNuclei"= c(median(data$BareNuclei),mean(data$BareNuclei),modes(data$BareNuclei),sd(data$BareNuclei),var(data$BareNuclei)),
  "BlandChromatin"= c(median(data$BlandChromatin),mean(data$BlandChromatin),modes(data$BlandChromatin),sd(data$BlandChromatin),var(data$BlandChromatin)),
  "NormalNucleoli"= c(median(data$NormalNucleoli),mean(data$NormalNucleoli),modes(data$NormalNucleoli),sd(data$NormalNucleoli),var(data$NormalNucleoli)),
  "Mitoses"= c(median(data$Mitoses),mean(data$Mitoses),modes(data$Mitoses),sd(data$Mitoses),var(data$Mitoses)),
  "Class"= c(median(data$Class),mean(data$Class),modes(data$Class),sd(data$Class),var(data$Class)))
columns



summary(data)
cor(data)#coef de person. https://www.rdocumentation.org/packages/stats/versions/3.6.2/topics/cor


