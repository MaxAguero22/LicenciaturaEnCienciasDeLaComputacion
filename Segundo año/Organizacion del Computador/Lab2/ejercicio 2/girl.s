.ifndef GIRL_S

GIRL_S:
    
    .include "constants.s"
    .include "codlinea.s"
   
draw_girl:
    // Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp

// inicio cabello parte mas oscura //

// color: 032138

draw_shirt:
        movz x10, 0x00, lsl 16
	    movk x10, 0x55a2, lsl 00

        mov x4, 391
        mov x3, 479
        mov x9, 404
        mov x2, 479
        bl line
    
        mov x4, 404
        mov x3, 472
        mov x9, 412
        mov x2, 479
        bl line

        mov x4, 412
        mov x3, 466
        mov x9, 425
        mov x2, 479
        bl line
    
        mov x4, 424
        mov x3, 459
        mov x9, 453
        mov x2, 479
        bl line

        mov x4, 445
        mov x3, 452
        mov x9, 453
        mov x2, 459
        bl line
    
        mov x4, 598
        mov x3, 446
        mov x9, 612
        mov x2, 453
        bl line

        mov x4, 606
        mov x3, 452
        mov x9, 633
        mov x2, 479
        bl line
    
        mov x4, 633
        mov x3, 459
        mov x9, 639
        mov x2, 479
        bl line

draw_hair:
        movz x10, 0x03, lsl 16
	    movk x10, 0x2138, lsl 00

        mov x4, 465 // COORDENADA X INICIAL
        mov x3, 271 // COORDENADA Y INICIAL
        mov x9, 551 // COORDENADA X FINAL
        mov x2, 286 // COORDENADA Y FINAL
        bl line 

        mov x4, 453
        mov x3, 286
        mov x9, 553
        mov x2, 317
        bl line

        mov x4, 553
        mov x3, 291
        mov x9, 565
        mov x2, 317
        bl line

        mov x4, 438
        mov x3, 317
        mov x9, 453
        mov x2, 384
        bl line

        mov x4, 453
        mov x3, 317
        mov x9, 566
        mov x2, 479
        bl line

        mov x4, 566
        mov x3, 338
        mov x9, 571
        mov x2, 372
        bl line

        mov x4, 566
        mov x3, 372
        mov x9, 578    /// cuadro 7
        mov x2, 384
        bl line

        mov x4, 566
        mov x3, 384
        mov x9, 585
        mov x2, 404
        bl line

        mov x4, 566
        mov x3, 403
        mov x9, 592
        mov x2, 479
        bl line

        
        mov x4, 592
        mov x3, 432
        mov x9, 598
        mov x2, 451
        bl line

        mov x4, 438
        mov x3, 384
        mov x9, 453
        mov x2, 399
        bl line

        mov x4, 445
        mov x3, 399
        mov x9, 453
        mov x2, 417
        bl line 

        mov x4, 589
        mov x3, 451 
        mov x9, 606
        mov x2, 479
        bl line

draw_detailshair:

        // color: 032c56
        movz x10, 0x03, lsl 16
	    movk x10, 0x2c56, lsl 00

        mov x4, 432
        mov x3, 311
        mov x9, 438
        mov x2, 344
        bl line

        mov x4, 438
        mov x3, 298
        mov x9, 445
        mov x2, 330
        bl line

        mov x4, 445
        mov x3, 285
        mov x9, 453
        mov x2, 317
        bl line

        mov x4, 452
        mov x3, 278
        mov x9, 458
        mov x2, 297
        bl line

        mov x4, 458
        mov x3, 271
        mov x9, 465
        mov x2, 290
        bl line

        mov x4, 465
        mov x3, 265
        mov x9, 472
        mov x2, 284
        bl line

        mov x4, 472
        mov x3, 258
        mov x9, 479
        mov x2, 277
        bl line

        mov x4, 479
        mov x3, 258
        mov x9, 538
        mov x2, 271
        bl line

        mov x4, 532
        mov x3, 265
        mov x9, 546
        mov x2, 277
        bl line

        mov x4, 546
        mov x3, 271
        mov x9, 552
        mov x2, 285
        bl line

        mov x4, 552
        mov x3, 278
        mov x9, 559
        mov x2, 291
        bl line

        mov x4, 559
        mov x3, 291
        mov x9, 565
        mov x2, 304
        bl line

        mov x4, 565
        mov x3, 305
        mov x9, 572
        mov x2, 338
        bl line

        mov x4, 571
        mov x3, 325
        mov x9, 578
        mov x2, 369
        bl line

        mov x4, 578
        mov x3, 358
        mov x9, 585
        mov x2, 384
        bl line

        mov x4, 585
        mov x3, 385
        mov x9, 592
        mov x2, 404
        bl line

        mov x4, 438
        mov x3, 411
        mov x9, 445
        mov x2, 479
        bl line
 
        // detalles que estan en la remera //
        mov x4, 413
        mov x3, 479
        mov x9, 431
        mov x2, 479

        mov x4, 432
        mov x3, 472
        mov x9, 438
        mov x2, 479

