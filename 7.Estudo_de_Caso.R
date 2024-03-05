####  Big Data Real-Time Analytics com Python e Spark  ####

# Configurando o diretório de trabalho
setwd("~/Desktop/DataScience/CienciaDeDados/2.Big-Data-Real-Time-Analytics-com-Python-e-Spark/3.Manipulacao_de_Dados_em_Python_com_Pandas")
getwd()



## Importando Pacotes
library(readxl)         # carregar arquivos
library(dplyr)          # manipula arquivos



#############################             Estudo de Caso             #############################


###  Analisando de Dados Escolares         


## Objetivo:

# - Neste Estudo de Caso o objetivo é realizar um detalhado processo de análise de dados escolares cruzando, comparando e resumindo, diferentes tipos de
#   informações.
# - No total serão respondidas perguntas de negócio que vão requerer analisar os dados por diferentes perspectivas.


## Perguntas:

#   1) Temos dados de quantas escolas?
#   2) Qual o total de registros de estudantes na base de dados?
#   3) Qual o orçamento total considerando todas as escolas?
#   4) Qual a média da nota dos alunos em Redação?
#   5) Qual a média da nota dos alunos em Matemática?
#   6) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Redação? (Entregue o resultado em valor absoluto e percentual)
#   7) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática? (Entregue o resultado em valor absoluto e percentual)
#   8) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática e Redação? (Entregue o resultado em valor absoluto e
#      percentual)
#   9) Crie um dataframe com os resultados das questões de 1 a 8 que você calculou acima. (Dica: crie um dicionário e depois converta em dataframe do
#      Pandas)
#   10) Formate as colunas "Total de Estudantes" e "Total Orçamento" ajustando as casas decimais.
#   11) Há diferença na performance escolar entre alunos de escolas públicas e particulares?
#   12) O que diferencia as escolas que formam alunos de alta performance?
#   13) Escolas (públicas ou particulares) com orçamentos mais altos tem alunos com melhores resultados nos testes de Matemática e Redação?
#   14) O tamanho da escola (pequeno, médio e grande porte) influencia na performance escolar do aluno?
#   15) Em qual tipo de escola (pública ou particular) há maior índice de aprovação?
#   
# - Vamos usar a Ciência de Dados para responder essas e outras perguntas e analisar dados escolares.



## Carregando Datasets
dados_escolas <- data.frame(read.csv2("datasets/dataset_escolas.csv", sep = ","))
dados_alunos <- data.frame(read.csv2("datasets/dataset_estudantes.csv", sep = ","))

head(dados_escolas)
head(dados_alunos)

# Unindo os Dataframes usando a coluna Nome_Escola
dados_full <- merge(dados_alunos, dados_escolas, by = "Nome_Escola")

# Re-ordenando
dados_full <- dados_full %>% 
  select(ID_Estudante, Nome_Estudante, Genero, Serie, Nota_Redacao, Nota_Matematica,
         ID_Escola, Nome_Escola, Tipo_Escola, Numero_Alunos, Orcamento_Anual)

head(dados_full)


## Verificando Dados Ausentes
colSums(is.na(dados_full))

## Tipo de Dados
str(dados_full)

## Convertendo dados

# Verificando valores únicos
unique(dados_full$Serie)
unique(dados_full$ID_Escola)
unique(dados_full$Nome_Escola)
unique(dados_full$Numero_Alunos)

# Convetendo para Factor
dados_full <- dados_full %>%
  mutate(across(c(Genero, Serie, ID_Escola, Nome_Escola, Tipo_Escola, Numero_Alunos), as.factor))


## Tipo de Dados
str(dados_full)
summary(dados_full)



## Respondendo as Perguntas:

# 1) Temos dados de quantas escolas?

str(dados_full$Nome_Escola)
summary(dados_full$Nome_Escola)
length(unique(dados_full$Nome_Escola))

# Resposta -> 15 escolas




# 2) Qual o total de registros de estudantes na base de dados?

length(unique(dados_full$ID_Estudante))

# Resposta -> 39160




# 3) Qual o orçamento total considerando todas as escolas?

# Usando dataset dados_escolas
sum(dados_escolas$Orcamento_Anual)

# Usando dataset dados_full
orcamento_total <- dados_full %>%
  distinct(ID_Escola, .keep_all = TRUE) %>%
  summarise(Soma_Orcamento_Anual = sum(Orcamento_Anual))
orcamento_total
rm(orcamento_total)

# Resposta -> 24649428




# 4) Qual a média da nota dos alunos em Redação?

mean(dados_full$Nota_Redacao)
summary(dados_full$Nota_Redacao)

# Resposta -> 81.88




# 5) Qual a média da nota dos alunos em Matemática?

mean(dados_full$Nota_Matematica)
summary(dados_full$Nota_Matematica)

# Resposta -> 79.00




# 6) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Redação? (Entregue o resultado em valor absoluto e percentual)




# 7) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática? (Entregue o resultado em valor absoluto e percentual)




# 8) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática e Redação? (Entregue o resultado em valor absoluto e
#    percentual)




# 9) Crie um dataframe com os resultados das questões de 1 a 8 que você calculou acima. (Dica: crie um dicionário e depois converta em dataframe do
#    Pandas)




# 10) Formate as colunas "Total de Estudantes" e "Total Orçamento" ajustando as casas decimais.




# 11) Há diferença na performance escolar entre alunos de escolas públicas e particulares?




# 12) O que diferencia as escolas que formam alunos de alta performance?




# 13) Escolas (públicas ou particulares) com orçamentos mais altos tem alunos com melhores resultados nos testes de Matemática e Redação?




# 14) O tamanho da escola (pequeno, médio e grande porte) influencia na performance escolar do aluno?




# 15) Em qual tipo de escola (pública ou particular) há maior índice de aprovação?



