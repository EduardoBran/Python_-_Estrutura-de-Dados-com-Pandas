# Tipos Básicos de Dados em R

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# Vetor - lista de elementos
# Possui 1 dimensão e 1 tipo de dado

vetor1 <- c(1:20)
vetor1

length(vetor1)
class(vetor1)
mode(vetor1)
typeof(vetor1)


# Matriz
# Possui 2 dimensões e 1 tipo de dado

matriz1 <- matrix(1:20, nrow = 2) # nrow nº de linhas
matriz1

matriz1[2,9]

length(matriz1)
class(matriz1)
mode(matriz1)
typeof(matriz1)


# Array
# Possui 2 ou mais dimensões e 1 tipo de dado

array1 <- array(1:5, dim = c(3,3,3))
array1

length(array1)
class(array1)
mode(array1)
typeof(array1)
