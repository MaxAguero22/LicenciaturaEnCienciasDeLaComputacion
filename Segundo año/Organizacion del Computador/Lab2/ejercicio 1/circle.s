.ifndef CIRCLE_S

CIRCLE_S:

    .include "constants.s"

draw_circle:
    // Guardar el valor de LR en la pila
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Guardar registros utilizados en la pila
    sub sp, sp, #48
    str x0, [sp, #8]
    str x1, [sp, #16]
    str x2, [sp, #24]
    str x3, [sp, #32]
    str x4, [sp, #40]

    // Asignar los parámetros a registros específicos
    // x0: dirección del buffer
    // x1: h (coordenada X del centro del círculo)
    // x2: k (coordenada Y del centro del círculo)
    // x3: r (radio del círculo)
    // x4: color (color del píxel)

    // Inicialización de coordenadas
    sub x5, x1, x3         // x_min = h - r
    add x6, x1, x3         // x_max = h + r
    sub x7, x2, x3         // y_min = k - r
    add x8, x2, x3         // y_max = k + r

    // Inicialización del bucle
    mov x9, x7             // y = y_min

draw_circle_loop_y:
    mov x10, x5            // x = x_min

draw_circle_loop_x:
    // Calcular (x-h)² + (y-k)²
    sub x11, x10, x1       // (x-h)
    sub x12, x9, x2        // (y-k)
    mul x11, x11, x11      // (x-h)²
    mul x12, x12, x12      // (y-k)²
    add x13, x11, x12      // (x-h)² + (y-k)²
    mul x14, x3, x3        // r²

    // Comparar (x-h)² + (y-k)² con r²
    cmp x13, x14
    b.gt skip_pixel        // Si (x-h)² + (y-k)² > r², saltar el píxel

    // Calcular la dirección del píxel en el buffer y colorear
    mov x15, x10
    mov x16, x9
    mov x18, SCREEN_WIDTH
    mul x16, x16, x18
    add x16, x16, x15
    lsl x16, x16, #2
    add x17, x0, x16
    str w4, [x17]

skip_pixel:
    add x10, x10, #1       // x++
    cmp x10, x6            // x_max
    ble draw_circle_loop_x

    add x9, x9, #1         // y++
    cmp x9, x8             // y_max
    ble draw_circle_loop_y

    // Restaurar registros desde la pila
    ldr x0, [sp, #8]
    ldr x1, [sp, #16]
    ldr x2, [sp, #24]
    ldr x3, [sp, #32]
    ldr x4, [sp, #40]
    add sp, sp, #48

    // Restaurar el valor de LR desde la pila
    ldp x29, x30, [sp], #16
    ret

.endif
