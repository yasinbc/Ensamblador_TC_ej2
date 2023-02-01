# FUNCION INTERPOLACION LINEAL
# Se declaran las variables con su valor
.data
	# Definición de mensajes a imprimir
	mensaje_inicial: .asciiz "              Bienbenido al programa \n"
	mensaje_inicial1: .asciiz " ----------------------------------------------- \n"
	num1: .asciiz "  Ingrese el valor de X que desea calcular Y: "
	num2: .asciiz "  Ingrese el valor de X1: "
	num3: .asciiz "  Ingrese el valor de Y1: "
	num4: .asciiz "  Ingrese el valor de X2: "
	num5: .asciiz "  Ingrese el valor de Y2: "
	resultado: .asciiz "  El valor de la coordenada Y es: "
	mensaje_final: .asciiz  "\n -----------El programa a terminado.------------\n"
	zeroAsFloat: .float 0.0 # Inicializacion del tipo de dato con coma flotante

.text

#cuerpo del prongrama
main:
	# Inicializa en $f1 la variable con coma flotante
	lwc1 $f1, zeroAsFloat

	# Impresión del mensaje inicial
	li $v0, 4		  # advierte que va a recibir el tipo de dato string en
	la $a0, mensaje_inicial1  # le pasa la variable con el string
	syscall			  # imprime en consola el mensaje

	li $v0, 4
	la $a0, mensaje_inicial
	syscall

	li $v0, 4
	la $a0, mensaje_inicial1
	syscall

	# Impresión del mensaje num1
	li $v0, 4
	la $a0, num1
	syscall

	#Ingreso por teclado del primer número (X)
	li $v0, 6
	syscall
	add.s $f2, $f0, $f1 # Suma el valor de $f0 + $f1 y lo añade al espacio en memori $f2

	#Impresión del mensaje num2
	li $v0, 4
	la $a0, num2
	syscall

	#Ingreso por teclado del segundo número (X1)
	li $v0, 6
	syscall
	add.s $f3, $f0, $f1 # Suma el valor de $f0 + $f1 y lo añade al espacio en memori $f3

	#Impresión del mensaje num3
	li $v0, 4
	la $a0, num3
	syscall

	#Ingreso por teclado del tercer número (Y1)
	li $v0, 6
	syscall 
	add.s $f4, $f0, $f1 # Suma el valor de $f0 + $f1 y lo añade al espacio en memori $f4

	#Impresión del mensaje num4
	li $v0, 4
	la $a0, num4
	syscall

	#Ingreso por teclado del cuarto número (X2)
	li $v0, 6
	syscall 
	add.s $f5, $f0, $f1 # Suma el valor de $f0 + $f1 y lo añade al espacio en memori $f5

	#Impresión del mensaje num5
	li $v0, 4
	la $a0, num5
	syscall

	#Ingreso por teclado del quinto número (Y2)
	li $v0, 6
	syscall 
	add.s $f6, $f0, $f1 # Suma el valor de $f0 + $f1 y lo añade al espacio en memori $f6

	#Resta X - X1
	sub.s $f7, $f2, $f3 # Resta el valor de $f2 - $f3 y lo almacena en $f7

	#Resta X2 - X1
	sub.s $f8, $f5, $f3 # Resta el valor de $f5 - $f3 y lo almacena en $f6

	#Dividide $f7 / $f8
	div.s $f9, $f7, $f8 # Divide el valor de $f7 / $f8 y lo almacena en $f9

	#Resta Y2 - Y1
	sub.s $f10, $f6, $f4 # Resta el valor de $f6 - $f4 y lo almacena en $f10

	#Multiplica $f9 * $f10
	mul.s $f11, $f9, $f10 # Multiplica el valor de $f9 * $f10 y lo almacena en $f11

	#Suma $f11 + Y1
	add.s $f13, $f11, $f4 # Suma el valor de $f11 + $f4 y lo almacena en $f13

	#Impresión del mensaje inicial1
	li $v0, 4
	la $a0, mensaje_inicial1
	syscall

	#Impresión del mensaje resultado
	li $v0, 4
	la $a0, resultado
	syscall

	#Impresión del resultado
	li $v0, 2
	add.s $f12, $f13, $f1 # Suma el valor de $f13 + $f1 y lo almacena en $f12 que es el que almacena el RESULTADO FINAL
	syscall

	#Impresión del mensaje final
	li $v0, 4
	la $a0, mensaje_final
	syscall

	#Finaliza el programa
	li $v0, 10
	syscall
