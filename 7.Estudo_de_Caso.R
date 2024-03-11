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


### Perguntas - Parte 1:

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



### Respondendo as Perguntas - Parte 1:

## 1) Temos dados de quantas escolas?

str(dados_full$Nome_Escola)
summary(dados_full$Nome_Escola)
length(unique(dados_full$Nome_Escola))

# Resposta -> 15 escolas




## 2) Qual o total de registros de estudantes na base de dados?

length(unique(dados_full$ID_Estudante))

# Resposta -> 39160




## 3) Qual o orçamento total considerando todas as escolas?

# Usando dataset dados_escolas
sum(dados_escolas$Orcamento_Anual)

# Usando dataset dados_full
orcamento_total <- dados_full %>%
  distinct(ID_Escola, .keep_all = TRUE) %>%
  summarise(Soma_Orcamento_Anual = sum(Orcamento_Anual))
orcamento_total
rm(orcamento_total)

# Resposta -> 24649428




## 4) Qual a média da nota dos alunos em Redação?

mean(dados_full$Nota_Redacao)
summary(dados_full$Nota_Redacao)

# Resposta -> 81.88




## 5) Qual a média da nota dos alunos em Matemática?

mean(dados_full$Nota_Matematica)
summary(dados_full$Nota_Matematica)

# Resposta -> 79.00




## 6) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Redação? (Entregue o resultado em valor absoluto e percentual)

# quantidade
aprovados_redacao <- dados_full %>% 
  filter(Nota_Redacao >= 70) %>%
  count()
aprovados_redacao                                                   # 33.600

# percentual
percentual_redacao <- aprovados_redacao / count(dados_full) * 100
percentual_redacao                                                  # 85.80%


# Resposta -> 33.600 aprovados, o que representa cerca de 85.80% do total dos alunos.




## 7) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática? (Entregue o resultado em valor absoluto e percentual)

# quantidade
aprovados_mat <- dados_full %>% 
  filter(Nota_Matematica >= 70) %>%
  count()
aprovados_mat                                              # 29.360

# percentual
percentual_mat <- aprovados_mat / count(dados_full) * 100
percentual_mat                                             # 74.98%

rm(aprovados, percentual)

# Resposta -> 29.360 aprovados, o que representa cerca de 74.98% do total dos alunos.




## 8) Considerando que a nota de aprovação é 70, quantos alunos foram aprovados em Matemática e Redação? (Entregue o resultado em valor absoluto e
##    percentual)

# quantidade
aprovados <- dados_full %>% 
  filter(Nota_Redacao >= 70, 
         Nota_Matematica >= 70) %>%
  count()
aprovados                                           # 25.518

# percentual
percentual <- aprovados / count(dados_full) * 100
percentual                                          # 65.16%

# Resposta -> 25.518 aprovados, o que representa cerca de 65.16% do total dos alunos.




## 9) Crie um dataframe com os resultados das questões de 1 a 8 que você calculou acima.

r1 = length(unique(dados_full$Nome_Escola))
r2 = length(unique(dados_full$ID_Estudante))
r3 = sum(dados_escolas$Orcamento_Anual)
r4 = mean(dados_full$Nota_Redacao)
r5 = mean(dados_full$Nota_Matematica)
r6_1 = aprovados_redacao$n
r6_2 = percentual_redacao$n
r7_1 = aprovados_mat$n
r7_2 = percentual_mat$n
r8_1 = aprovados$n
r8_2 = percentual$n

df <- data.frame(
  Total_Escolas = r1,
  Total_Estudantes = r2,
  Orcamento_Total_Escolas = r3,
  Media_Notas_Redacao = r4,
  Media_Notas_Matematica = r5,
  Aprovados_Redacao_Total = r6_1,
  Aprovados_Redacao_Per = r6_2,
  Aprovados_Matematica_Total = r7_1,
  Aprovados_Matematica_Per = r7_2,
  Aprovados_Redacao_e_Mat_Total = r8_1,
  Aprovados_Redacao_e_Mat_Per = r8_2
)

rm(aprovados_redacao, percentual_redacao, aprovados_mat, percentual_mat, aprovados, percentual,
   r1, r2, r3, r4, r5, r6_1, r6_2, r7_1, r7_2, r8_1, r8_2)

df

## 10) Formate as colunas "Total de Estudantes" e "Total Orçamento" ajustando as casas decimais.

df$Total_Estudantes <- formatC(df$Total_Estudantes, format = "d", big.mark = ",")
df$Orcamento_Total_Escolas <- formatC(df$Orcamento_Total_Escolas, format = "f", big.mark = ",", digits = 2)

