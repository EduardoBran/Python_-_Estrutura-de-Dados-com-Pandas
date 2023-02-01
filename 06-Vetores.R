# Vetores, Operações com Vetores e Vetores Nomeados

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# Vetor de strings

vetor_caracter = c("Data", "Science", "Academy")
vetor_caracter


# Vetor de floats

vetor_numerico = c(1.90, 45.3, 300.5)
vetor_numerico


# Vetor de valores complexos

vetor_complexo = c(5.2+3i, 3.8+4i)
vetor_complexo


# Vetor de valores lógicos

vetor_logico = c(TRUE, FALSE, TRUE, FALSE, FALSE)
vetor_logico


# Vetor de números inteiros

vetor_integer = c(2, 4, 6)
vetor_integer



# Criando um vetor com a funcao seq()

vetor_seq = seq(1:10)
vetor_seq

is.vector(vetor_seq) # verificando se é vetor



# Criando um vetor com a funcao rep()

vetor_rep = rep(1:5)
vetor_rep

is.vector(vetor_rep) # verificando se é vetor



# Indexação de vetores

a <- c(1,2,3,4,5)
a
a[1]
a[6]

b <- c("Data", "Science", "Academy")
b
b[1]
b[2]
b[3]
b[4]


# Combinando Vetores

v1 = c(2, 3, 5)
v2 = c("aa", "bb", "cc", "dd", "ee")
v1_e_v2 = c(v1, v2)
v1_e_v2



# Operações com vetores

x = c(1, 3, 5, 7)
y = c(2, 4, 6, 8)

x * 5
x + y
x * y
x / y


# Somando vetores com números diferentes de elementos

alfa = c(10, 20, 30)
beta = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
total_alfa_beta = alfa + beta
total_alfa_beta

# Padrão -> 10 + 1 | 20 + 2 | 30 + 3 | 10 + 4 | 20 + 5 | 30 + 6 ...


# Vetor nomeado (dando nome aos elementos do vetor)

v = c("Adrian", "Smith")
v

names(v) = c("Nome", "Sobrenome") # função names dar nomes
v
v["Nome"]
