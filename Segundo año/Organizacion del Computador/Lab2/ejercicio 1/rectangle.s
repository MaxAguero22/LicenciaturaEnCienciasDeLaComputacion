.ifndef RECTANGLE_S

RECTANGLE_S:

    .include "constants.s"
	
draw_rectangle:


    // Guardar el valor de LR en la pila
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Calcular la dirección del píxel en el framebuffer
    mov x0, x20			// Restauramos framebuffer
    mov x12, SCREEN_WIDTH
    mul x6, x2, x12             // Multiplica la coordenada y por el ancho de la pantalla
    add x6, x6, x1              // Añade la coordenada x 
    lsl x6, x6, #2              // (multiplicada por 4, bytes por píxel)
    add x0, x6, x0              // Añade la dirección base del framebuffer

draw_rect:
    mov x3, x8         		// X Size
draw_row:
    str w5, [x0]                // Colorear el píxel N
    dmb ishst                   // Data Memory Barrier
    add x0, x0, 4               // Siguiente píxel
    sub x3, x3, 1               // Decrementar contador X
    cbnz x3, draw_row           // Si no terminó la fila, salto
    add x0, x0, x7              // le sumo 398 píxeles de ancho
    sub x4, x4, 1               // Decrementar contador Y
    cbnz x4, draw_rect          // Si no es la última fila, salto


    // Restaurar el valor de LR desde la pila
    ldp x29, x30, [sp], #16
    ret

.endif
