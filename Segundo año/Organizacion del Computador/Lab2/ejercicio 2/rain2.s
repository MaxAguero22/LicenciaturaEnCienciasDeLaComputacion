.ifndef RAIN2_S

RAIN2_S:

    	.include "constants.s"
    	.include "rectangle.s"
    	.include "rainvalues2.s"
    
draw_rain2:
	
	stp x29, x30, [sp, #-16]!	// Guardar el valor de LR en la pila
    	mov x29, sp
	
    	
    
    	ldr x9, =raindrops2   		// Puntero a la estructura de gotas
				
    	adrp x9, raindrops2  		// Inicializar puntero a la estructura de gotas de lluvia
    	add x9, x9, :lo12:raindrops2	// Cargar la dirección base de la estructura

    	mov x10, 206			// Número de gotas de lluvia

draw_rain2_loop:
    	// Cargar las coordenadas y tamaños de la siguiente gota de lluvia
    	ldr w1, [x9], #4  // Cargar x1 y avanzar el puntero
    	ldr w2, [x9], #4  // Cargar y1 y avanzar el puntero
    	ldr w4, [x9], #4  // Cargar height y avanzar el puntero
    	ldr w8, [x9], #4  // Cargar width y avanzar el puntero

    	// Calcular el salto de bytes para la siguiente fila
    	mov x7, SCREEN_WIDTH
    	sub x7, x7, x8 
    	lsl x7, x7, #2

    	// Dibujar el rectángulo (gota de lluvia)
    	bl draw_rectangle

    	// Decrementar el contador y repetir si es necesario
    	subs x10, x10, #1
    	bne draw_rain2_loop
    	
    	// Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret

.endif
