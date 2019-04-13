# Universidade de S�o Paulo - ICMC abril/2019
# @author Michelle Wingter da Silva, 10783243


#### TRABALHO 1 - CALCULADORA COM AS OP��ES #########
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
#################################################

.data
.align 0
	
menu_title:	.asciiz "\nDigite a operacao desejada: "
menu_soma:	.asciiz "\n0 - Somar dois numeros.\n"
menu_subtrai:	.asciiz "1 - Subtrair dois numeros.\n"
menu_multiplica:.asciiz "2 - Multiplicar dois numeros.\n"
menu_divide:	.asciiz "3 - Dividir dois numeros.\n"
menu_potencia:	.asciiz "4 - Elevar um numero a uma potencia.\n"
menu_raiz:	.asciiz "5 - Calcular a raiz quadrada de um numero.\n"
menu_tabuada:	.asciiz "6 - Mostrar a tabuada de um numero.\n"
menu_IMC:	.asciiz "7 - Calcular o IMC (�ndice de Massa Corporal) de uma pessoa.\n"
menu_fatorial:	.asciiz "8 - Calcular o fatorial de um numero.\n"
menu_fibonacci:	.asciiz "9 - Calcular a sequencia de Fibonacci de um intervalo de dois numeros.\n"
menu_sair:	.asciiz "10 - Sair.\n"

num_a:		.asciiz "\nDigite o primeiro numero: "
num_b:		.asciiz "Digite o segundo numero: "
num_unico:	.asciiz "\nDigite um numero: "

str_peso: 	.asciiz "Digite o Peso (em kg) "
str_altura: 	.asciiz "Digite a Altura (em m) "
resultIMC:		.asciiz "O IMC � =  "

result:		.asciiz "==> O resultado da operacao eh = "

str_erro:	.asciiz "Opcao invalida.\n"

barra_ene:	.asciiz "\n"
mensagem:	.asciiz "zero"

.align 2
	number_0: .float 0.00000001	#Raiz quadrada com erro menor ou igual a 0.00000001
	number_1: .float 2.0

.text
		.globl main
		
