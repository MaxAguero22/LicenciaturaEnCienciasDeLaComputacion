.ifndef CODLINEA_S

CODLINEA_S:

	.include "constants.s"
	
line:

    	// Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp
    	mov x0, x20
		mov x8, 0
		sub x8, x9, x4

loop2:
		mov x5, SCREEN_WIDTH    // x5= 640
		mul x6, x3, x5          // x6 = y*640
		add x6, x4, x6          // x6 = x+(y*640)
		lsl x6, x6, 2           // x6 = 4*(x+(y*640))
		add x6, x20, x6         // x6 = direccion del framebuffer + x6
    	add x0, xzr, x6         // guardo en x0 la posicion del pixel
    	stur w10, [x0]          // coloreo el pixel de la posicion que calcule
    	add x4, x4, 1           // sumo uno para x
    	cmp x4, x9              // comparo si es hasta donde quiero llegar 
    	b.lt loop2              // vuelvo al loop si no he llegado
    	sub x4, x4, x8          // vuelvo a la coordenada x inicial que quiero colorear
    	add x3, x3, 1           // bajo una fila en la coordenada y
    	cmp x3, x2 
    	b.lt loop2

  	// Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret

.endif
