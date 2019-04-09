#### TRABALHO 1 - CALCULADORA COM AS OPÇÕES ####
# Soma de 2 números (2 parâmetros)
# Subtração de 2 números (2 parâmetros)
# Multiplicação de 2 números, limitados a 16 bits cada um (2 parâmetros)
# Divisão de 2 números, , limitados a 16 bits cada um (2 parâmetros)
# Potência (2 parâmetros)
# Raiz quadrada (1 parâmetro)
# Tabuada de 1 número fornecido (1 parâmetro)
# Cálculo do IMC (Índice de Massa Corporal) (2 parâmetros)
# Fatorial de 1 número fornecido (1 parâmetro)
# Cálculo da sequência de Fibonacci dado um intervalo (a,b) definido pelo usuário (2 parâmetros)
# Encerrar o programa

		.data
		.align 0
	
menu:		.asciiz "Digite a operacao desejada.\n"
somar:		.asciiz "Digite 0 para somar dois numeros.\n"
subtrair: 	.asciiz "Digite 1 para subtrair dois numeros.\n"
multiplicar: 	.asciiz "Digite 2 para multiplicar 2 numeros.\n"
dividir:	.asciiz "Digite 3 para dividir dois numeros.\n"
potenciacao:	.asciiz "Digite 4 para elevar um numero a uma potencia.\n"
tirarraiz:	.asciiz "Digite 5 para calcular a raiz quadrada de um numero.\n"
tabuadar:	.asciiz "Digite 6 para mostrar a tabuada de um numero.\n"
calcularIMC:	.asciiz "Digite 7 para calcular o IMC (Índice de Massa Corporal) de uma pessoa.\n"
fatoriar:	.asciiz "Digite 8 para calcular o fatorial de um numero.\n"
fibonaccizar	.asciiz "Digite 9 para calcular a sequencia de Fibonacci de um intervalo de dois numeros.\n"

num_a:		.asciiz "Digite o primeiro numero.\n"
num_b:		.asciiz "Digite o segundo numero.\n"

result:		.asciiz "O resultado da operacao eh:"







# Soma de 2 números (2 parâmetros)
