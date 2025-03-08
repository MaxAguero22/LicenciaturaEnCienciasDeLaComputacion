.ifndef BACKGROUND_S
BACKGROUND_S:

    .include "constants.s"

draw_background:
    	// Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp
    
    
    	movz x10, 0x20, lsl 16		// Color
    	movk x10, 0x2c3f, lsl 00

    	mov x2, SCREEN_HEIGHT    	// Y Size
loop1:
    	mov x1, SCREEN_WIDTH         	// X Size
loop0:
    	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4    // Siguiente pixel
	sub x1,x1,1    // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1    // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto


  	// Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret
     
.endif
