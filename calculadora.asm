#### TRABALHO 1 - CALCULADORA COM AS OP��ES ####
# Soma de 2 n�meros (2 par�metros)
# Subtra��o de 2 n�meros (2 par�metros)
# Multiplica��o de 2 n�meros, limitados a 16 bits cada um (2 par�metros)
# Divis�o de 2 n�meros, , limitados a 16 bits cada um (2 par�metros)
# Pot�ncia (2 par�metros)
# Raiz quadrada (1 par�metro)
# Tabuada de 1 n�mero fornecido (1 par�metro)
# C�lculo do IMC (�ndice de Massa Corporal) (2 par�metros)
# Fatorial de 1 n�mero fornecido (1 par�metro)
# C�lculo da sequ�ncia de Fibonacci dado um intervalo (a,b) definido pelo usu�rio (2 par�metros)
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
calcularIMC:	.asciiz "Digite 7 para calcular o IMC (�ndice de Massa Corporal) de uma pessoa.\n"
fatoriar:	.asciiz "Digite 8 para calcular o fatorial de um numero.\n"
fibonaccizar	.asciiz "Digite 9 para calcular a sequencia de Fibonacci de um intervalo de dois numeros.\n"

num_a:		.asciiz "Digite o primeiro numero.\n"
num_b:		.asciiz "Digite o segundo numero.\n"

result:		.asciiz "O resultado da operacao eh:"







# Soma de 2 n�meros (2 par�metros)
