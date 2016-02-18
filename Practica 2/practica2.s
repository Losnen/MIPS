# PRACTICA 2 PRINCIPIO DE COMPUTADORAS
# Suma dos nœmero enteros y almacena el restoultado

        	.data        		# Seccion declaracion de datos
        	
op1:		.word	25   		# variable op1 con valor inicial 25
op2:		.word	7		# variable op2 con valor inicial 7
suma:	       	.word	0		# variable suma con valor inicial 0
resta:		.word	0		# variable resta con valor inicial 0
multbajo:      	.word	0		# variable multbajo con valor inicial 0
multalto: 	.word	0		# variable multalto con valor inicial 0
divis:		.word	0		# variable cociente con valor inicial 0
resto:		.word	0		# variable restoto con valor inicial 0		  
cadena1: 		.asciiz	"El valor de la suma es:\n";
cadena2: 		.asciiz	"El valor de la resta es:\n";
cadena3: 		.asciiz	"El valor de la multiplicación es:\n";
cadena4: 		.asciiz	"El valor de la division es:\n";
cadena5: 		.asciiz	"El resto de la division es:\n";
endl:			.asciiz	"\n";

		.text			# Seccion de codigo de usuario	
		 
main:                		       # La etiqueta main es el inicio

	lw	$s0, op1	# cargo en el registro $s0 el valor de op1
	lw	$s1, op2	# cargo en el registro $s1 el valor de op2
	
	# suma de enteros
	add	$s2, $s0, $s1
	sw	$s2, suma
	
	# cadena 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, cadena1 	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0, 1		# $v0 = 4 funcion print_int
	lw 	$a0, suma 	# Sa0 = entero a imprimir
	syscall
	
	
	# salto de línea 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, endl 		# Sa0 = direccion de la cadena a imprimir
	syscall

	
	# resta de enteros
	sub	$s3, $s0, $s1
	sw	$s3, resta
	
	# cadena 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, cadena2 	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0, 1		# $v0 = 4 funcion print_int
	lw 	$a0, resta 	# Sa0 = entero a imprimir
	syscall
	
	# salto de línea 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, endl 		# Sa0 = direccion de la cadena a imprimir
	syscall
	
	
	# multiplicación de enteros
	mult	$s0, $s1
	mflo	$s4
	sw 	$s4, multbajo
	mfhi	$s7
	sw 	$s7, multalto
	
	# cadena 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, cadena3 	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0, 1		# $v0 = 4 funcion print_int
	lw 	$a0, multbajo 	# Sa0 = entero a imprimir
	syscall
	
	# salto de línea 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, endl 		# Sa0 = direccion de la cadena a imprimir
	syscall
	
	# multiplicación de enteros
	div	$s0, $s1
	mflo	$s5
	sw 	$s5, divis
	mfhi	$s6
	sw	$s6, resto
	
	# cadena 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, cadena4 	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0, 1		# $v0 = 4 funcion print_int
	lw 	$a0, divis 	# Sa0 = entero a imprimir
	syscall
	
	# salto de línea 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, endl 		# Sa0 = direccion de la cadena a imprimir
	syscall
	
	# cadena 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, cadena5 	# Sa0 = direccion de la cadena a imprimir
	syscall
	
	li	$v0, 1		# $v0 = 4 funcion print_int
	lw 	$a0, resto 	# Sa0 = entero a irimir
	syscall
	
	# salto de línea 
	li $v0, 4 		# $v0 = 4 funcion print string
	la $a0, endl 		# Sa0 = direccion de la cadena a imprimir
	syscall
	
	
	# se hace una salida limultbajoia del sistema (exit es codigo 10)
	li $v0, 10
	syscall     
	# END