df




### Criando e Visualizando Um Novo Dataset com dados estatísticos

# Visualizando os Dados
View(dados_full)
head(dados_full)
summary(dados_full)
str(dados_full$Tipo_Escola)
summary(dados_full$Tipo_Escola)


# Dividindo o dataframe
escolas_pub <- dados_full %>% 
  filter(Tipo_Escola == 'Publica') %>%
  select(ID_Estudante, Nota_Redacao, Nota_Matematica, Nome_Escola, Numero_Alunos, Orcamento_Anual)

escolas_par <- dados_full %>% 
  filter(Tipo_Escola == 'Particular') %>%
  select(ID_Estudante, Nota_Redacao, Nota_Matematica, Nome_Escola, Numero_Alunos, Orcamento_Anual)


# Dados de Escolas Públicas
media_escolas_pub_nota_redacao <- escolas_pub %>% 
  summarise(media_escolas_pub_nota_redacao = mean(Nota_Redacao))
media_escolas_pub_nota_redacao

aprovados_escolas_pub_redacao <- escolas_pub %>% 
  filter(Nota_Redacao >= 70) %>%
  count()
aprovados_escolas_pub_redacao

percentual_aprovados_escolas_pub_redacao <- aprovados_escolas_pub_redacao / count(escolas_pub) * 100
percentual_aprovados_escolas_pub_redacao <- round(percentual_aprovados_escolas_pub_redacao, 2)
percentual_aprovados_escolas_pub_redacao

media_escolas_pub_nota_mat <- escolas_pub %>% 
  summarise(media_escolas_pub_nota_mat = mean(Nota_Matematica))
media_escolas_pub_nota_mat

aprovados_escolas_pub_mat <- escolas_pub %>% 
  filter(Nota_Matematica >= 70) %>%
  count()
aprovados_escolas_pub_mat

percentual_aprovados_escolas_pub_mat <- aprovados_escolas_pub_mat / count(escolas_pub) * 100
percentual_aprovados_escolas_pub_mat <- round(percentual_aprovados_escolas_pub_mat, 2)
percentual_aprovados_escolas_pub_mat

aprovados_redacao_e_mat_escola_pub <- escolas_pub %>% 
  filter(Nota_Redacao >= 70, 
         Nota_Matematica >= 70) %>%
  count()
aprovados_redacao_e_mat_escola_pub    

percentual_aprovados_redacao_e_mat_escola_pub <- aprovados_redacao_e_mat_escola_pub / count(escolas_pub) * 100
percentual_aprovados_redacao_e_mat_escola_pub <- round(percentual_aprovados_redacao_e_mat_escola_pub, 2)
percentual_aprovados_redacao_e_mat_escola_pub

orcamento_total_escolas_pub <- dados_escolas %>% 
  filter(Tipo_Escola == 'Publica') %>% 
  summarise(Orcamento_Total = sum(Orcamento_Anual))
orcamento_total_escolas_pub

gasto_medio_pub <- orcamento_total_escolas_pub$Orcamento_Total / sum(unique(as.numeric(as.character(escolas_pub$Numero_Alunos))))
gasto_medio_pub

total_alunos_pub <- sum(dados_escolas$Numero_Alunos[dados_escolas$Tipo_Escola == 'Publica'])
gasto_medio_aluno_pub <- round(orcamento_total_escolas_pub$Orcamento_Total / total_alunos_pub, 0)
gasto_medio_aluno_pub


# Dados de Escolas Particular
media_escolas_par_nota_redacao <- escolas_par %>% 
  summarise(media_escolas_par_nota_redacao = mean(Nota_Redacao))
media_escolas_par_nota_redacao

aprovados_escolas_par_redacao <- escolas_par %>% 
  filter(Nota_Redacao >= 70) %>%
  count()
aprovados_escolas_par_redacao

percentual_aprovados_escolas_par_redacao <- aprovados_escolas_par_redacao / count(escolas_par) * 100
percentual_aprovados_escolas_par_redacao <-  round(percentual_aprovados_escolas_par_redacao, 2)
percentual_aprovados_escolas_par_redacao

media_escolas_par_nota_mat <- escolas_par %>% 
  summarise(media_escolas_par_nota_mat = mean(Nota_Matematica))
media_escolas_par_nota_mat

aprovados_escolas_par_mat <- escolas_par %>% 
  filter(Nota_Matematica >= 70) %>%
  count()
