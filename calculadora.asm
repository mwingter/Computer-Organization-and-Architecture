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
menu_soma:	.asciiz "\n0 - Somar dois numeros.\n"
menu_subtrai:	.asciiz "1 - Subtrair dois numeros.\n"
menu_multiplica:.asciiz "2 - Multiplicar dois numeros.\n"
menu_divide:	.asciiz "3 - Dividir dois numeros.\n"
menu_potencia:	.asciiz "4 - Elevar um numero a uma potencia.\n"
menu_raiz:	.asciiz "5 - Calcular a raiz quadrada de um numero.\n"
menu_tabuada:	.asciiz "6 - Mostrar a tabuada de um numero.\n"
menu_IMC:	.asciiz "7 - Calcular o IMC (Índice de Massa Corporal) de uma pessoa.\n"
menu_fatorial:	.asciiz "8 - Calcular o fatorial de um numero.\n"
menu_fibonacci:	.asciiz "9 - Calcular a sequencia de Fibonacci de um intervalo de dois numeros.\n"
menu_sair:	.asciiz "10 - Sair.\n"

num_a:		.asciiz "\nDigite o primeiro numero: "
num_b:		.asciiz "Digite o segundo numero: "
num_unico:	.asciiz "\nDigite um numero: "

result:		.asciiz "==> O resultado da operacao eh = "

str_erro:	.asciiz "Opcao invalida.\n"

barra_ene:	.asciiz "\n"

.text
		.globl main
		
