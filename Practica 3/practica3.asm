# Practica 3 Principios de Computadores
# Calcula la media aritmetica de 10 numeros de punto flotante en simple precisión.
# Autor: Samuel Ramos Barroso
			.data

cad2:		.asciiz "Introduzca un numero: \n"
cad3:		.asciiz "La media aritmetica de los números introduidos es: "
	
			.text
main:

	li.s $f4, 0.0 # Registro donde almacenamos la suma
	li $t0, 1
	
	
bucle:

	bgt $t0, 10, fin
	
	# Imprimo la cadena de caracteres que pide los numeros por pantalla
	li $v0, 4
	la $a0, cad2
	syscall
	
	# Leemos el número en punto flotante por la consola
	li	$v0, 6	     
	syscall
	mov.s $f20,$f0 # Muevo a $f20 el numero que leo por pantalla
	
	add.s $f4, $f4, $f20
	addi $t0, $t0, 1
	
	j bucle
	
fin:
	li.s $f8,10.0
	div.s $f6, $f4, $f8
	
	# Imprimimos la cadena de caracteres de la media
	li $v0, 4
	la $a0, cad3
	syscall
	
	mov.s $f12, $f6
	li $v0, 2
	syscall
	
	# Podemos cambiar de punto flotante simple a punto flotante doble con la instrucción: cvt.d.s Tendría que cambiar también las instrucciones
	# especificas para punto flotante y cambiar el .s por el .d como por ejemplo mov.s $f20,$f0 por mov.d $f20,$f0 también tendria que tener cuidado
	# con los registros ya que la precisión simple usa los registros pares de dos en dos como por ejemplo div.s $f6, $f3, $f7 no podría usar f6 y f7
	# ya que el punto flotante usaria la pareja (f6,f7) para almacenar los datos, por lo tanto es mejor usar solo los registros pares en formato simple
	
	li $v0, 10
    syscall
	
	