aprovados_escolas_par_mat

percentual_aprovados_escolas_par_mat <- aprovados_escolas_par_mat / count(escolas_par) * 100
percentual_aprovados_escolas_par_mat <- round(percentual_aprovados_escolas_par_mat, 2)
percentual_aprovados_escolas_par_mat

aprovados_redacao_e_mat_escola_par <- escolas_par %>% 
  filter(Nota_Redacao >= 70, 
         Nota_Matematica >= 70) %>%
  count()
aprovados_redacao_e_mat_escola_par    

percentual_aprovados_redacao_e_mat_escola_par <- aprovados_redacao_e_mat_escola_par / count(escolas_par) * 100
percentual_aprovados_redacao_e_mat_escola_par <- round(percentual_aprovados_redacao_e_mat_escola_par, 2)
percentual_aprovados_redacao_e_mat_escola_par

orcamento_total_escolas_par <- dados_escolas %>% 
  filter(Tipo_Escola == 'Particular') %>% 
  summarise(Orcamento_Total = sum(Orcamento_Anual))
orcamento_total_escolas_par

total_alunos_par <- sum(dados_escolas$Numero_Alunos[dados_escolas$Tipo_Escola == 'Particular'])
gasto_medio_aluno_par <- round(orcamento_total_escolas_par$Orcamento_Total / total_alunos_par, 0)
gasto_medio_aluno_par



# Criando dataframe com todos os dados
dados_escolares <- data.frame(
  Tipo_Escola = c('Pública',
                  'Particular'),
  Qtd_Registros = c(nrow(escolas_pub),
                    nrow(escolas_par)),
  Media_Nota_Redacao = c(media_escolas_pub_nota_redacao$media_escolas_pub_nota_redacao,
                         media_escolas_par_nota_redacao$media_escolas_par_nota_redacao),
  Total_Apr_Redacao = c(aprovados_escolas_pub_redacao$n,
                        aprovados_escolas_par_redacao$n),
  Per_Apr_Redacao = c(percentual_aprovados_escolas_pub_redacao$n,
                      percentual_aprovados_escolas_par_redacao$n),
  Media_Nota_Matematica = c(media_escolas_pub_nota_mat$media_escolas_pub_nota_mat,
                            media_escolas_par_nota_mat$media_escolas_par_nota_mat),
  Total_Apr_Matematica = c(aprovados_escolas_pub_mat$n,
                           aprovados_escolas_par_mat$n),
  Per_Apr_Matematica = c(percentual_aprovados_escolas_pub_mat$n,
                         percentual_aprovados_escolas_par_mat$n),
  Total_Apr_Red_e_Mat = c(aprovados_redacao_e_mat_escola_pub$n,
                          aprovados_redacao_e_mat_escola_par$n),
  Per_Apr_Red_e_Mat = c(percentual_aprovados_redacao_e_mat_escola_pub$n,
                        percentual_aprovados_redacao_e_mat_escola_par$n),
  Orcamento_Total = c(orcamento_total_escolas_pub$Orcamento_Total,
                      orcamento_total_escolas_par$Orcamento_Total),
  Gasto_Medio_Por_Aluno = c(gasto_medio_aluno_pub,
                            gasto_medio_aluno_par))

View(dados_escolares)




### Perguntas - Parte 2:


## 11) Entre os alunos aprovados em Redação, qual gênero obteve maior número de aprovações?

aprovados_genero_red <- dados_full %>% 
  filter(Nota_Redacao >= 70)

table(aprovados_genero_red$Genero)
rm(aprovados_genero_red)

# Resposta -> Feminino: 17027 e Masculino: 16573. O gênero feminino obteve o maior número de aprovações.




## 12) Entre os alunos aprovados em Matemática, qual gênero obteve maior número de aprovações?

aprovados_genero_mat <- dados_full %>% 
  filter(Nota_Matematica >= 70)

table(aprovados_genero_mat$Genero)
rm(aprovados_genero_mat)

# Resposta -> Feminino: 14835 e Masculino: 14525 O gênero feminino obteve o maior número de aprovações.





## 13) Quais os tipos de todas as escolas em nossa base de dados?

str(dados_full$Tipo_Escola)

# Resposta -> Pública e Particular.





## 14) Qual o total de estudantes por escola?

table(dados_full$Nome_Escola)

# Resposta -> Está no terminal.





## 15) Qual o total de orçamento de cada escola per capita (por estudante)?

