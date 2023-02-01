# Tipos Básicos de Dados em R

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# Numeric - Todos os números criados em R são do modo numeric
# São armazenados como números decimais (double)

num1 <- 7
num1

class(num1)
mode(num1)
typeof(num1)

num2 = 16.82
num2

mode(num2)
typeof(num2)


# Integer
# Convertemos tipos numeric para integer

is.integer(num2)

y = as.integer(num2) # converte num2 em integer
y
class(y)
mode(y) # modo de armzenamento
typeof(y)

as.integer('3.17') # consegue converter para numero mesmo estando dentro de ""
as.integer("Joe")
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)
as.integer('TRUE')

