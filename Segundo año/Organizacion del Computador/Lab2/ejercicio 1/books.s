.ifndef BOOKS_S

BOOKS_S:

    .include "constants.s"
    .include "codlinea.s"

draw_books:
        // Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp

draw_red:

        movz x10, 0x50, lsl 16
        movk x10, 0x0f1c, lsl 00

        mov x4, 0
        mov x3, 472
        mov x9, 43
        mov x2, 479
        bl line

        mov x4, 43
        mov x3, 466
        mov x9, 49
        mov x2, 479
        bl line

        mov x4, 49
        mov x3, 458
        mov x9, 62
        mov x2, 472
        bl line

        mov x4, 62
        mov x3, 452
        mov x9, 76
        mov x2, 465
        bl line

        mov x4, 43
        mov x3, 452
        mov x9, 62
        mov x2, 458
        bl line

        mov x4, 63
        mov x3, 446
        mov x9, 82
        mov x2, 452
        bl line

        mov x4, 76
        mov x3, 432
        mov x9, 82
        mov x2, 438
        bl line

draw_purple:

        movz x10, 0x26, lsl 16
        movk x10, 0x0c2b, lsl 00

        mov x4, 0
        mov x3, 479
        mov x9, 35
        mov x2, 479
        bl line

        mov x4, 62
        mov x3, 465
        mov x9, 69
        mov x2, 472
        bl line

        mov x4, 69
        mov x3, 459
        mov x9, 89
        mov x2, 465
        bl line


draw_blue:

        movz x10, 0x0d, lsl 16
        movk x10, 0x1d41, lsl 00

        mov x4, 1
        mov x3, 452
        mov x9, 42
        mov x2, 458
        bl line

        mov x4, 0
        mov x3, 405
        mov x9, 62
        mov x2, 452
        bl line

        mov x4, 2
        mov x3, 399
        mov x9, 49
        mov x2, 405
        bl line

        mov x4, 62
        mov x3, 439
        mov x9, 82
        mov x2, 445
        bl line

        mov x4, 62
        mov x3, 405
        mov x9, 69
        mov x2, 418
        bl line

        mov x4, 69
        mov x3, 412
        mov x9, 81
        mov x2, 418
        bl line

        mov x4, 82
        mov x3, 412
        mov x9, 82
        mov x2, 414
        bl line


draw_graydetails:

        movz x10, 0x97, lsl 16
        movk x10, 0x8f82, lsl 00

        mov x4, 63
        mov x3, 416
        mov x9, 76
        mov x2, 438
        bl line

        mov x4, 42
        mov x3, 425
        mov x9, 63
        mov x2, 438
        bl line

        mov x4, 29
        mov x3, 432
        mov x9, 56
        mov x2, 445
        bl line

        mov x4, 22
        mov x3, 438
        mov x9, 42
        mov x2, 450
        bl line

        mov x4, 0
        mov x3, 452
        mov x9, 1
        mov x2, 459
        bl line

        mov x4, 0
        mov x3, 458
        mov x9, 43
        mov x2, 472
        bl line

        mov x4, 40
        mov x3, 457
        mov x9, 50
        mov x2, 466
        bl line

        mov x4, 49
        mov x3, 472
        mov x9, 69
        mov x2, 479
        bl line

        mov x4, 69
        mov x3, 465
        mov x9, 83
        mov x2, 479
        bl line

        mov x4, 36
        mov x3, 479
        mov x9, 49
        mov x2, 479
        bl line

        mov x4, 0
        mov x3, 479
        mov x9, 37
        mov x2, 479

   // Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret
     
.endif