# orcamento_per_capita_escola_A = dados_escolas[[5]][1] / dados_escolas[[4]][1]
# print(paste('Orçamento Per Capita Escola A: ', orcamento_per_capita_escola_A))
# orcamento_per_capita_escola_B = dados_escolas[[5]][2] / dados_escolas[[4]][2]
# print(paste('Orçamento Per Capita Escola B: ', orcamento_per_capita_escola_B))
# orcamento_per_capita_escola_C = dados_escolas[[5]][3] / dados_escolas[[4]][3]
# print(paste('Orçamento Per Capita Escola C: ', orcamento_per_capita_escola_C))
# orcamento_per_capita_escola_D = dados_escolas[[5]][4] / dados_escolas[[4]][4]
# print(paste('Orçamento Per Capita Escola D: ', orcamento_per_capita_escola_D))
# orcamento_per_capita_escola_E = dados_escolas[[5]][5] / dados_escolas[[4]][5]
# print(paste('Orçamento Per Capita Escola E: ', orcamento_per_capita_escola_E))
# orcamento_per_capita_escola_F = dados_escolas[[5]][6] / dados_escolas[[4]][6]
# print(paste('Orçamento Per Capita Escola F: ', orcamento_per_capita_escola_F))
# orcamento_per_capita_escola_G = dados_escolas[[5]][7] / dados_escolas[[4]][7]
# print(paste('Orçamento Per Capita Escola G: ', orcamento_per_capita_escola_G))
# orcamento_per_capita_escola_H = dados_escolas[[5]][8] / dados_escolas[[4]][8]
# print(paste('Orçamento Per Capita Escola H: ', orcamento_per_capita_escola_H))
# orcamento_per_capita_escola_I = dados_escolas[[5]][9] / dados_escolas[[4]][9]
# print(paste('Orçamento Per Capita Escola I: ', orcamento_per_capita_escola_I))
# orcamento_per_capita_escola_J = dados_escolas[[5]][10] / dados_escolas[[4]][10]
# print(paste('Orçamento Per Capita Escola J: ', orcamento_per_capita_escola_J))
# orcamento_per_capita_escola_K = dados_escolas[[5]][11] / dados_escolas[[4]][11]
# print(paste('Orçamento Per Capita Escola K: ', orcamento_per_capita_escola_K))
# orcamento_per_capita_escola_L = dados_escolas[[5]][12] / dados_escolas[[4]][12]
# print(paste('Orçamento Per Capita Escola L: ', orcamento_per_capita_escola_L))
# orcamento_per_capita_escola_M = dados_escolas[[5]][13] / dados_escolas[[4]][13]
# print(paste('Orçamento Per Capita Escola M: ', orcamento_per_capita_escola_M))
# orcamento_per_capita_escola_N = dados_escolas[[5]][14] / dados_escolas[[4]][14]
# print(paste('Orçamento Per Capita Escola N: ', orcamento_per_capita_escola_N))
# orcamento_per_capita_escola_O = dados_escolas[[5]][15] / dados_escolas[[4]][15]
# print(paste('Orçamento Per Capita Escola O: ', orcamento_per_capita_escola_O))


# Otimizando código acima
for (i in 1:nrow(dados_escolas)) {
  orcamento_per_capita <- dados_escolas$Orcamento_Anual[i] / dados_escolas$Numero_Alunos[i]
  cat("Orçamento Per Capita", dados_escolas$Nome_Escola[i], ": ", round(orcamento_per_capita, 2), "\n")
}
rm(i)

# Resposta -> Está no terminal.




## Adicionando Coluna Orcamento_Por_Estudante ao dataframe dados_escolas
dados_escolas$Orcamento_Por_Estudante <- dados_escolas$Orcamento_Anual / dados_escolas$Numero_Alunos
dados_escolas





## 16) Em qual tipo de escola (pública ou particular) há maior índice de aprovação?

# Verificando quantidade de alunos em Escolas Pública e Particular
escola_pub_total <- dados_full %>% 
  filter(Tipo_Escola == 'Publica') %>% 
  count()
escola_par_total <- dados_full %>% 
  filter(Tipo_Escola == 'Particular') %>% 
  count()

# Verificando a quantidade total de aprovados por tipo de escola (levando em consideração que aprovados = notas de ambas as matérias acima de 70)
aprovados_pub <- dados_full %>% 
  filter(Tipo_Escola == 'Publica',
         Nota_Redacao >= 70,
         Nota_Matematica >= 70) %>% 
  count()
aprovados_par <- dados_full %>% 
  filter(Tipo_Escola == 'Particular',
         Nota_Redacao >= 70,
         Nota_Matematica >= 70) %>% 
  count()

