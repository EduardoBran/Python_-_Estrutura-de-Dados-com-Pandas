# Lista de ExercÃ­cios - CapÃ­tulo 2

# Obs: Caso tenha problemas com a acentuaÃ§Ã£o, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretÃ³rio de trabalho
# Coloque entre aspas o diretÃ³rio de trabalho que vocÃª estÃ¡ usando no seu computador
# NÃ£o use diretÃ³rios com espaÃ§o no nome
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e
# imprima um resumo do dataset

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris

# Exercício 8 - Usando a funÃ§Ã£o subset, crie um novo dataframe com o conjunto de dados do dataframe iris
# em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a funÃ§Ã£o subset()

# Exercício 9 (Desafio) - Crie um dataframe que seja cÃ³pia do dataframe iris e usando a função slice(),
# divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

# Exercício 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas
# valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a funÃ§Ã£o filter




# ---------------------------------------------------------------------------------------------------------

# Exercício 1 - Crie um vetor com 30 números inteiros

vet_ex1 <- 1:30
vet_ex1

vet2_ex1 <- seq(1:30)
vet2_ex1

class(vet_ex1)
is.vector(vet_ex1)
class(vet2_ex1)
is.vector(vet2_ex1)

# ---------------------------------------------------------------------------------------------------------

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros

matriz_ex2 = matrix(c(1:16), nr = 4, nc = 4)
matriz_ex2

matriz2_ex2 = matrix(c(1:16), nr = 4, nc = 4, byrow = T)
matriz2_ex2

# ---------------------------------------------------------------------------------------------------------

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente

lista_ex3 = list(vet_ex1, matriz_ex2)
lista_ex3

# ---------------------------------------------------------------------------------------------------------

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat

df_ex4 = read.table('https://grodri.github.io/datasets/effort.dat')
df_ex4

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")

names(df_ex4) <- c('config', 'esfc', 'chang')
df_ex4

# ---------------------------------------------------------------------------------------------------------

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e
# imprima um resumo do dataset

imprimindo_df_iris = iris
imprimindo_df_iris
View(iris)

dim(iris)

head(iris)

summary(iris)

# ---------------------------------------------------------------------------------------------------------

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris

plot(iris$Sepal.Length, iris$Sepal.Width)
