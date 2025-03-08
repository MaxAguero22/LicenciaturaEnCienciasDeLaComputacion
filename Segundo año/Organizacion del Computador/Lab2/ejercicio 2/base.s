.ifndef BASE_s
BASE_S:

    .include "constants.s"
    .include "rectangle.s"

draw_base:
    	// Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp
    
        // Parte alta de la base
    	mov x4, 55         		// Tamaño de alto
   	mov x8, 640        		// Tamaño de ancho
   	mov x1, 0        		// Coordenada X (ancho)
    	mov x2, 419        		// Coordenada Y (alto)
    	movz x5, 0x11, lsl 16    	// Color
    	movk x5, 0x1923, lsl 00
    	mov x7, 0  		// Pixeles a saltear para la siguiente fila
    	bl draw_rectangle
    	
    	// Parte baja de la base
    	mov x4, 22         		// Tamaño de alto
   	mov x8, 640        		// Tamaño de ancho
   	mov x1, 0        		// Coordenada X (ancho)
    	mov x2, 459        		// Coordenada Y (alto)
    	movz x5, 0x03, lsl 16    	// Color
    	movk x5, 0x1b31, lsl 00
    	mov x7, 0  		// Pixeles a saltear para la siguiente fila
    	bl draw_rectangle
    	


  	// Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret
     
.endif