# Verificando índice de aprovação
indice_aprovacao_pub <- (aprovados_pub / escola_pub_total) * 100   
indice_aprovacao_par <- (aprovados_par / escola_par_total) * 100
indice_aprovacao_pub    # 53.69
indice_aprovacao_par    # 90.55

rm(escola_pub_total, escola_par_total, aprovados_pub, aprovados_par, indice_aprovacao_pub, indice_aprovacao_par)

# Resposta -> O índice de aprovação da escola pública é cerca de 53.70% de aprovação, enquanto o índice da escola particular é cerca de 90.55%.
#             Portanto o maior índice de aprovação ocorre nas escolas do tipo particular.





## 17) Qual a nota média dos alunos em Redação para cada escola?

media_redacao_por_escola <- dados_full %>% 
  group_by(Nome_Escola) %>% 
  summarise(media_nota_redacao = mean(Nota_Redacao))
media_redacao_por_escola
rm(media_redacao_por_escola)

# Resposta -> Está no terminal.





## 18) Qual a nota média dos alunos em Matemática para cada escola?

media_matematica_por_escola <- dados_full %>% 
  group_by(Nome_Escola) %>% 
  summarise(media_nota_matematica = mean(Nota_Matematica))
media_matematica_por_escola
rm(media_matematica_por_escola)

# Resposta -> Está no terminal.





## 19) Considerando somente os alunos aprovados em Redação, qual a média de alunos aprovados por escola?

media_aprovados_red_por_escola <- dados_full %>%
  filter(Nota_Redacao >= 70) %>% 
  group_by(Nome_Escola) %>% 
  summarise(media_nota_redacao = mean(Nota_Redacao))
media_aprovados_red_por_escola
rm(media_aprovados_red_por_escola)

# Resposta -> Está no terminal.




## 20) Considerando somente os alunos aprovados em Matemática, qual a média de alunos aprovados por escola?

media_aprovados_mat_por_escola <- dados_full %>%
  filter(Nota_Matematica >= 70) %>% 
  group_by(Nome_Escola) %>% 
  summarise(media_nota_matematica = mean(Nota_Matematica))
media_aprovados_mat_por_escola
rm(media_aprovados_mat_por_escola)

# Resposta -> Está no terminal.





# 21) Considerando alunos aprovados em Matemática e Redação, qual foi a média de alunos aprovados por escola?
media_aprovados_por_escola <- dados_full %>%
  filter(Nota_Matematica >= 70,
         Nota_Redacao >= 70) %>% 
  group_by(Nome_Escola) %>% 
  summarise(media_notas_aprovados = mean(Nota_Matematica + Nota_Redacao) / 2)
media_aprovados_por_escola
rm(media_aprovados_mat_por_escola)

# Resposta -> Está no terminal.





# 22) Considerando a taxa geral de aprovados, quais as 5 escolas com melhor performance?
total_aprovados_por_escola <- dados_full %>%
  filter(Nota_Matematica >= 70,
         Nota_Redacao >= 70) %>% 
  group_by(Nome_Escola) %>% 
  count() %>% 
  arrange(desc(n))
total_aprovados_por_escola
rm(total_aprovados_por_escola)

# Resposta -> Escola H, M, D, L e F





# 23) Em cada série, qual escola teve os alunos com melhor performance em Matemática?

performance_por_serie_mat <- dados_full %>% 
  filter(Nota_Matematica >= 70,
         Nota_Redacao >= 70) %>% 
  group_by(Serie, Nome_Escola) %>% 
  summarise(media_nota_matematica = mean(Nota_Matematica), .groups = "drop")
performance_por_serie_mat

melhor_performance_por_serie_mat <- performance_por_serie_mat %>% 
  group_by(Serie) %>% 
  slice_max(media_nota_matematica, n = 1)

melhor_performance_por_serie_mat

rm(performance_por_serie_mat, melhor_performance_por_serie_mat)

# Resposta -> Serie 6 - Escola I. Serie 7 - Escola E. Serie 8 - Escola I. Serie 9 - Escola J





# 24) Considerando as faixas de gastos por estudante como sendo: [0, 585, 630, 645, 680], qual faixa resulta em estudantes com melhor performance?





# 25) Considerando as faixas de tamanho (número de alunos) das escolas como sendo: [0, 1000, 2000, 5000], qual faixa resulta em estudantes com melhor 
#     performance?




# 26) Qual o impacto do tipo de escola na performance dos alunos?




