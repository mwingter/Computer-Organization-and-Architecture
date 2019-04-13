# Universidade de Sao Paulo - ICMC abril/2019
# @author Michelle Wingter da Silva, 10783243
# @author Igor Takeo Ambo de Melo, 10830054
# @author Marcelo Isaias de Moraes Junior, 10550218

#### TRABALHO 1 - CALCULADORA COM AS OPCOES ####
# Soma de 2 numeros (2 parametros)
# Subtracaoo de 2 numeros (2 parametros)
# Multiplicacao de 2 numeros, limitados a 16 bits cada um (2 parametros)
# Divisao de 2 numeros, , limitados a 16 bits cada um (2 parametros)
# Potencia (2 parametros)
# Raiz quadrada (1 parametro)
# Tabuada de 1 numero fornecido (1 parametro)
# Calculo do IMC (indice de Massa Corporal) (2 parametros)
# Fatorial de 1 numero fornecido (1 parametro)
# Calculo da sequencia de Fibonacci dado um intervalo (a,b) definido pelo usuario (2 parametros)
# Encerrar o programa
###############################################

.data
	.align 0
	
		menu_title:		.asciiz "\nDigite a operacao desejada: "
		menu_soma:		.asciiz "\n0 - Somar dois numeros.\n"
		menu_subtrai:		.asciiz "1 - Subtrair dois numeros.\n"
		menu_multiplica:	.asciiz "2 - Multiplicar dois numeros.\n"
		menu_divide:		.asciiz "3 - Dividir dois numeros.\n"
		menu_potencia:		.asciiz "4 - Elevar um numero a uma potencia.\n"
		menu_raiz:		.asciiz "5 - Calcular a raiz quadrada de um numero.\n"
		menu_tabuada:		.asciiz "6 - Mostrar a tabuada de um numero.\n"
		menu_IMC:		.asciiz "7 - Calcular o IMC (Indice de Massa Corporal) de uma pessoa.\n"
		menu_fatorial:		.asciiz "8 - Calcular o fatorial de um numero.\n"
		menu_fibonacci:		.asciiz "9 - Calcular a sequencia de Fibonacci de um intervalo de dois numeros.\n"
		menu_sair:		.asciiz "10 - Sair.\n"

		num_a:			.asciiz "\nDigite o primeiro numero: "
		num_b:			.asciiz "Digite o segundo numero: "
		num_unico:		.asciiz "\nDigite um numero: "

		result:			.asciiz "==> O resultado da operacao eh = "

		str_erro:		.asciiz "Opcao invalida.\n"
	
		barra_ene:		.asciiz "\n"
		mensagem:		.asciiz "zero"
		string_x: 		.asciiz " x "
		string_igual:		.asciiz " = "
		string_base : 		.asciiz "Digite a base "
		string_expoente : 	.asciiz "Digite o expoente "
		numero_neg:		.asciiz "Erro!! numero negativo\n"
		result_neg:		.asciiz "Erro!! O primeiro numero deve ser maior ou igual o segundo\n"	
		interv_erro:		.asciiz "Erro!! Intervalo incorreto\n"	
		greater_16:		.asciiz "Numero maior que 16 bits\n"
		abaixodopeso:		.asciiz "Abaixo do peso\n"
		pesoideal:		.asciiz "Peso ideal\n"
		levemente:		.asciiz "Levemente acima do peso\n"
		obesidade_1:		.asciiz "Obesidade grau 1\n"		
		obesidade_2:		.asciiz "Obesidade grau 2 (severa)\n"
		obesidade_3:		.asciiz "Obesidade grau 3 (morbida)\n"
		altura: 		.asciiz "Digite sua altura(cm): "	
		peso:			.asciiz "Digite seu peso(kg): "
		imc: 			.asciiz "IMC: "
		result_fib:		.asciiz "A sequencia desejada eh: "
		space:			.asciiz " "
				
	.align 2
		number_0_0:		.float 0.0		
		number_0: 		.float 0.00000001	#Raiz quadrada com erro menor ou igual a 0.00000001
		number_1:	 	.float 2.0
		number_dezmil:		.float 10000.0
		number_imc_0:		.float 18.5
		number_imc_1:		.float 25.0
		number_imc_2:		.float 30.0
		number_imc_3:		.float 35.0
		number_imc_4:		.float 40.0	
		
