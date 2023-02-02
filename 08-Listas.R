# Listas, OperaÃ§Ãµes com Listas e Listas Nomeados

# Configurando DiretÃ³rio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# Use list() para criar listas

# Lista de Strings
lista_caracter1 = list('A', 'B', 'C')
lista_caracter1
lista_caracter2 = list(c('A', 'A'), 'B', 'C')
lista_caracter2
lista_caracter3 = list(matrix(c('A', 'A', 'A', 'A'), nr = 2), 'B', 'C')
lista_caracter3



# Lista de números inteiros
lista_inteiros = list(2, 3, 4)
lista_inteiros

# Lista de floats
lista_numerico = list(1.90, 45.3, 300.5)
lista_numerico

# Lista de números complexos
lista_complexos = list(5.2+3i, 2.4+8i)
lista_complexos

# Lista de valores lógicos
lista_logicos = list(TRUE, FALSE, FALSE)
lista_logicos

# Listas Compostas
lista_composta1 = list('A', 3, TRUE)
lista_composta1

# ' 1:10 ' vetor numérico | c('Zico'...) vetor de string
lista1 <- list(1:10, c('Zico', 'Ronaldo', 'Garrincha'), rnorm(10))
lista1

?rnorm # funcao pra chamar Distribuição Normal


# Slicing (fatiamento) da Lista

lista1[1] #  [1]  1  2  3  4  5  6  7  8  9 10

lista1[2] # [1] "Zico"      "Ronaldo"   "Garrincha"

lista1[[2]][1] # [1] "Zico"

lista1[[2]][2] # [1] "Ronaldo"

lista1[[2]][1] = 'Monica'

lista1


# Para nomear os elementos (Lista Nomeada)

# Forma 1
names(lista1) <- c('Inteiros', 'Caracteres', 'Numéricos')
lista1

# Forma 2
vec_numero <- 1:4
vec_caractere <- c('A', 'B', 'C', 'D')

lista2 <- list(Numeros = vec_numero, Letras = vec_caractere)
lista2

# Forma 3 (nomeando diretamente)
lista3 <- list(Elemento1 = 3:5, Elemento2 = c(7.2, 8.5))
lista3



# Trabalhando com elementos específicos da Lista
lista4 <- list(1:10, c('Iron Maiden', 'Guns N Roses', 'Nirvana'), rnorm(10))
lista4

names(lista4) <- c('Nº Inteiros', 'Bandas Caracters', 'Nº Numéricos')
lista4

lista4$`Bandas Caracters` # "Iron Maiden"  "Guns N Roses" "Nirvana"

length(lista4$`Nº Inteiros`)
lista4$`Nº Inteiros`


# Verificar o comprimento da lista
length(lista1)
length(lista4)


# Podemos extrair um elemento específico dentro de cada nível da lista
lista4$`Bandas Caracters`[2]


# Mode dos elementos
mode(lista4$`Nº Inteiros`)
mode(lista4$`Bandas Caracters`)
mode(lista4$`Nº Numéricos`)


# Combinando 2 listas
lista5 <- c(lista1, lista4)
lista5


# Transformando um vetor em lista
v = c(1:3)
v

l = as.list(v)
l
