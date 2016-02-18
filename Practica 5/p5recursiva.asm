# PRACTICA 5. PRINCIPIOS DE COMPUTADORES
# PROGRAMA QUE CALCULA EL PRODUCTO ESCALAR DE DOS VECTORES DE FORMA RECURSIVA 
# AUTOR: SAMUEL RAMOS BARROSO
 
size = 4                				# Tamano de los elementos del vector
 
                        .data
vector1:        .word   2,3,5,6,8,1,3,2,5,9    
vector2:        .word   1,2,0,4,1,1,1,2,2,1            
pe:                     .word   0      # Variable para almacenar la suma
cad:            .asciiz "El producto escalar de los dos vectores es: ";                
                       
                       
                        .text
main:
                la $a0,vector1  	# Inicializar y cargar lo necesario
				la $a1,vector2
                li $a2,10
                li $v0, 0              
               
                jal     pescalar   	# Quedara en $v0 el resultado de la suma
                move $t9, $v0
                       
                sw $v0,pe       	# Almacenar la suma
                       
                li $v0, 4
                la $a0, cad
                syscall
               
                li $v0, 1
                la $a0,($t9)
                syscall
                       
                li $v0,10       	# Salida limpia del sistema
                syscall
               
                # FIN DEL PROGRAMA PRINCIPAL
 
 
pescalar:      
         
                bgt $a2, $zero, pescalar2     # Caso base
       			li $v0, 0
				jr $ra
			   
pescalar2:
 
                la $a0,vector1
				la $a1,vector2
 
                mul $t1, $a2, size     	# Hago el desplazamiento de los vectores 
                addi $t1, $t1, -4
 
                add $t0, $a0, $t1       # Cargar posicion del 1ºVector
                lw $a0, 0($t0)
               
                add $t0, $a1, $t1       # Cargar posicion del 2ºVector
                lw $a1, 0($t0)
 
 
                addi $sp, $sp, -16      # Meto los vectores y el registro de salto en la pila
                sw $ra, 12($sp)
                sw $a2, 8($sp)
                sw $a1, 4($sp)
                sw $a0, 0($sp)
       
               
                addi $a2, $a2, -1     	# Resto un ciclo
 
               
                jal pescalar
       
                lw $a0, 0($sp)   		# Saco los vectores y el registro de salto de la pila
                lw $a1, 4($sp)
                lw $a2, 8($sp)
                lw $ra, 12($sp)
				addi $sp, $sp, 16
               
                mul $t9, $a0, $a1		# Hago el producto de los elementos y los sumo.
                add $v0, $v0, $t9
               
                jr $ra
