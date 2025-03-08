.ifndef TREES_S
TREES_S:
    .include "constants.s"
    .include "rectangle.s"

draw_trees:

    // Guardar el valor de LR
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    //=======================================================================
    // 		DIBUJAR ÁRBOL	
    //=======================================================================

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 0                  // Coordenada X inicial (ancho)
    mov x2, 125                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle




    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 15                  // Coordenada X inicial (ancho)
    mov x2, 133                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle


    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 21                  // Coordenada X inicial (ancho)
    mov x2, 140                // Coordenada Y inicial (alto)
    

    // Dibujar rectángulo
    bl draw_rectangle
    

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 27                  // Coordenada X inicial (ancho)
    mov x2, 179                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle


    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 33                  // Coordenada X inicial (ancho)
    mov x2, 166                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle


    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 39                  // Coordenada X inicial (ancho)
    mov x2, 146                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle



    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 40                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 45                  // Coordenada X inicial (ancho)
    mov x2, 139                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle



    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 7                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 85                  // Coordenada X inicial (ancho)
    mov x2, 152                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle

    

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 92                  // Coordenada X inicial (ancho)
    mov x2, 167                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 107                  // Coordenada X inicial (ancho)
    mov x2, 173                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 113                  // Coordenada X inicial (ancho)
    mov x2, 185                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 20                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 118                  // Coordenada X inicial (ancho)
    mov x2, 185                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 138                  // Coordenada X inicial (ancho)
    mov x2, 173                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 168                  // Coordenada X inicial (ancho)
    mov x2, 173                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle

    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 174                  // Coordenada X inicial (ancho)
    mov x2, 193                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 180                  // Coordenada X inicial (ancho)
    mov x2, 208                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 9                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 186                  // Coordenada X inicial (ancho)
    mov x2, 218                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 195                  // Coordenada X inicial (ancho)
    mov x2, 222                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 205                  // Coordenada X inicial (ancho)
    mov x2, 229                // Coordenada Y inicial (alto)

    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 215                  // Coordenada X inicial (ancho)
    mov x2, 239                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 225                  // Coordenada X inicial (ancho)
    mov x2, 245                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 235                  // Coordenada X inicial (ancho)
    mov x2, 250                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 245                  // Coordenada X inicial (ancho)
    mov x2, 255                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 255                  // Coordenada X inicial (ancho)
    mov x2, 262                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 265                  // Coordenada X inicial (ancho)
    mov x2, 239                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 275                  // Coordenada X inicial (ancho)
    mov x2, 229                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 40                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 285                  // Coordenada X inicial (ancho)
    mov x2, 223                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 325                  // Coordenada X inicial (ancho)
    mov x2, 253                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 335                  // Coordenada X inicial (ancho)
    mov x2, 280                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 345                  // Coordenada X inicial (ancho)
    mov x2, 260                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 355                  // Coordenada X inicial (ancho)
    mov x2, 250                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 365                  // Coordenada X inicial (ancho)
    mov x2, 240                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 345                  // Coordenada X inicial (ancho)
    mov x2, 260                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 375                  // Coordenada X inicial (ancho)
    mov x2, 210                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 390                  // Coordenada X inicial (ancho)
    mov x2, 200                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 420                  // Coordenada X inicial (ancho)
    mov x2, 193                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 435                  // Coordenada X inicial (ancho)
    mov x2, 190                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 450                  // Coordenada X inicial (ancho)
    mov x2, 210                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 450                  // Coordenada X inicial (ancho)
    mov x2, 190                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 460                  // Coordenada X inicial (ancho)
    mov x2, 180                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 17                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 470                  // Coordenada X inicial (ancho)
    mov x2, 173                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 13                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 487                  // Coordenada X inicial (ancho)
    mov x2, 166                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    //final de arboles verdes LARGO
    
    
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 9                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 480                  // Coordenada X inicial (ancho)
    mov x2, 170                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 489                  // Coordenada X inicial (ancho)
    mov x2, 179                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 7                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 504                  // Coordenada X inicial (ancho)
    mov x2, 183                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 7                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 511                  // Coordenada X inicial (ancho)
    mov x2, 182                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    
    //comienzo arboles azules LARGO
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 511                  // Coordenada X inicial (ancho)
    mov x2, 200                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 526                  // Coordenada X inicial (ancho)
    mov x2, 182                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 9                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 541                  // Coordenada X inicial (ancho)
    mov x2, 170                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 550                  // Coordenada X inicial (ancho)
    mov x2, 153                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 556                  // Coordenada X inicial (ancho)
    mov x2, 142                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 7                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 571                  // Coordenada X inicial (ancho)
    mov x2, 142                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 578                  // Coordenada X inicial (ancho)
    mov x2, 133                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 584                  // Coordenada X inicial (ancho)
    mov x2, 122                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 590                  // Coordenada X inicial (ancho)
    mov x2, 110                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 6                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 596                  // Coordenada X inicial (ancho)
    mov x2, 97                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 9                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 602                  // Coordenada X inicial (ancho)
    mov x2, 75                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 11                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 609                  // Coordenada X inicial (ancho)
    mov x2, 66                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 11                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 620                  // Coordenada X inicial (ancho)
    mov x2, 50                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 11                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 631                  // Coordenada X inicial (ancho)
    mov x2, 39                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 500                  // Coordenada X inicial (ancho)
    mov x2, 400                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 530                  // Coordenada X inicial (ancho)
    mov x2, 375                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 30                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 560                  // Coordenada X inicial (ancho)
    mov x2, 350                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 5                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 590                  // Coordenada X inicial (ancho)
    mov x2, 327                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 5                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 595                  // Coordenada X inicial (ancho)
    mov x2, 310                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 9                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 600                  // Coordenada X inicial (ancho)
    mov x2, 300                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 15                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 609                  // Coordenada X inicial (ancho)
    mov x2, 311                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 7                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 624                  // Coordenada X inicial (ancho)
    mov x2, 300                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 8                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF05, lsl 16    // Parte alta del color: 0xFF050000
    movk x5, 0x1E2C, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 631                  // Coordenada X inicial (ancho)
    mov x2, 290                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    
    
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 27                  // Coordenada X inicial (ancho)
    mov x2, 190                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 37                  // Coordenada X inicial (ancho)
    mov x2, 200                // Coordenada Y inicial (alto)
    
    // Dibujar rectángulo
    bl draw_rectangle
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 47                  // Coordenada X inicial (ancho)
    mov x2, 207                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    mov x12, SCREEN_WIDTH      // Ancho de la pantalla en registro x12
    mov x13, SCREEN_HEIGHT     // Altura de la pantalla en registro x13
    mov x4, 500                // Tamaño de alto del rectángulo 
    mov x8, 10                // Tamaño de ancho del rectángulo 
    movz x5, 0xFF02, lsl 16    // Parte alta del color: 0xFF020000
    movk x5, 0x1626, lsl 0
    //parámetros para dibujar el rectángulo
    sub x7, x12, x8            // (SCREEN_WIDTH - x8)  cantidad de píxeles en el eje X para dibujar el rectángulo.
    lsl x7, x7, #2             // Multiplicar por 4 (bytes por píxel) cantidad de bytes que hay que desplazar hasta rectangulo
    mov x1, 57                  // Coordenada X inicial (ancho)
    mov x2, 350                // Coordenada Y inicial (alto)
    // Dibujar rectángulo
    bl draw_rectangle
    
    

    // Restaurar el valor de LR
    ldp x29, x30, [sp], #16
    ret

.endif
