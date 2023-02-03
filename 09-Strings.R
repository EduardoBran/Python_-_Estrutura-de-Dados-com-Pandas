# Operações com Strings

# Configurando DiretÃ³rio de Trabalho
setwd("C:/Users/Julia/Desktop/CienciaDeDados/1.Big-Data-Analytics-com-R-e-Microsoft-Azure-Machine-Learning/2.Fundamentos-da-Linguagem-R")
getwd()


# String

texto <- "Isso é uma string!"
texto

# Convertendo nº em texto

x = as.character(3.14)
x
class(x)


# Concatenando strings

nome = 'Lionel'; sobrenome = 'Messi'

paste(nome, sobrenome)
cat(nome, sobrenome)


# Formatando a saída de uma String

texto <- "Isso é uma string!"
substr(texto, start = 12, stop = 17)

?substr


# Contando nº de caracteres

nchar(texto)


# Alterando a capitalzação (maiúscula e minuscula)

tolower('Histograma e Elementos de Dados')
toupper('Histograma e Elementos de Dados')



# Usando o pacote stringr

library(stringr)

# Dividindo uma string em caracteres

strsplit('Histogramas e Elementos de Dados', NULL) # transforma em lista de caracteres
?strsplit

# Dividindo uma string em caracteres após o caracter espaço

strsplit("Histogramas e Elementos de Dados", " ")


# Trabalhando com strings

string1 = c('Esta é a primeira parte da minha string e será a primeira parte do meu vetor',
            'Aqui a minha string continua, mas será transformada no segundo vetor')

string1

string2 = c('Precisamos testar outras strings - @???!$&ñ',
            'Análise de Dados em R')
string2

# Adicionando (concatenando) 2 strings

str_c(c(string1, string2), sep = "")

# Podemos contar quantas vezes um caracter aparece no texto

str_count(string2, 's') # string2 é um vetor com 2 strings. Foi contando qts vezes aparece 's' no 1º e depois no 2º

# Localiza a primeira e a última posição em que o caracter aparece na string

str_locate_all(string2, 's')
str_locate(string2, 's')

# Substitui a primeira ocorrência de um caracter ('\\s' = caracter espaço)

str_replace(string2, 'testar', 'XXX')

# Substitui toda ocorrência de um caracter

str_replace_all(string2, '\\s', '')



# Detectando padrões nas strings

string3 <- "17 jan 2001"
string4 <- "1 jan 2001"
padrao <- 'jan 20'

grepl(pattern = padrao, x = string3) # pattern é o padrão

padrao2 <- 'jan20'

grepl(pattern = padrao2, x = string3)

























