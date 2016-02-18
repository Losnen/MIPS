# PRACTICA 5. PRINCIPIOS DE COMPUTADORES
# PROGRAMA QUE CALCULA EL PRODUCTO ESCALAR DE DOS VECTORES DE FORMA ITERATIVA
# AUTOR: SAMUEL RAMOS BARROSO

size = 4		# tamano de los elementos del vector
			.data
vector1:		.word	2,3,5,6,8,1,3,2,5,9	
vector2:		.word	1,2,0,4,1,1,1,2,2,1		
pe:			.word	0	# variable para almacenar la suma		
cad: 			.asciiz "El producto escalar de los vectores es: ";	
			.text
main:
			la	$a0,vector1
                        la      $a1,vector2
			li	$a2,10
			jal	pescalar   # quedara en $v0 el resultado de la suma
			move $s5, $v0
			sw	$v0,pe
			
			
			li	$v0,4		
			la	$a0,cad	     
			syscall
			
			li	$v0,1
			lw $a0,pe
			syscall
		
			
			# salida limpia del sistema
			li	$v0,10
			syscall
# FIN DEL PROGRAMA PRINCIPAL

pescalar:	# funcion pescalar: 	$a0 direccion base del 1er vector
                #                       $a1 direccion base del 2¼ vector
                #			$a2 numero de elementos de los vectores
                #	devuelve:	$v0 producto escalar de los dos vectores
			
                # Introduce aqui el codigo iterativo necesario 
                # $v0 = 0
                # for (i = 0 ; i < $a1; i++)
                # 		$v0 += $a0[i]*$a1[i]	
                
				
				move $v0,$zero
				
			bucle:			
				bgt $t2,$a2,fin
				lw $t0,0($a0)
				lw $t1,0($a1)
				mult $t0,$t1
				mflo $t3
				add $v0,$v0,$t3
				addi $a0,$a0,4
				addi $a1,$a1,4
				addi $t2,$t2,1
				
				j bucle
				
				
		
fin:	
						
			jr	$ra
                                      

			# FIN SUBRUTINA PESCALAR
            
            
            
            
            