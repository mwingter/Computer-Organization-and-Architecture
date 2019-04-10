# Universidade de São Paulo - ICMC abril/2019
# @author Michelle Wingter da Silva, 10783243


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
	
menu_title:	.asciiz "\nDigite a operacao desejada: "
menu_soma:	.asciiz "\nDigite 0 para somar dois numeros.\n"
menu_subtrai:	.asciiz "Digite 1 para subtrair dois numeros.\n"
menu_multiplica:.asciiz "Digite 2 para multiplicar 2 numeros.\n"
menu_divide:	.asciiz "Digite 3 para dividir dois numeros.\n"
menu_potencia:	.asciiz "Digite 4 para elevar um numero a uma potencia.\n"
menu_raiz:	.asciiz "Digite 5 para calcular a raiz quadrada de um numero.\n"
menu_tabuada:	.asciiz "Digite 6 para mostrar a tabuada de um numero.\n"
menu_IMC:	.asciiz "Digite 7 para calcular o IMC (Índice de Massa Corporal) de uma pessoa.\n"
menu_fatorial:	.asciiz "Digite 8 para calcular o fatorial de um numero.\n"
menu_fibonacci:	.asciiz "Digite 9 para calcular a sequencia de Fibonacci de um intervalo de dois numeros.\n"
menu_sair:	.asciiz "Digite 10 para sair.\n"

num_a:		.asciiz "\nDigite o primeiro numero: "
num_b:		.asciiz "Digite o segundo numero: "

result:		.asciiz "==> O resultado da operacao eh = "

str_erro:	.asciiz "Opcao invalida.\n"

barra_ene:	.asciiz "\n"

		.text
		.globl main
		
