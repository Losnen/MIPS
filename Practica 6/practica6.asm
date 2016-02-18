# PRACTICA 6. PRINCIPIOS DE COMPUTADORES
# PROGRAMA QUE CALCULA LOS N NUMEROS DE LA SUCESIÓN DE FIBONACCI 
# AUTOR: SAMUEL RAMOS BARROSO
			.data
fib:        .word  0
cad1:       .asciiz "Introduzca el número de elementos de Fibonacci a calcular: ";
cad2:       .asciiz "La sucesión de fibonacci es 0";
cad3:		.asciiz " ";
cad4:       .asciiz "0 1 ";
			.text
main:

			li $s1, 1
			li $s3, 0
			li $s2, 0
			li $s4, 0
			
			li	$v0,4		
			la	$a0,cad1	    
			syscall
			li	$v0,5		
	        syscall
	        move	$s3,$v0		
			sub $s3, $s3,2
			beq $s3,0,fin2
bucle:
	 		
			bgt $s4,$s3, fin
			addi $s4,$s4,1
			beq $s4, 1, salto
			add $s1, $s1, $s2
			li	$v0,1
			move $a0,$s1
			syscall
			li	$v0,4		
			la	$a0,cad3	    
			syscall
			sub $s2, $s1,$s2
			
			j bucle 
fin: 
			li $v0, 10
			syscall
fin2: 
            li	$v0,4		
			la	$a0,cad2	    
			syscall
			li $v0, 10
		    syscall
salto:
            li	$v0,4		
			la	$a0,cad4	    
			syscall
			j bucle 
 

			