main:
	menu:
		# ============= Printando o menu de opcoes ===============
		#printando opcao 0 - soma					OK
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_soma 	#printa s string menu_soma
		syscall
			
		#printando opcao 1 - subtracao					OK
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_subtrai 	#printa s string menu_subtrai
		syscall
				
		#printando opcao 2 - multiplicacao				OK
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_multiplica	#printa s string menu_multiplica
		syscall
			
		#printando opcao 3 - divisao					OK
		li $v0, 4		#carrega o codigo de imprimir string
		la $a0, menu_divide 	#printa s string menu_divide
		syscall
			
		#printando opcao 4 - potenciacao				FAZER
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_potencia 	#printa s string menu_potencia
		syscall
				
		#printando opcao 5 - raiz					OK
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_raiz 	#printa s string menu_raiz
		syscall
				
		#printando opcao 6 - tabuada					FAZER
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_tabuada 	#printa s string menu_tabuada
		syscall
				
		#printando opcao 7 - IMC					OK
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_IMC 	#printa s string menu_IMC
		syscall
				
		#printando opcao 8 - fatorial					OK
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_fatorial 	#printa s string menu_fatorial
		syscall
				
		#printando opcao 9 - fibonacci					NAO FUNFA
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_fibonacci 	#printa s string menu_fibonacci
		syscall
				
		#printando opcao 10 - sair					
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_sair 	#printa s string menu_sair
		syscall
		
		#printando "Digite a operacao desejada"
		li $v0, 4 		#carrega o codigo de imprimir string
		la $a0, menu_title 	#printa s string menu_title
		syscall
		#==========================================================
				
		#====== Lendo a opcao digitada pelo usuario ===============
		li $v0, 5 		#carrega o codigo de ler int
		syscall
		
		move $a0, $v0 		#salva em $a0 o num. digitado pelo usuario
		#==========================================================


		#=== Procurando a opcao escolhida pelo usuario ============
		blt $a0, 0, erro 	#se num digitado < 0, mostra mensagem de erro
		bgt $a0, 10, erro 	#se num digitado > 10, mostra mensagem de erro
		
		beq $a0, 0, somar 	#se num digitado = 0, realizar soma
		beq $a0, 1, subtrair 	#se num digitado = 1, realizar subtracao
		beq $a0, 2, multiplicar #se num digitado = 2, realizar multiplicacao
		beq $a0, 3, dividir 	#se num digitado = 3, realizar divisao
		beq $a0, 4, potencia 	#se num digitado = 4, realizar potenciacao
		beq $a0, 5, raiz 	#se num digitado = 5, realizar raiz
		beq $a0, 6, tabuada 	#se num digitado = 6, realizar tabuada
		beq $a0, 7, IMC 	#se num digitado = 7, calcular IMC
		beq $a0, 8, fatorial 	#se num digitado = 8, calcular fatorial
		beq $a0, 9, fibonacci 	#se num digitado = 9, calcular fibonacci
		beq $a0, 10, sair 	#se num digitado = 10, finalizar programa
		#===========================================================
		
	#==================== Funcao de ERRO ===================================================
	erro: #se num digitado < 0, mostra mensagem de erro
		li $v0, 4 		#carrega codigo de printar string
		la $a0, str_erro 	#printa a string erro
		syscall
		j menu 			#volta pro menu de opcoes
	#========================================================================================
	
	#==================== Funcao de SOMA ====================================================
	somar:  #se num digitado = 0, realizar soma
		
		### prntando e lendo os numeros digitados pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_a 		# imprime a string num_a
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, num_b 		#imprime a string num_b
		syscall

		li $v0, 5		#opera��o de ler int - le o segundo numero
		syscall
		move $t1, $v0 		#salva o valor lido em $t1
		####

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, result 		#imprime a string result
		syscall

		add $a0, $t0, $t1 	#calcula a soma os valores salvos em $t0 + $t1 e salva em $a0

		li $v0, 1 		#carrega o cod de imprimir int
		syscall 		#imprime o resultado salvo em $a0 = $t0 + $t1

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall
	
		j menu 			#volta pro menu de opcoes
	#========================================================================================
	
	#================ Funcao de SUBTRACAO ===================================================		
	subtrair: #se num digitado = 1, realizar subtracao
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_a 		# imprime a string num_a
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0

		li $v0, 4		#carrega o cod de imprimir string
		la $a0, num_b 		#imprime a string num_b
		syscall

		li $v0, 5 		#opera��o de ler int - le o segundo numero
		syscall
		move $t1, $v0 		#salva o valor lido em $t1
		####

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, result 		#imprime a string result
		syscall

		sub $a0, $t0, $t1 	#calcula a subtracao dos valores salvos em $t0 - $t1 e salva em $a0

		li $v0, 1 		#carrega o cod de imprimir int
		syscall 		#imprime o resultado salvo em $a0 = $t0 - $t1

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall
	
		j menu 			#volta pro menu de opcoes		
	#========================================================================================
	
	#================ Funcao de MULTIPLICACAO ===============================================
	multiplicar: #se num digitado = 2, realizar multiplicacao

		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_a		# imprime a string num_a
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, num_b 		#imprime a string num_b
		syscall

		li $v0, 5 		#opera��o de ler int - le o segundo numero
		syscall
		move $t1, $v0 		#salva o valor lido em $t1
		####

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, result 		#imprime a string result
		syscall

		mul $a0, $t0, $t1 	#calcula a multiplicacao dos valores salvos em $t0 * $t1 e salva em $a0

		li $v0, 1 		#carrega o cod de imprimir int
		syscall 		#imprime o resultado salvo em $a0 = $t0 * $t1

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall

		j menu 			#volta pro menu de opcoes	
	#========================================================================================
		
	#=============== Funcao de DIVISAO ======================================================
	dividir: #se num digitado = 3, realizar divisao
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_a 		# imprime a string num_a
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, num_b 		#imprime a string num_b
		syscall

		li $v0, 5 		#opera��o de ler int - le o segundo numero
		syscall
		move $t1, $v0 		#salva o valor lido em $t1
		####

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, result 		#imprime a string result
		syscall

		div $a0, $t0, $t1 	#calcula a divisao dos valores salvos em $t0 / $t1 e salva em $a0

		li $v0, 1 		#carrega o cod de imprimir int
		syscall 		#imprime o resultado salvo em $a0 = $t0 / $t1

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall

		j menu 			#volta pro menu de opcoes		
	#========================================================================================
	
	#=============== Funcao de POTENCIACAO ==================================================
	potencia: #se num digitado = 4, realizar potenciacao

		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_a 		# imprime a string num_a
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, num_b 		#imprime a string num_b
		syscall

		li $v0, 5 		#opera��o de ler int - le o segundo numero
		syscall
		move $t1, $v0 		#salva o valor lido em $t1
		####

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, result 		#imprime a string result
		syscall

		##############
		# FAZER CALCULO DA POTENCIACAO!!!!!!!!!!!
		#calcula a potencia dos valores salvos em $t0 e $t1 e salva em $a0 => $a0 = $t0 ^ $t1
		##############
		
		

		li $v0, 1 		#carrega o cod de imprimir int
		syscall 		#imprime o resultado salvo em $a0 = $t0 / $t1

		li $v0, 4		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall
	
		j menu 			#volta pro menu de opcoes
	
	#========================================================================================
	
	#============== Funcao de RAIZ QUADRADA =================================================
	raiz: #se num digitado = 5, realizar raiz
		### printando e lendo o numero digitado pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_unico 	# imprime a string num_unico
		syscall

		li $v0, 6		#Codigo para ler um double, o ponto flutuante lido sera armazenado no registrador $f0
		syscall
			
		l.s $f1, number_0	#Setando o registrador $f1 com o number_0
		l.s $f2, number_1	#Setando o registrador $f2 com o number_1
		mov.s $f4, $f2		#$f4 sempre sera o valor anterior
						 								
	loop:				#raiz->numero digitado, "chute" inicial->x0 
		div.s $f3, $f0, $f4	#fazendo a div->(raiz/x0)	
		add.s $f3, $f3, $f4	#fazendo a sum->(div+x0)
		div.s $f5, $f3, $f2	#fazendo a x1->(sum/2)
							
 		c.le.s $f5, $f4		#Se x1 < x0, x2 = x0-x1
		bc1t sub_1						
		c.le.s $f4, $f5		#Se x1 > x0, x2 = x1-x0 
		bc1t sub_2
		  
	loop_1 :
		c.le.s $f6, $f1		#se x2 <= 0.00000001(Erro) o programa finalizara 
		bc1t final_program	#se nao x0 = x1 e loop continuara
		mov.s $f4, $f5				
		j loop
				
	sub_1:
		sub.s $f6, $f4, $f5
		j loop_1
	sub_2:
		sub.s $f6, $f5, $f4
		j loop_1
						
	final_program:
		li $v0, 4		#Codigo para printar uma string 
		la $a0, result					
		syscall
				
		li $v0, 2 		#Codigo para printar um float
		mov.s $f12, $f5		#Movendo o resultado da raiz quadrada para o registrador $f12 
		syscall
			
		j menu 			#volta pro menu de opcoes
		
    	
	#========================================================================================
	
	#============== Funcao de TABUADA =======================================================
	tabuada: #se num digitado = 6, realizar tabuada
	
		### printando e lendo o numero digitado pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_unico	# imprime a string num_unico
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0 <=====
		####

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, result 		#imprime a string result
		syscall

		#######################
		# FAZER A TABUADA DO numero salvo em $t0 e printar
		#######################


		li $v0, 1 		#carrega o cod de imprimir int
		syscall 		#imprime o resultado salvo em $a0 = $t0 / $t1

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall
	
		j menu 			#volta pro menu de opcoes
	#========================================================================================
	
	#=============== Funcao de IMC ==========================================================
	IMC: #se num digitado = 7, calcular IMC
		li $v0, 4		#Codigo para printar uma string
		la $a0, str_peso 
		syscall
		
		li $v0, 6		#Codigo para ler um float, o ponto flutuante lido sera armazenado no registrador $f0
		syscall
		mov.s $f1, $f0 		#f1 = peso
		
		li $v0, 4		#Codigo para printar uma string
		la $a0, str_altura 
		syscall
		
		li $v0, 6		#Codigo para ler um float, o ponto flutuante lido sera armazenado no registrador $f0
		syscall
		mov.s $f2, $f0 		#f2 = altura
		
		# Calculando altura x altura
		mul.s $f3, $f2, $f2 	# $f3 = altura ao quadrado
		
		#fazendo IMC = Peso/Altura2 = $f1 / $f3	
		div.s $f4, $f1, $f3 	# = IMC
				
		#printando o resultado
		li $v0, 4		#Codigo para printar uma string
		la $a0, resultIMC
		syscall
		
		li $v0, 2		#Codigo para printar float, deve-ser passar o valor a ser printado pra $f12
		mov.s $f12, $f4
		syscall
		
		j menu 			#volta pro menu de opcoes
	#========================================================================================
	
	#============== Funcao de FATORIAL ======================================================
	fatorial:
		### printando e lendo o numero digitado pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_unico 	# imprime a string num_unico
		syscall
	
		li $v0, 5 		#l� o numero digitado
		syscall
	
		move $a0, $v0 		#salva em $a0 o num digitado pelo user
	
		jal fat
	
		move $t0, $a0 		#salva em $t0 o num digitado
		move $t1, $v0 		#salva em $t1 o fatorial calculado
		
		li $v0, 4 		#servi�o 4 = imprimir string
		la $a0, result 		#imprime a string "O resultado �: "
		syscall
	
		li $v0, 1 		#servi�o 1 = imprime int
		move $a0, $t1 		#salva o valor de $t1 (=valor do fatorial calculado) em $a0 para poder printar
		syscall 		#printei o valor do fatorial calculado
		
		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, barra_ene 	#imprime a string \n
		syscall
	
		j menu 			#volta pro menu de opcoes
	
	
	fat:
		addi $sp, $sp, -8 
		sw $a0, 0($sp)
		sw $ra, 4($sp)
		addi $t3, $zero, 1
		addi $v0, $zero, 1
	
	loop_fat:
		ble $a0, $t3, sai_loop
		mul $v0, $v0, $a0
		addi $a0, $a0, -1
		j loop_fat
	
	sai_loop:
		lw $a0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		jr $ra	
	#========================================================================================
	
	#============== Funcao de FIBONACCI =====================================================
	fibonacci: #se num digitado = 9, calcular fibonacci
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 		# carrega o codigo de imprimir string
		la $a0, num_a 		# imprime a string num_a
		syscall

		li $v0, 5 		#opera��o de ler int - le o primeiro numero
		syscall
		move $t0, $v0 		#salva o valor lido em $t0

		li $v0, 4 		#carrega o cod de imprimir string
		la $a0, num_b 		#imprime a string num_b
		syscall

		li $v0, 5 		#opera��o de ler int - le o segundo numero
		syscall
		#move $t1, $v0 #salva o valor lido em $t1
		
		##########
		#FAZER FIBONACCI
		##########


		

		j menu			#volta pro menu de opcoes
		
	#========================================================================================
	
	#============== Funcao de SAIR ==========================================================
	sair: #se num digitado = 10, finalizar programa
		li $v0, 10 		#encerra o programa
		syscall
	#========================================================================================
		
