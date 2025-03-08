.ifndef MOON_S

MOON_S:

	.include "constants.s"
	.include "circle.s"
	
draw_moon:

    	// Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp

    	// Asignar los parámetros a registros específicos
        // x0: buffer_address (dirección del buffer)
    	// x1: h (coordenada X del centro del círculo)
    	// x2: k (coordenada Y del centro del círculo)
    	// x3: r (radio del círculo)
    	// x4: color (color del píxel)
    	
    	mov x0, x20
    	mov x1, 253
    	mov x2, 73
    	mov x3, 51
    	movz x4, 0xc2, lsl 16		// Color
    	movk x4, 0xc3c7, lsl 00
    	bl draw_circle
    	// luna gris
    	
    	mov x0, x20
    	mov x1, 253
    	mov x2, 73
    	mov x3, 49
    	movz x4, 0xc2, lsl 16 	// Color
    	movk x4, 0xc3c7, lsl 0
    	bl draw_circle
    	// luna principal
    	
    	mov x0, x20
    	mov x1, 270
    	mov x2, 68
    	mov x3, 49
    	movz x4, 0xc2, lsl 16		// Color
    	movk x4, 0xc3c7, lsl 00
    	bl draw_circle
    	// sombra más clarita
    	
    	mov x0, x20
    	mov x1, 275
    	mov x2, 67
    	mov x3, 50
    	movz x4, 0x6d, lsl 16		// Color
    	movk x4, 0x6e73, lsl 00
    	bl draw_circle
    	// sombra mediana
    	
    	mov x0, x20
    	mov x1, 282
    	mov x2, 64
    	mov x3, 52
    	movz x4, 0x59, lsl 16		// Color
    	movk x4, 0x5959, lsl 00
    	bl draw_circle
    	// sombra más oscura
    	
    	mov x0, x20
    	mov x1, 295
    	mov x2, 60
    	mov x3, 60
    	movz x4, 0x20, lsl 16		// Color
    	movk x4, 0x2c3f, lsl 00
    	bl draw_circle
    	// circulo del color del fondo para simular medialuna

    	// Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret

.endif