draw_detailsshirt:

        movz x10, 0x03, lsl 16
	    movk x10, 0x2138, lsl 00

        mov x4, 445
        mov x3, 472
        mov x9, 454
        mov x2, 479
        bl line

        movz x10, 0x00, lsl 16
        movk x10, 0x3257, lsl 00

        mov x4, 445
        mov x3, 466
        mov x9, 450
        mov x2, 472
        bl line

        mov x4, 606
        mov x3, 466
        mov x9, 613
        mov x2, 479
        bl line

        mov x4, 612
        mov x3, 472
        mov x9, 639
        mov x2, 479
        bl line


draw_hand:

        movz x10, 0x73, lsl 16
	    movk x10, 0x787e, lsl 00

        mov x4, 364
        mov x3, 465
        mov x9, 371
        mov x2, 479
        bl line

        mov x4, 371
        mov x3, 459
        mov x9, 379
        mov x2, 479
        bl line

        mov x4, 378
        mov x3, 452
        mov x9, 392
        mov x2, 479
        bl line

        mov x4, 385
        mov x3, 445
        mov x9, 399
        mov x2, 472
        bl line

        mov x4, 391
        mov x3, 439
        mov x9, 405
        mov x2, 458
        bl line

        mov x4, 398
        mov x3, 426
        mov x9, 412
        mov x2, 452
        bl line

        mov x4, 405
        mov x3, 419
        mov x9, 419
        mov x2, 445
        bl line

        mov x4, 411
        mov x3, 412
        mov x9, 425
        mov x2, 431
        bl line

        mov x4, 424
        mov x3, 405
        mov x9, 432
        mov x2, 418
        bl line

        mov x4, 431
        mov x3, 399
        mov x9, 445
        mov x2, 411
        bl line

        mov x4, 432
        mov x3, 352
        mov x9, 438
        mov x2, 411
        bl line

        mov x4, 445
        mov x3, 385
        mov x9, 451
        mov x2, 398
        bl line

draw_handdetail:

        movz x10, 0xc3, lsl 16
	    movk x10, 0xcad1, lsl 00

        mov x4, 351
        mov x3, 472
        mov x9, 357
        mov x2, 479
        bl line

        mov x4, 357
        mov x3, 458
        mov x9, 364
        mov x2, 479
        bl line

        mov x4, 364
        mov x3, 452
        mov x9, 371
        mov x2, 465
        bl line

        mov x4, 371
        mov x3, 445
        mov x9, 378
        mov x2, 459
        bl line

        mov x4, 378
        mov x3, 438
        mov x9, 385
        mov x2, 452
        bl line

        mov x4, 385
        mov x3, 432
        mov x9, 391
        mov x2, 445
        bl line

        mov x4, 391
        mov x3, 425
        mov x9, 398
        mov x2, 439
        bl line

        mov x4, 398
        mov x3, 418
        mov x9, 405
        mov x2, 426
        bl line

        mov x4, 404
        mov x3, 411
        mov x9, 411
        mov x2, 419
        bl line

        mov x4, 411
        mov x3, 405
        mov x9, 418
        mov x2, 412
        bl line

        mov x4, 418
        mov x3, 398
        mov x9, 424
        mov x2, 412
        bl line

        mov x4, 424
        mov x3, 351
        mov x9, 432
        mov x2, 405
        bl line

        mov x4, 431
        mov x3, 344
        mov x9, 438
        mov x2, 352
        bl line


   // Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret
     
.endif