main:
	menu:
		# ============= Printando o menu de opcoes ===============
		#printando opcao 0 - soma
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_soma #printa s string menu_soma
		syscall
			
		#printando opcao 1 - subtracao
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_subtrai #printa s string menu_subtrai
		syscall
				
		#printando opcao 2 - multiplicacao
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_multiplica #printa s string menu_multiplica
		syscall
			
		#printando opcao 3 - divisao
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_divide #printa s string menu_divide
		syscall
			
		#printando opcao 4 - potenciacao
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_potencia #printa s string menu_potencia
		syscall
				
		#printando opcao 5 - raiz
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_raiz #printa s string menu_raiz
		syscall
				
		#printando opcao 6 - tabuada
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_tabuada #printa s string menu_tabuada
		syscall
				
		#printando opcao 7 - IMC
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_IMC #printa s string menu_IMC
		syscall
				
		#printando opcao 8 - fatorial
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_fatorial #printa s string menu_fatorial
		syscall
				
		#printando opcao 9 - fibonacci
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_fibonacci #printa s string menu_fibonacci
		syscall
				
		#printando opcao 10 - sair
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_sair #printa s string menu_sair
		syscall
		
		#printando "Digite a operacao desejada"
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_title #printa s string menu_title
		syscall
		#==========================================================
				
		#====== Lendo a opcao digitada pelo usuario ===============
		li $v0, 5 #carrega o codigo de ler int
		syscall
		
		move $a0, $v0 #salva em $a0 o num. digitado pelo usuario
		#==========================================================


		#=== Procurando a opcao escolhida pelo usuario ============
		blt $a0, 0, erro #se num digitado < 0, mostra mensagem de erro
		bgt $a0, 10, erro #se num digitado > 10, mostra mensagem de erro
		
		beq $a0, 0, somar #se num digitado = 0, realizar soma
		beq $a0, 1, subtrair #se num digitado = 1, realizar subtracao
		beq $a0, 2, multiplicar #se num digitado = 2, realizar multiplicacao
		beq $a0, 3, dividir #se num digitado = 3, realizar divisao
		beq $a0, 4, potencia #se num digitado = 4, realizar potenciacao
		beq $a0, 5, raiz #se num digitado = 5, realizar raiz
		beq $a0, 6, tabuada #se num digitado = 6, realizar tabuada
		beq $a0, 7, IMC #se num digitado = 7, calcular IMC
		beq $a0, 8, fatorial #se num digitado = 8, calcular fatorial
		beq $a0, 9, fibonacci #se num digitado = 9, calcular fibonacci
		beq $a0, 10, sair #se num digitado = 10, finalizar programa
		#===========================================================
		
	#==================== Funcao de ERRO ===================================================
	erro: #se num digitado < 0, mostra mensagem de erro
		li $v0, 4 #carrega codigo de printar string
		la $a0, str_erro #printa a string erro
		syscall
		j menu #volta pro menu de opcoes
	#========================================================================================
	
	#==================== Funcao de SOMA ====================================================
	somar:  #se num digitado = 0, realizar soma
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### prntando e lendo os numeros digitados pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_a # imprime a string num_a
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, num_b #imprime a string num_b
		syscall

		li $v0, 5 #operação de ler int - le o segundo numero
		syscall
		move $t1, $v0 #salva o valor lido em $t1
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		add $a0, $t0, $t1 #calcula a soma os valores salvos em $t0 + $t1 e salva em $a0

		li $v0, 1 #carrega o cod de imprimir int
		syscall #imprime o resultado salvo em $a0 = $t0 + $t1

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra
	
		j menu #volta pro menu de opcoes
	#========================================================================================
	
	#================ Funcao de SUBTRACAO ===================================================		
	subtrair: #se num digitado = 1, realizar subtracao
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_a # imprime a string num_a
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, num_b #imprime a string num_b
		syscall

		li $v0, 5 #operação de ler int - le o segundo numero
		syscall
		move $t1, $v0 #salva o valor lido em $t1
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		sub $a0, $t0, $t1 #calcula a subtracao dos valores salvos em $t0 - $t1 e salva em $a0

		li $v0, 1 #carrega o cod de imprimir int
		syscall #imprime o resultado salvo em $a0 = $t0 - $t1

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra
	
		j menu #volta pro menu de opcoes		
	#========================================================================================
	
	#================ Funcao de MULTIPLICACAO ===============================================
	multiplicar: #se num digitado = 2, realizar multiplicacao
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_a # imprime a string num_a
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, num_b #imprime a string num_b
		syscall

		li $v0, 5 #operação de ler int - le o segundo numero
		syscall
		move $t1, $v0 #salva o valor lido em $t1
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		mul $a0, $t0, $t1 #calcula a multiplicacao dos valores salvos em $t0 e $t1 e salva em $a0

		li $v0, 1 #carrega o cod de imprimir int
		syscall #imprime o resultado salvo em $a0 = $t0 * $t1

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra
	
		j menu #volta pro menu de opcoes	
	#========================================================================================
		
	#=============== Funcao de DIVISAO ======================================================
	dividir: #se num digitado = 3, realizar divisao
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_a # imprime a string num_a
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, num_b #imprime a string num_b
		syscall

		li $v0, 5 #operação de ler int - le o segundo numero
		syscall
		move $t1, $v0 #salva o valor lido em $t1
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		div $a0, $t0, $t1 #calcula a divisao dos valores salvos em $t0 e $t1 e salva em $a0

		li $v0, 1 #carrega o cod de imprimir int
		syscall #imprime o resultado salvo em $a0 = $t0 / $t1

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra
	
		j menu #volta pro menu de opcoes		
	#========================================================================================
	
	#=============== Funcao de POTENCIACAO ==================================================
	potencia: #se num digitado = 4, realizar potenciacao
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo os numeros digitados pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_a # imprime a string num_a
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, num_b #imprime a string num_b
		syscall

		li $v0, 5 #operação de ler int - le o segundo numero
		syscall
		move $t1, $v0 #salva o valor lido em $t1
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		#div $a0, $t0, $t1 
		#calcula a potencia dos valores salvos em $t0 e $t1 e salva em $a0 => $a0 = $t0 ^ $t1

		li $v0, 1 #carrega o cod de imprimir int
		syscall #imprime o resultado salvo em $a0 = $t0 / $t1

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra
	
		j menu #volta pro menu de opcoes
	
	#========================================================================================
	
	#============== Funcao de RAIZ QUADRADA =================================================
	raiz: #se num digitado = 5, realizar raiz
		
		
	#========================================================================================
	
	#============== Funcao de TABUADA =======================================================
	tabuada: #se num digitado = 6, realizar tabuada
	
	
	
	#========================================================================================
	
	#=============== Funcao de IMC ==========================================================
	IMC: #se num digitado = 7, calcular IMC
	
	
	
	#========================================================================================
	
	#============== Funcao de FATORIAL ======================================================
	fatorial: #se num digitado = 8, calcular fatorial
		
		
		
	#========================================================================================
	
	#============== Funcao de FIBONACCI =====================================================
	fibonacci: #se num digitado = 9, calcular fibonacci
		
		
	#========================================================================================
	
	#============== Funcao de SAIR ==========================================================
	sair: #se num digitado = 10, finalizar programa
		li $v0, 10 #encerra o programa
		syscall
	#========================================================================================
		