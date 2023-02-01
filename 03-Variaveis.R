# criando variáveis
var1 = 100
var1

mode(var1)
help("mode")
help("sqrt")
sqrt(var1) # raiz quadrada

# podemos atribuir valor de uma variável a outra variável
var2 = var1
var2

mode(var2)
typeof(var2)
help("typeof")

# uma variável pode ser uma lista de elementos
var3 = c("primeiro", "segundo", "terceiro")
var3

mode(var3)

# uma variável pode ser uma função
var4 = function(x) {x+3}
var4

mode(var4)

# podemos também mudar o modo do dado
var5 = as.character(var1) # transforma valor para caractere
var5
mode(var5)

# atribuindo valores a objetos
x <- c(1,2,3)
x
x1 = c(1,2,3)
x1

c(1,2,3) -> y
y

assign("z", c(6.3,4,-2)) # função para atribuir, atribuimos o veotr para "z"
z

# verificando o valor em uma posição específica
z[1]

# verificar objetos (variaveis)
ls()
objects()

# remover objetos (variaveis)
rm(x)
x
