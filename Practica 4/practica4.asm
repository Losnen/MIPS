# PRACTICA 4. PRINCIPIOS DE COMPUTADORES
# SUMA DE LOS ELEMENTOS DE UNA COLUMNA
# AUTOR: SAMUEL RAMOS BARROSO


m = 4		#numero de filas de m1
n = 5		#numero de columnas de m1
size = 4	#tamano de cada elemento


				.data
m1:				.word 1,2,3,4,5
				.word 1,2,3,4,5
				.word 1,2,3,4,5
				.word 1,2,3,4,5
				
suma:			.word 0 #variable de la suma de los elementos de la columna n		
		
cadena1:		.asciiz "| 1 2 3 4 5 |\n| 1 2 3 4 5 |\n| 1 2 3 4 5 |\n| 1 2 3 4 5 |"
cadena2:		.asciiz "\nIntroduzca el numero de la columna que desea sumar (Pulse 6 salir del programa): "
cadena3:		.asciiz "\nEl valor de la suma de la columna es: "
cadena4: 		.asciiz "\n---FIN DEL PROGRAMA---"

col: 			.word 0 #variable con la columna que queremos sumar
						# la primera fila es la fila 0
						# la primera columna es la columna 0
						# la sma de los eltos de la col 3 es 16
						
				.text
				
main:

		
		
		
		#cadena de caracteres que presenta la matriz m1
		li $v0, 4
		la $a0, cadena1
		syscall
		
		
buclewhile: 

		move $s0, $zero		#inicializo los registros en 0 para evitar fallos a la hora de operar la siguiente vez
		move $s1, $zero
		move $s3, $zero
		move $s4, $zero
		move $s6, $zero
		move $s7, $zero
		li $s5, 4
		la $s2, m1

		#cadena de caracteres que pide la columna a sumar
		li $v0, 4
		la $a0, cadena2
		syscall
		
		#la siguientes lineas piden un numero a introducir por pantalla
		li	$v0,5		# $v0 = 5 lee un entero
		syscall
		move	$s0,$v0	
		
		addi $s0, $s0, -1	#le resto uno para saber el primer elemento a sumar
			
		beq $s0, 5, fin		#si el numero introducido es 6 se acaba el programa si no sigue
			
		mult $s0, $s5		#multiplico el registro de la columna por 4 para la posicion inicial del vector
		
		mflo $s3			#muevo el resultado de la multiplicacion a un registro
		
		addi $s6, $s3, 60
		add $s2, $s2, $s3
			buclefor:
				bgt $s3,$s6, sumaes 
				lw $s4, 0($s2)
				add $s7, $s7,$s4
				addi $s2, $s2, 20
				addi $s3, $s3, 20
				sw $s7, suma
				j buclefor
		sumaes:		
		
			#cadena de caracteres de la suma
			li $v0, 4
			la $a0, cadena3
			syscall
			
			li	$v0,1
			move $a0,$s7
			syscall
			
			j buclewhile
fin:

		#cadena de caracteres que finaliza el programa
		li $v0, 4
		la $a0, cadena4
		syscall	
		
		# se hace una salida limpia del sistema
		li $v0, 10 
		syscall 
		
		
		
		
		