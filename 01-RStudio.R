# Nome dos Contributors
contributors()

# Licença de Uso
licence()

# Informações sobre a sessão
sessionInfo()

# Imprimir na tela
print('Estou iniciando minha caminhada na carreira Cientista de Dados')

# Criar gráficos
plot(1:25)

# Instalar pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('devtools')

# Carregar o pacote
library(ggplot2)

# Descarregar o pacote
detach(package:ggplot2)

# Sabendo o nome da função, vamos descobrir o que faz a função mean
# mean é uma função para calcular a média aritmética
help(mean)

?mean # mesma coisa acima


# pacote sos auxilia para buscar mais info sobre funções
install.packages('sos')

library(sos)

# dentro do pacte sos temos a função findFn
findFn('fread')

# se não souber o nome da função
help.search('randomForest')
help.search('matplot')
??matplot

RSiteSearch('matplot')

example('matplot')

# sair
q()
