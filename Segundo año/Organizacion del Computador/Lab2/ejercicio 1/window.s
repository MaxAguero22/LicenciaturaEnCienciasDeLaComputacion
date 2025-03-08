.ifndef WINDOW_S

WINDOW_S:

	.include "constants.s"
    .include "codlinea.s"

draw_windowv: 

        // Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp

        movz x10, 0x00, lsl 16
	    movk x10, 0x0000, lsl 00

        mov x2, 419

	    mov x4, 56
        mov x3, 0
        mov x9, 62
        bl line 

        mov x4, 183
        mov x3, 0
        mov x9, 190
        bl line 

        mov x4, 311
        mov x3, 0
        mov x9, 330
        bl line 

        mov x4, 451
        mov x3, 0
        mov x9, 458
        bl line 

        mov x4, 579
        mov x3, 0
        mov x9, 585
        bl line 

draw_windowh:
        mov x4, 0
        mov x3, 184
        mov x9, 639
        mov x2, 197
        bl line 

        mov x4, 0    // COORDENADA X INICIAL
        mov x3, 405  // COORDENADA Y INICIAL
        mov x9, 639  // COORDENADA X FINAL
        mov x2, 420  // COORDENADA Y FINAL
        bl line 

draw_details:

        mov x4, 103
        mov x3, 177
        mov x9, 149
        mov x2, 184
        bl line 

        mov x4, 498
        mov x3, 177
        mov x9, 542
        mov x2, 184
        bl line 

        // Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret
     
.endif
