# DataFrames e Operações com DataFrame

# Configurando DiretÃ³rio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# Criando um DataFrame vazio

df <- data.frame()

class(df)
df


# Criando vetores vazios e adicionando no dataframe vazio

nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()


df <- data.frame(c(nomes, idades, itens, codigos)) # passando um vetor de vetores / passando lista de vetores para o df
df


# Criando vetores

pais = c('Portugal', 'Inglaterra', 'Irlanda', 'Egito', 'Brasil')
nome = c('Bruno', 'Tiago', 'Amanda', 'Bianca', 'Marta')
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)


# Criando um DataFrame de diversos vetores

pesquisa = data.frame(pais, nome, altura, codigo)
pesquisa


# Adicionando um novo vetor a um DataFrame existente

olhos = c('verde', 'azul', 'azul', 'castanho', 'castanho')
pesq = cbind(pesquisa, olhos) # une dataframe pesquisa com olhos em pesq a nivel de coluna
pesq


# Informações sobre o DataFrame

str(pesq)
dim(pesq) # mostra numero de col x linhas
length(pesq)


# Obtendo um vetor de um dataframe

pesq$pais
pesq$nome
length(pesq$pais)


# Extraindo um único valor

pesq[1,1]
pesq[1,2]
pesq[1,3]
pesq[2,1]
pesq[2,2]
pesq[3,2]


# Número de Linhas e Colunas

nrow(pesq)
ncol(pesq)


# Primeiros elementos do dataframe (função head retorna as primeiras 5 linhas de um df)

head(pesq) 
head(mtcars)


# Últimos elementos do dataframe

tail(pesq) 
tail(mtcars)


# DataFrames built-in (que vem junto) do R

?mtcars
mtcars
View(mtcars)


# Filtro para um subset de dados que atendem a um critério

pesq
pesq[altura < 1.60,] # filtra com altura menor que 1.60
pesq[altura > 1.60,] # filtra com altura maior que 1.60

pesq[altura > 1.60, c("codigo", "olhos")] # filtra com altura maior que 1.60 e exibindo apenas colunas codigo e olhos
pesq


# DataFrames nomeados (nomeando DataFrames)

names(pesq) <- c('Pais', 'Nome', 'Altura', 'Código', 'Olhos')
pesq

# renomeando nome das colunas e linhas

colnames(pesq) <- c('País', 'Col 2', 'Col 3', 'Col 4', 'Col 5')
rownames(pesq) <- c('Lin 1', 'Lin 2', 'Lin 3', 'Lin 4', 'Lin 5')
pesq



# Carregando um arquivo CSV 
# Iremos criar o arquivo aqui mesmo no RSTudio (ir em File, New File, Text File)

?read.csv

pacientes <- data.frame(read.csv(file = 'pacientes.csv', header = TRUE, sep = ",")) # header = cabeçalho | sep = separador
pacientes

# Visualizando o dataset

View(pacientes)
head(pacientes)
tail(pacientes)
summary(pacientes)

# Visualizando as variáveis

pacientes$Nome
pacientes$Idade
pacientes$Diabete
pacientes$status
pacientes$Status


# Histograma
hist(pacientes$Idade)


# Combinando dataframes

dataset_final <- merge(pesq, pacientes)
dataset_final
View(dataset_final)






