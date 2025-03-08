.ifndef HOUSE_S
HOUSE_S:

    .include "constants.s"
    .include "rectangle.s"

draw_house:

    // Guardar el valor de LR en la pila
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    
    //=======================================================================
    // 		DIBUJAR RECTANGULO PRINCIPAL	
    //=======================================================================

    mov x4, 72         		// Tamaño de alto
    mov x8, 242        		// Tamaño de ancho
    mov x1, 398        		// Coordenada X (ancho)
    mov x2, 138        		// Coordenada Y (alto)
    movz x5, 0x0f, lsl 16    	// Color
    movk x5, 0x101c, lsl 00
    mov x7, 1592  		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle
    
    //=======================================================================
    // 		DIBUJAR TECHO INFERIOR	
    //=======================================================================

    mov x4, 74         // Altura del techo
    mov x1, 471        // Coordenada x (ancho)
    mov x2, 64         // Coordenada y (alto)

    movz x5, 0x0f, lsl 16 	// Color
    movk x5, 0x101c, lsl 0

    // Calcular la dirección del píxel en el framebuffer
    mov x0, x20                      // Dirección base del framebuffer
    mov x12, SCREEN_WIDTH            // Ancho de la pantalla
    mul x6, x2, x12                  // Multiplica la coordenada y por el ancho de la pantalla
    add x6, x6, x1                   // Añade la coordenada x 
    lsl x6, x6, #2                   // (multiplicada por 4, bytes por píxel)
    add x0, x6, x0                   // Añade la dirección base del framebuffer

    mov x3, 169                      // Ancho inicial del triángulo
    mov x14, SCREEN_WIDTH * 4        // Cantidad de bytes para avanzar una fila en el framebuffer

draw_ceiling:
    mov x13, x3                      // Ancho actual de la fila del triángulo
    mov x7, x0                       // Guardar la posición inicial de la fila
draw_row_t:
    str w5, [x0]                     // Colorear el píxel
    dmb ishst                      // Data Memory Barrier
    add x0, x0, 4                    // Siguiente píxel
    sub x13, x13, 1                  // Decrementar contador de píxeles en la fila
    cbnz x13, draw_row_t             // Si no terminó la fila, saltar
    
    add x3, x3, 1                    // Incrementar el ancho para la siguiente fila
    add x7, x7, x14                  // Mover a la siguiente fila en el framebuffer
    sub x7, x7, 4                    // Retroceder un píxel (4 bytes) al inicio de la nueva fila
    mov x0, x7                       // Actualizar x0 a la nueva posición
    sub x4, x4, 1                    // Decrementar contador de filas
    cbnz x4, draw_ceiling            // Si no es la última fila, saltar
    
    //=======================================================================
    // 		DIBUJAR TECHO SUPERIOR 	
    //=======================================================================
    
    movz x5, 0x07, lsl 16 	// Color
    movk x5, 0x0c19, lsl 00
  
    
    //======================== TEJA INICIAL ===============================//
    
    mov x1, 467      		// Coordenada x (ancho)
    mov x2, 60        		// Coordenada y (alto) 
    mov x4, 7         		// Tamaño alto
    mov x8, 52       		// Tamaño ancho
    mov x7, 2352		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle
    
    //======================== TEJAS INFERIORES IZQ ============================//


    mov x9, 11
tejas_izq:
    sub x1, x1, 7 // Retrocedo 7 de ancho
    add x2, x2, 7 // Bajo 7 de alto
    mov x4, 7     // Tamaño alto de la teja
    mov x8, 14    // Tamaño ancho de la teja
    mov x7, 2504  // Largo a saltear de tejas individuales
    bl draw_rectangle

    sub x9, x9, 1 // Decrementa el contador
    cbnz x9, tejas_izq

    //======================== TEJAS INFERIORES DER ============================//

    mov x1, 484      		// Coordenada x (ancho)
    mov x2, 63        		// Coordenada y (alto) 
    mov x4, 10         		// Tamaño alto
    mov x8, 156       		// Tamaño ancho
    mov x7, 1936		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x9, 11

tejas_der:
    add x1, x1, 7  // Avanzo 7 de ancho
    add x2, x2, 7  // Bajo 7 de alto
    mov x4, 7      // Tamaño alto de la teja
    sub x8, x8, 7  // Tamaño ancho de la teja
    add x7, x7, (7*4)
    bl draw_rectangle

    sub x9, x9, 1 // Decrementa el contador
    cbnz x9, tejas_der


    //=======================================================================
    // 		DIBUJAR VENTANAS 	
    //=======================================================================

    movz x5, 0x1b, lsl 16 	// Color
    movk x5, 0x2333, lsl 00

    mov x1, 425      		// Coordenada x (ancho)
    mov x2, 130        		// Coordenada y (alto) 
    mov x4, 7         		// Tamaño alto
    mov x8, 27       		// Tamaño ancho
    mov x7, 2452		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle
    
    mov x1, 418      		// Coordenada x (ancho)
    mov x2, 137        		// Coordenada y (alto) 
    mov x4, 14         		// Tamaño alto
    mov x8, 34        		// Tamaño ancho
    mov x7, 2424		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x1, 418      		// Coordenada x (ancho)
    mov x2, 157        		// Coordenada y (alto) 
    mov x4, 21         		// Tamaño alto
    mov x8, 14        		// Tamaño ancho
    mov x7, 2504		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x1, 438      		// Coordenada x (ancho)
    mov x2, 157        		// Coordenada y (alto) 
    mov x4, 21         		// Tamaño alto
    mov x8, 14        		// Tamaño ancho
    mov x7, 2504		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x1, 472      		// Coordenada x (ancho)
    mov x2, 130        		// Coordenada y (alto) 
    mov x4, 21         		// Tamaño alto
    mov x8, 28        		// Tamaño ancho
    mov x7, 2448		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x1, 507      		// Coordenada x (ancho)
    mov x2, 130        		// Coordenada y (alto) 
    mov x4, 21         		// Tamaño alto
    mov x8, 21        		// Tamaño ancho
    mov x7, 2476		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x1, 472      		// Coordenada x (ancho)
    mov x2, 157        		// Coordenada y (alto) 
    mov x4, 14         		// Tamaño alto
    mov x8, 28        		// Tamaño ancho
    mov x7, 2448		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle

    mov x1, 507      		// Coordenada x (ancho)
    mov x2, 157        		// Coordenada y (alto) 
    mov x4, 14         		// Tamaño alto
    mov x8, 21        		// Tamaño ancho
    mov x7, 2476		// Pixeles a saltear para la siguiente fila
    bl draw_rectangle


    // Restaurar el valor de LR desde la pila
    ldp x29, x30, [sp], #16
    ret
     
.endif