main:
	menu:
		# ============= Printando o menu de opcoes ===============
		#printando opcao 0 - soma					OK
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_soma #printa s string menu_soma
		syscall
			
		#printando opcao 1 - subtracao					OK
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_subtrai #printa s string menu_subtrai
		syscall
				
		#printando opcao 2 - multiplicacao				OK
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_multiplica #printa s string menu_multiplica
		syscall
			
		#printando opcao 3 - divisao					OK
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_divide #printa s string menu_divide
		syscall
			
		#printando opcao 4 - potenciacao				FAZER
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_potencia #printa s string menu_potencia
		syscall
				
		#printando opcao 5 - raiz					FAZER
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_raiz #printa s string menu_raiz
		syscall
				
		#printando opcao 6 - tabuada					FAZER
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_tabuada #printa s string menu_tabuada
		syscall
				
		#printando opcao 7 - IMC					FAZER
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_IMC #printa s string menu_IMC
		syscall
				
		#printando opcao 8 - fatorial					FAZER
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_fatorial #printa s string menu_fatorial
		syscall
				
		#printando opcao 9 - fibonacci					FAZER
		li $v0, 4 #carrega o codigo de imprimir string
		la $a0, menu_fibonacci #printa s string menu_fibonacci
		syscall
				
		#printando opcao 10 - sair					OK
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

		mul $a0, $t0, $t1 #calcula a multiplicacao dos valores salvos em $t0 * $t1 e salva em $a0

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

		div $a0, $t0, $t1 #calcula a divisao dos valores salvos em $t0 / $t1 e salva em $a0

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

		# FAZER CALCULO DA POTENCIACAO!!!!!!!!!!!
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
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo o numero digitado pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_unico # imprime a string num_unico
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0 <=====
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		# FAZER CALCULO DA RAIZ QUADRADA!!!!!!!!!!! numero salvo em $t0, salvar o resultado em $a0
		#######################calcula a raiz do valor salvo em $t0 e salva em $a0 => $a0 = raiz($t0)
		#Initialize $t0 = n, $t1 = i = 0, $t2 = x = n = $a0, $t3 = n/2, (n = numero que quero tirar raiz)
		#addi  $t1, $zero, 0 # $t1 = 0 (contador para o loop)
		#add  $t2, $zero, $t0 # $t2 = $t0 = n = x 
		#addi  $t3, $zero, 2 #t3 = 2
		#div $t4, $t2, $t3 # $t4 = n/2 (metade do numero q quero tirar a raiz
		
		#jal loop_raiz
		
		#mtc1 $t0, $f0

		
		#sqrt.d $f0, $f0
		
		#mfc1 $a0, $f0
		
		
		
		li $v0, 2 #carrega o cod de imprimir int
		lwc1 $f12, 0($a0)
		syscall #imprime o resultado salvo em $a0 = raiz($t0)

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra
	
		j menu #volta pro menu de opcoes
		

		
	#loop_raiz:
	#	div $t1, $t0, $t2 # $t1 = n/x 
    	#	add $t1, $t1, $t2 # $t1 = $t1 + x
    	#	#div $t1, $t1, $t3 #t1 = $t1 / 2
    	#	srl $t1, $t1, 1
   	#	blt $t1, $t4, loop_raiz
    	#	#Else, move x into return register $v0
    	#	move $a0, $t1 #move o valor em $t2 para $v0
    	#	
    	#	jr $ra
    		
 
    	
	
    	
	#========================================================================================
	
	#============== Funcao de TABUADA =======================================================
	tabuada: #se num digitado = 6, realizar tabuada
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo o numero digitado pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_unico # imprime a string num_unico
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $t0, $v0 #salva o valor lido em $t0 <=====
		####

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		# FAZER A TABUADA DO numero salvo em $t0 e printar
		#######################

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
	
	#=============== Funcao de IMC ==========================================================
	IMC: #se num digitado = 7, calcular IMC
	
	
	
	#========================================================================================
	
	#============== Funcao de FATORIAL ======================================================
	main_fatorial: #se num digitado = 8, calcular fatorial
		#addi $sp, $sp, -8 #aloca espaco na memoria
		#sw $a0, 0($sp)
		#sw $ra, 4($sp) #empilha $ra
		
		### printando e lendo o numero digitado pelo usuario
		li $v0, 4 # carrega o codigo de imprimir string
		la $a0, num_unico # imprime a string num_unico
		syscall

		li $v0, 5 #operação de ler int - le o primeiro numero
		syscall
		move $a0, $v0 #salva o valor lido em $t0 <=====
		####



		# FAZER CALCULO DO FATORIAL!!!!!!!!!!! numero salvo em $t0, salvar o resultado em $a0
		#######################calcula o fatorial do valor salvo em $t0 e salva em $a0 => $a0 = fatorial($t0)
		
		jal fatorial
		
		move $t1, $v0 #t1 = retorno do fatorial
		
		
		li $v0, 1 #carrega o cod de imprimir int
		move $a0, $t1
		syscall
		
		###########

		#li $v0, 
		#syscall #imprime o resultado salvo em $a0 = $t0 / $t1
		
		li $v0, 4 #carrega o cod de imprimir string
		la $a0, result #imprime a string result
		syscall

		li $v0, 4 #carrega o cod de imprimir string
		la $a0, barra_ene #imprime a string \n
		syscall

		#li $v0, 5 # carrega o cod de ler int
		#syscall


		#lw $ra, -4($sp)
		#addi $sp, $sp, 8
		#jr $ra

	
		j menu #volta pro menu de opcoes
		
	fatorial:
		addi $sp, $sp, -8 #aloca espaço para dois inteiros na pilha
		sw $a0, 0($sp) #salva o numero lido na primeira posicao da pilha
		sw $ra, 4($sp) #salva o endereco de retorno na segunda posicao da pilha
		addi $t0, $zero, 1 # $t0 = 1, condicao de parada
		addi $v0, $zero, 1 #v0 = 1 (fat=1)
		
	loop_fat:
		ble $a0, $t0, sai_loop_fat
		mul $v0, $v0, $a0
		addi $a0, $a0, -1
		j loop_fat
		
	sai_loop_fat:
		lw $a0, 0($sp)
		lw $ra, 4($sp)
		addi $sp, $sp, 8
		jr $ra
		
	#========================================================================================
	
	#============== Funcao de FIBONACCI =====================================================
	fibonacci: #se num digitado = 9, calcular fibonacci
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

		#div $a0, $t0, $t1 FAZER CALCULO DO FIBONACCI!!!!!!!!!!!
		#######################calcula o fibonacci no intervalo dos valores salvos em $t0 e $t1 e salva em $a0 
		#obs: $t0 = n1, $t1 = n2
		li $t2, 2 # $t2 = aux = 2 (aux guarda quantos numeros ja temos na sequencia)
		jal loop_fibonacci
		
		
		#########################

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
		
		
	loop_fibonacci:
		#pegando os proximos dois numeros da sequencia fibonacci
		add $t0, $t0, $t1 # n1 = n1 + n2
		add $t1, $t1, $t0 #n2 = n2 + n1
		
		#guardando os numeros calculados no array
		sw $t0, 0($t3)
		sw $t1, 4($t3)
		#e andando 'duas casas' no array, ou seja, 2 * 4 bytes, portanto, movendo 8 bytes
		addiu $t3, $t3, 8
		#atualizando o valor de aux = aux + 2 (pois ja adicionamos mais dois numeros fibonacci na sequencia
		
		j loop_fibonacci
		jr $ra
		
		
	#========================================================================================
	
	#============== Funcao de SAIR ==========================================================
	sair: #se num digitado = 10, finalizar programa
		li $v0, 10 #encerra o programa
		syscall
	#========================================================================================
		