.text
	.globl main
		
main:
	menu:
		# ============= Printando o menu de opcoes ===============
		#printando opcao 0 - soma					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_soma				#printa s string menu_soma
		syscall
			
		#printando opcao 1 - subtracao					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_subtrai 				#printa s string menu_subtrai
		syscall
				
		#printando opcao 2 - multiplicacao				
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_multiplica 			#printa s string menu_multiplica
		syscall
			
		#printando opcao 3 - divisao					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_divide 				#printa s string menu_divide
		syscall
			
		#printando opcao 4 - potenciacao				
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_potencia 				#printa s string menu_potencia
		syscall
				
		#printando opcao 5 - raiz					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_raiz 				#printa s string menu_raiz
		syscall
				
		#printando opcao 6 - tabuada					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_tabuada				#printa s string menu_tabuada
		syscall
				
		#printando opcao 7 - IMC					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_IMC 				#printa s string menu_IMC
		syscall
				
		#printando opcao 8 - fatorial					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_fatorial 				#printa s string menu_fatorial
		syscall
				
		#printando opcao 9 - fibonacci					
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_fibonacci 				#printa s string menu_fibonacci
		syscall
				
		#printando opcao 10 - sair							
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_sair 				#printa s string menu_sair
		syscall
		
		#printando "Digite a operacao desejada"
		li $v0, 4 					#carrega o codigo de imprimir string
		la $a0, menu_title 				#printa s string menu_title
		syscall
		#==========================================================
				
		#====== Lendo a opcao digitada pelo usuario ===============
		li $v0, 5 					#carrega o codigo de ler int
		syscall
		
		move $a0, $v0 					#salva em $a0 o num. digitado pelo usuario
		#==========================================================


		#=== Procurando a opcao escolhida pelo usuario ============
		blt $a0, 0, erro 				#se num digitado < 0, mostra mensagem de erro
		bgt $a0, 10, erro				#se num digitado > 10, mostra mensagem de erro
		
		beq $a0, 0, somar 				#se num digitado = 0, realizar soma
		beq $a0, 1, subtrair 				#se num digitado = 1, realizar subtracao
		beq $a0, 2, multiplicar 			#se num digitado = 2, realizar multiplicacao
		beq $a0, 3, dividir 				#se num digitado = 3, realizar divisao
		beq $a0, 4, potencia				#se num digitado = 4, realizar potenciacao
		beq $a0, 5, raiz 				#se num digitado = 5, realizar raiz
		beq $a0, 6, tabuada 				#se num digitado = 6, realizar tabuada
		beq $a0, 7, IMC 				#se num digitado = 7, calcular IMC
		beq $a0, 8, fatorial 				#se num digitado = 8, calcular fatorial
		beq $a0, 9, fibonacci	 			#se num digitado = 9, calcular fibonacci
		beq $a0, 10, sair 				#se num digitado = 10, finalizar programa
		#===========================================================
		
	#==================== Funcao de ERRO ===================================================
	erro: 							#se num digitado < 0, mostra mensagem de erro
		li $v0, 4 					#carrega codigo de printar string
		la $a0, str_erro				#printa a string erro
		syscall
		j menu 						#volta pro menu de opcoes
	#========================================================================================
	
	#==================== Funcao de SOMA ====================================================
	somar: #se num digitado = 0, realizar soma
		
		li $v0, 4 					# carrega o codigo de imprimir string
		la $a0, num_a					# imprime a string num_a
		syscall

		li $v0, 5 					#operacao de ler int - le o primeiro numero
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t0, $v0 					#salva o valor lido em $t0

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, num_b 					#imprime a string num_b
		syscall

		li $v0, 5 					#operacao de ler int - le o segundo numero
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t1, $v0					#salva o valor lido em $t1


		li $v0, 4					#carrega o cod de imprimir string
		la $a0, result 					#imprime a string result
		syscall

		add $a0, $t0, $t1				#calcula a soma os valores salvos em $t0 + $t1 e salva em $a0

		li $v0, 1 					#carrega o cod de imprimir int
		syscall 					#imprime o resultado salvo em $a0 = $t0 + $t1

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, barra_ene 				#imprime a string \n
		syscall
	
		j menu 						#volta pro menu de opcoes
		
	#========================================================================================
	
	#================ Funcao de SUBTRACAO ===================================================		
	subtrair: #se num digitado = 1, realizar subtracao

		
		li $v0, 4 					# carrega o codigo de imprimir string
		la $a0, num_a					# imprime a string num_a
		syscall

		li $v0, 5 					#operacao de ler int - le o primeiro numero
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t0, $v0 					#salva o valor lido em $t0

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, num_b 					#imprime a string num_b
		syscall

		li $v0, 5 					#operacao de ler int - le o segundo numero
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo	
		move $t1, $v0 					#salva o valor lido em $t1
	
		bgt $t1, $t0, exit_result_neg
	
		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, result					#imprime a string result
		syscall

		sub $a0, $t0, $t1 				#calcula a subtracao dos valores salvos em $t0 - $t1 e salva em $a0

		li $v0, 1 					#carrega o cod de imprimir int
		syscall 					#imprime o resultado salvo em $a0 = $t0 - $t1

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, barra_ene 				#imprime a string \n
		syscall

		j menu 						#volta pro menu de opcoes	
		
		exit_result_neg:
			li $v0, 4				#Codigo para printar uma string
			la $a0, result_neg			#Printando a string "Erro!! O primeiro numero deve ser maior ou igual o segundo\n"	syscall
			syscall
			
			j menu
					
	#========================================================================================
	
	#================ Funcao de MULTIPLICACAO ===============================================
	multiplicar:#se num digitado = 2, realizar multiplicacao
		
		li $v0, 4 					# carrega o codigo de imprimir string
		la $a0, num_a 					# imprime a string num_a
		syscall

		li $v0, 5					#operacao de ler int - le o primeiro numero
		syscall
		bgt $v0, 32767, exit_greater_mult		#(32767)maior numero positivio de 16 bits 
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo 
		move $t0, $v0 					#salva o valor lido em $t0
		
		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, num_b 					#imprime a string num_b
		syscall

		li $v0, 5 					#operacao de ler int - le o segundo numero
		syscall
		bgt $v0, 32767, exit_greater_mult		#(32767)maior numero positivio de 16 bits
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo 
		move $t1, $v0 					#salva o valor lido em $t1
	
		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, result 					#imprime a string result
		syscall

		mul $a0, $t0, $t1 				#calcula a multiplicacao dos valores salvos em $t0 * $t1 e salva em $a0

		li $v0, 1 					#carrega o cod de imprimir int
		syscall 					#imprime o resultado salvo em $a0 = $t0 * $t1

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, barra_ene				#imprime a string \n
		syscall

		j menu						#volta pro menu de opcoes
		
		exit_greater_mult:
			li $v0, 4
			la $a0, greater_16			#Mensagem para o numero maior que 16 bits	
			syscall
			
			j menu					#volta para o menu de opcoes
	#========================================================================================
		
	#=============== Funcao de DIVISAO ======================================================
	dividir: #se num digitado = 3, realizar divisao
		li $v0, 4 					# carrega o codigo de imprimir string
		la $a0, num_a 					# imprime a string num_a
		syscall	

		li $v0, 5					#operacao de ler int - le o primeiro numero
		syscall
		bgt $v0, 32767, exit_greater_div		#(32767)maior numero positivio de 16 bits 
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t0, $v0 					#salva o valor lido em $t0

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, num_b 					#imprime a string num_b
		syscall

		li $v0, 5 					#operacao de ler int - le o segundo numero
		syscall
		bgt $v0, 32767, exit_greater_div		#(32767)maior numero positivio de 16 bits 
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t1, $v0 					#salva o valor lido em $t1

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, result 					#imprime a string result
		syscall

		div $a0, $t0, $t1 				#calcula a divisao dos valores salvos em $t0 / $t1 e salva em $a0

		li $v0, 1					#carrega o cod de imprimir int
		syscall 					#imprime o resultado salvo em $a0 = $t0 / $t1

		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, barra_ene 				#imprime a string \n
		syscall

		j menu 						#volta pro menu de opcoes
		
		exit_greater_div:
			li $v0, 4
			la $a0, greater_16			#Mensagem para o numero maior que 16 bits
			syscall
			
			j menu					#volta para o menu de opcoes
										
	#========================================================================================
	
	#=============== Funcao de POTENCIACAO ==================================================
	potencia: #se num digitado = 4, calcular a potencia		
		li $v0, 4					#Codigo para ler um inteiro
		la $a0, string_base
		syscall
		
		li $v0, 5					#Codigo para ler um inteiro
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo		
		move $t0, $v0 					#Em $t0 contem o primeiro numero(base)

		
		li $v0, 4					#Codigo para printar uma string
		la $a0, string_expoente
		syscall
		
		li $v0, 5					#Codigo para ler um inteiro
		syscall
		blt $t0, $zero, exit_neg			#Analisando se a base eh negativa		
		move $t1, $v0					#Em $t1 contem o segundo numero(expoente) 
		
		beq $t1, $zero, return_um  			#Se o expoente for igual a zero será printado 1
		addi $t2, $zero, 0				#Contador igual a zero
		addi $t3, $zero, 1				#Em $t3 contem a resposta
			
		loop_pot:
			beq $t2, $t1, return_exp		#Enquanto o contador for diferente de $t1(expoente) o loop acontecera
			mul $t3, $t3, $t0			#Fazendo a conta			
		   	addi $t2, $t2, 1			#Aumentando o valor do contador 
		        j loop_pot          
		                         
		return_um:					#O programa so entrara nessa label se o expoente for igual a zero
			li $v0, 4				#Codigo para printar uma string
			la $a0, result		
			syscall
			
			li $v0, 1				#Codigo para printar um inteiro
			li $a0, 1				#Setando o registrador $a0 como 1(resposta para qualquer base elevado a 0) 
			syscall 
		  	j exit
		
		return_exp:
			li $v0, 4
			la $a0, result
			syscall
						
			li $v0, 1				#Codigo para printar um inteiro
			move $a0, $t3				#Movendo o resultado para o registrador $a0 
			syscall
			j exit  	     	   
		exit:	
			li $v0, 4
			la $a0, barra_ene
			syscall
			
			j menu				 	#volta pro menu de opcoes		
	#========================================================================================
	
	#============== Funcao de RAIZ QUADRADA =================================================
	raiz:#se num digitado = 5, calcula a raizquadrada
								# Printando e lendo o numero digitado pelo usuario
		li $v0, 4 					# Carrega o codigo de imprimir string
		la $a0, num_unico 				# Imprime a string num_unico
		syscall

		li $v0, 6					#Codigo para ler um float, o ponto flutuante lido sera armazenado no registrador $f0
		syscall
		l.s $f1, number_0_0
		c.le.s $f0, $f1
		bc1t exit_neg
				
		l.s $f1, number_0				#Setando o registrador $f1 com o number_0
		l.s $f2, number_1				#Setando o registrador $f2 com o number_1
		mov.s $f4, $f2					#$f4 sempre sera o valor anterior
						 								
		loop:						#Raiz->numero digitado, "chute" inicial->x0 
			div.s $f3, $f0, $f4			#Fazendo a div->(raiz/x0)	
			add.s $f3, $f3, $f4			#Fazendo a sum->(div+x0)
			div.s $f5, $f3, $f2			#Fazendo a x1->(sum/2)
							
 			c.le.s $f5, $f4				#Se x1 < x0, x2 = x0-x1
			bc1t sub_1						
			c.le.s $f4, $f5				#Se x1 > x0, x2 = x1-x0 
			bc1t sub_2
		  
		loop_1 :
			c.le.s $f6, $f1				#Se x2 <= 0.00000001(Erro) o programa finalizara 
			bc1t final_program			#Se nao x0 = x1 e loop continuara
			mov.s $f4, $f5				
			j loop
				
		sub_1:
			sub.s $f6, $f4, $f5
			j loop_1
		sub_2:
			sub.s $f6, $f5, $f4
			j loop_1
						
		final_program:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, result					
			syscall
				
			li $v0, 2 				#Codigo para printar um float
			mov.s $f12, $f5				#Movendo o resultado da raiz quadrada para o registrador $f12 
			syscall
		
			li $v0, 4				#Codigo para printar uma string
			la $a0, barra_ene			#Printando a string '\n'
			syscall	
					
			j menu					#Volta pro menu de opcoes    	
	#========================================================================================
	
	#============== Funcao de TABUADA =======================================================
	tabuada: #se num digitado = 6, mostra a tabuada 
		li $v0, 4					#Codigo para printar uma string
		la $a0, num_unico
		syscall
		
		li $v0, 5					#Codigo para ler um inteiro
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t0, $v0					#Em $t0 contem o numero a ser calculado a tabuada
		
		addi $t1, $zero, 1				#Setando o contador igual a 1
		addi $t2, $zero, 10				#Setando um registrador igual a 10(numero maximo a ser multiplicado na tabuada) 
		
		loop_tabu:
			bgt $t1, $t2, exit_tabu			#Enquanto o $t1(contador) nao for maior que $t2(10) o loop acontecera
			mul $t3, $t0, $t1			#Em $t3 contem o resultado da multiplicacao
			jal printa_tabu				#Jump para printa_tabu e guarda o endereco da proxima instrucao em $ra
			addi $t1, $t1, 1			#Aumentando o contador	
			j loop_tabu
			
		printa_tabu:
			li $v0, 1				#Codigo para printar um inteiro
			move $a0, $t0				#Printando o numero que esta sendo calculado a tabuada
			syscall
			
			li $v0, 4 				#Codigo para printar uma string
			la $a0, string_x			#Printando o 'x'
			syscall
			
			li $v0, 1				#Codigo para printar uma inteiro
			move $a0, $t1				#Printado o contador(0,1,2,3,4,5,6,7,8,9,10)	
			syscall
			
			li $v0, 4				#Codigo para printar uma string
			la $a0, string_igual			#Printando o '='
			syscall
			
			li $v0, 1				#Codigo para printar um inteiro 
			move $a0, $t3				#Printando o resultado da multiplicacao	
			syscall
			
			li $v0, 4				#Codigo para printar uma string
			la $a0, barra_ene			#Printando o '\n'
			syscall
			
			jr $ra					#Jump para endereco da proxima instrucao $ra(addi $t1, $t1, 1)									

		exit_tabu:
			j menu					#volta pro menu de opcoes
	
	
	#========================================================================================
	
	#=============== Funcao de IMC ==========================================================
	IMC: #se num digitado = 7, calcular IMC
	
		li $v0, 4					#Codigo para printar uma string	
		la $a0, altura					#Printando a string "Digite sua altura(cm): "
		syscall 	
		
		li $v0, 6					#Codigo para ler um ponto flutuante
		syscall
		
		l.s $f22, number_0_0
		c.le.s $f0, $f22
		bc1t exit_neg		
		mov.s $f1, $f0					#Guardando o valor da altura no registrador $f1
		
		li $v0, 4					#Codigo para printar uma string	
		la $a0, peso					#Printando a string "Digite seu peso(kg): "
		syscall 			
		
		li $v0, 6					#Codigo para ler um ponto flutuante
		syscall
		l.s $f22, number_0_0
		c.le.s $f0, $f22
		bc1t exit_neg		
		mov.s $f2, $f0					#Guardando o valor do peso no registrador $f2
		
		mul.s $f1, $f1, $f1				#ALtura * Altura, guardando a altura ao quadrado em $f1
		
		div.s $f12, $f2, $f1				#IMC = Peso/(Altura^2) 
		l.s $f3, number_dezmil
		mul.s $f12, $f12, $f3				#Multiplicando o valor do IMC por mil
		
		li $v0, 4					#Codigo para printar uma string
		la $a0, imc					#Printando a string "IMC: "
		syscall
				
		li $v0, 2					#Codigo para printar um float
		syscall
		
		li $v0, 4					#Codigo para printar uma string
		la $a0, barra_ene 				#Printando o '\n'
		syscall
		
		l.s $f3, number_imc_0
		c.lt.s $f12, $f3				#imc < 18.5
		bc1t jump_0 					#Se true jump para jump_0
		
		l.s $f3, number_imc_1
		c.lt.s $f12, $f3				#imc < 25.0
		bc1t jump_1					#Se true jump para jump_1
		
		l.s $f3, number_imc_2				
		c.lt.s $f12, $f3				#imc < 30.0
		bc1t jump_2					#Se true jump para jump_2
		
		l.s $f3, number_imc_3
	  	c.lt.s $f12, $f3				#imc < 35.0
		bc1t jump_3					#Se true jump para jump_3
		
		l.s $f3, number_imc_4
		c.lt.s $f12, $f3				#imc < 40.0
		bc1t jump_4					#Se true jump para jump_3
		
		j jump_5					#imc >= 40
		
		jump_0:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, abaixodopeso			#Printando a string "Abaixo do peso\n"	
			syscall
			j exit_imc				#jump para o final do programa
		
		jump_1:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, pesoideal			#Printando a string "Peso ideal\n"	
			syscall
			j exit_imc				#jump para o final do programa
		
		jump_2:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, levemente			#Printando a string "Levemente acima do peso\n"	
			syscall
			j exit_imc				#jump para o final do programa
								
		jump_3:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, obesidade_1			#Printando a string "Obesidade grau 1\n"	
			syscall
			j exit_imc				#jump para o final do programa
											
		jump_4:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, obesidade_2			#Printando a string "Obesidade grau 2 (severa)\n"	
			syscall
			j exit_imc				#jump para o final do programa
			
		jump_5:
			li $v0, 4				#Codigo para printar uma string 
			la $a0, obesidade_3			#Printando a string "Obesidade grau 3 (morbida)\n"	
			syscall
																									
		exit_imc:
			j menu					#volta para o menu de opcoes
			
	
	
	#========================================================================================
	
	#============== Funcao de FATORIAL ======================================================
	fatorial:#se num digitado = 8, calcula o fatorial
		li $v0, 4 					# carrega o codigo de imprimir string
		la $a0, num_unico				# imprime a string num_unico
		syscall
	
		li $v0, 5 					#le o numero digitado
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $a0, $v0 					#salva em $a0 o num digitado pelo user
	
		jal fat
	
		move $t0, $a0 					#salva em $t0 o num digitado
		move $t1, $v0 					#salva em $t1 o fatorial calculado
		
		li $v0, 4 					#servico 4 = imprimir string
		la $a0, result					#imprime a string "O resultado eh: "
		syscall
	
		li $v0, 1 					#servico 1 = imprime int
		move $a0, $t1 					#salva o valor de $t1 (=valor do fatorial calculado) em $a0 para poder printar
		syscall 					#printei o valor do fatorial calculado
		
		li $v0, 4 					#carrega o cod de imprimir string
		la $a0, barra_ene 				#imprime a string \n
		syscall
	
		j menu 						#volta pro menu de opcoes
	
	
		fat:
			addi $sp, $sp, -8 			#desci na stack
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
			addi $sp, $sp, 8			#subi na stack
			jr $ra	
	#========================================================================================
	
	#============== Funcao de FIBONACCI =====================================================
	fibonacci: #se num digitado = 9, calcular fibonacci
		
		li $v0, 4					#Codigo pra printar uma string
		la $a0, num_a					#Printando a string "Digite o primeiro numero: "
		syscall	

		li $v0, 5					#Codigo para ler um inteiro
		syscall		
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t0, $v0					#Guardando o comeco do intervalo no registrador $t0
	
		li $v0, 4					#Codigo pra printar uma string
		la $a0, num_b					#Printando a string "Digite o segundo numero: "
		syscall	
		
		li $v0, 5					#Codigo para ler um inteiro
		syscall
		blt $v0, $zero, exit_neg			#Vendo se o numero digitado eh negativo
		move $t1, $v0					#Guardando o fim do intervalo no registrador $t1
		
		beq $t0, $zero, exit_intervalo			#Verificando se o numero eh zero
		beq $t0, $zero, exit_intervalo			#Verificando se o numero eh zero	
		bgt $t0, $t1, exit_intervalo			#Vendo se o intervalo eh valido	
		
		li $t2, 1					#Primeiro elemento da sequencia de fibonacci
		li $t3, 0					#Elemento anterior
		li $t4, 1					#Setando o contador como 1
		
		li $v0, 4					#Codigo para printar uma string
		la $a0, result_fib				#Printando a string "A sequencia desejada eh: "
		syscall
		
		jal fib
		
		li $v0, 4					#Codigo para printar uma string
		la $a0, barra_ene				#Printando o '\n'
		syscall
		
		j menu 						#volta para o menu de opcoes
		
		fib:
			addi $sp, $sp, -8			#Andando 8 bytes com o ponteiro da pilha(liberando 8 bytes na pilha).  
			sw $a0, 0($sp)				#Empilhando o conteudo de $a0 nos primeiros 4 bytes liberados na pilha
			sw $ra, 4($sp)				#Empilhando o endereço da proxima instrucao(apos o jal) nos 4 bytes restantes
	
		loop_fib_0:					#loop_fib_0 faz o fibonacci antes de entrar no intervalo, portanto nao printa
			
			beq $t4, $t0, print_fib		
			move $t5, $t3				#Auxiliar recebe o anterior, $t3 recebe o valor atual e $t2 recebe o novo valor
			move $t3, $t2
			add $t2, $t2, $t5			#Fiboncci atual = (atual-1) + (atual-2)
			addi $t4, $t4, 1			#Incrementando o contador
			j loop_fib_0
									
		loop_fib_1:					#loop_fib_1 esta dentro do intervalo recebido como parametro, portanto  printa
			
			beq $t4, $t1, exit_fib
			move $t5, $t3
			move $t3, $t2
			add $t2, $t2, $t5
			addi $t4, $t4, 1
	
		print_fib:
					
			li $v0, 1				#Codigo para printar um inteiro
			move $a0, $t2				#Printando a sequencia
			syscall
			
			li $v0, 4				#Codigo para printar uma string
			la $a0, space				#Printando um espaco	
			syscall
			
			j loop_fib_1
										
		exit_fib:
			lw $a0, 0($sp)				#Carregando o conteudo da posicao '0' da pilha no registrador $a0
			lw $ra, 4($sp)				#Carregando o conteudo da posicao '4' da pilha no registrador $ra
			addi $sp, $sp, 8 			#Voltando o ponteiro da pilha($sp) para a posicao anterior(antes de armazenar os 8 bytes).
			jr $ra				
		
		exit_intervalo:
			li $v0, 4				#Codigo para printar a string
			la $a0, interv_erro			#Printando o erro quando o intervalo nao eh valido
			syscall
				
			j menu					#voltando para o menu de opcoes			
	#========================================================================================
	
	exit_neg:
		
		li $v0, 4					#Codigo para printar uma string
		la $a0, numero_neg				#Mensagem de erro do numero negativo	
		syscall
			
		j menu
	
	#============== Funcao de SAIR ==========================================================
	sair: #se num digitado = 10, finalizar programa
		li $v0, 10					 #encerra o programa
		syscall
	#========================================================================================
		
