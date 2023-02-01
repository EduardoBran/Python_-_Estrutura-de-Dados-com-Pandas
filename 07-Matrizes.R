# Matrizes, Operações com Matrizes e Matrizes Nomeados

# Configurando Diretório de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# Criando matrizes


# Número de linhas

matrix (c(1,2,3,4,5,6), nr = 2)
matrix (c(1,2,3,4,5,6), nr = 3)
matrix (c(1,2,3,4,5,6), nr = 6)

# Número de colunas

matrix (c(1,2,3,4,5,6), nc = 2)


# Help
?matrix


# Matrizes precisam ter um nº de elementos que seja múltiplo do nº de linhas
matrix (c(1,2,3,4,5), nr = 2)


# Criando matrizes a partir de vetores e preenchendo a partir das linhas

meus_dados = c(1:10)

matrix(data = meus_dados, nrow = 5, ncol = 2, byrow = T) # byrow - preenchimento por linha
matrix(data = meus_dados, nrow = 5, ncol = 2)



# Fatiando a matriz

mat <- matrix(c(2,3,4,5), nr = 2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]


# Criando uma matriz diagonal (onde todos os elementos são 0 exceto na diagonal)

matriz_diagonal = 1:3
diag(matriz_diagonal)


# Extraindo vetor de uma matriz diagonal

vetor = diag(matriz_diagonal)
diag(vetor)


# Transposta da matriz (conceito de matriz transposta é transformar linhas em colunas)

W <- matrix(c(2, 4, 8, 12), nr = 2, nc = 2)
W
t(W) # função t cria a matriz transposta

U <- t(W)
U


# Obtendo uma matriz inversa
solve(W)


# Multiplicação de matrizes

mat1 <- matrix(c(2,3,4,5), nr = 2)
mat1
mat2 <- matrix(c(6,7,8,9), nr = 2)
mat2

mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2


# Multiplicando Matriz com Vetor
x = c(1:4)
x
y <- matrix(c(2,3,4,5), nr = 2)
x * y


# Nomeando a Matriz

mat3 = matrix(c("Terra", "Marte", "Saturno", "Netuno"), nr = 2)
mat3
dimnames(mat3) = list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2"))
mat3


# Identificando linhas e colunas no nomento da criação da Matriz
mesma_linha = matrix(c(1,2,3,4), nr = 2, nc = 2, dimnames = list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2") ))
mesma_linha

# Combinando Matrizes

mat4 <- matrix(c(2,3,4,5), nr = 2)
mat4
mat5 <- matrix(c(6,7,8,9), nr = 2)
mat5

cbind(mat4, mat5) # cbind = combinar por coluna
rbind(mat4, mat5) # rbind = combinar por linha


# Desconstruindo a Matriz (pega o que estava com 2 dimensões e coloca em 1)
c(mat4)
