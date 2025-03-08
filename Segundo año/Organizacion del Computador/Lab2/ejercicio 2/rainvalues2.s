.ifndef RAINVALUES2_S

RAINVALUES2_S:

 	// Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp
	
	.section .data

raindrops2:
        
        // Primer columna de gotas	
	
	.word 30, 0, 90, 8       // (x1, y1, height1, width1)
        .word 31, 109, 46, 8     // (x2, y2, height2, width2)
        .word 7, 137, 101, 8     // (x3, y3, height3, width3)
        .word 52, 12, 53, 8
        .word 39, 219, 46, 8
        .word 20, 268, 60, 8
        .word 38, 267, 40, 8
        .word 38, 334, 40, 8
        .word 12, 335, 40, 8
        .word 40, 168, 46, 8
        .word 32, 208, 26, 8
        // gotas cuadraditas
        .word 16, 385, 8, 8
        .word 29, 391, 8, 8
        .word 42, 385, 8, 8
        
        // Segunda columna
        
        .word 65, 2, 62, 8               
        .word 115, 3, 56, 8              
        .word 93, 40, 53, 8
        .word 115, 74, 53, 8
        .word 135, 15, 66, 8
        .word 125, 99, 60, 8
        .word 145, 55, 46, 8
        .word 139, 90, 30, 8
        .word 145, 130, 53, 8
        .word 90, 98, 47, 8
        .word 155, 4, 26, 8
        .word 165, 30, 32, 8
        .word 175, 98, 33, 8
        .word 172, 142, 66, 8
        .word 108, 125, 34, 8
        .word 64, 88, 25, 8
        .word 172, 8, 25, 8
        .word 84, 6, 19, 8
        .word 64, 146, 80, 8
        .word 100, 152, 30, 8
        
        // Fila de abajo
        
        .word 111, 197, 56, 8
        .word 94, 237, 53, 8    
        .word 115, 274, 53, 8
        .word 128, 195, 66, 8
        .word 135, 302, 60, 8
        .word 145, 247, 46, 8
        .word 148, 284, 26, 8
        .word 145, 327, 53, 8
        .word 88, 290, 47, 8
        .word 145, 197, 25, 8
        .word 165, 223, 32, 8
        .word 175, 290, 33, 8
        .word 172, 324, 66, 8
        .word 108, 327, 20, 8
        .word 74, 270, 20, 8
        .word 172, 190, 19, 8
        .word 84, 198, 18, 8
        .word 64, 342, 80, 8
        .word 94, 352, 30, 8
        // gotas cuadraditas
        .word 76, 385, 8, 8
        .word 89, 390, 8, 8
        .word 103, 398, 8, 8
        .word 116, 385, 8, 8
        .word 130, 395, 8, 8
        .word 143, 385, 8, 8
        .word 156, 398, 8, 8
        .word 177, 380, 8, 8

        
        
        // Tercer columna
        
        .word 200, 2, 62, 8
        .word 234, 1, 56, 8
        .word 212, 45, 53, 8
        .word 233, 72, 53, 8
        .word 263, 5, 66, 8
        .word 252, 115, 60, 8
        .word 282, 45, 46, 8
        .word 266, 102, 26, 8
        .word 283, 125, 53, 8
        .word 216, 98, 47, 8
        .word 283, 5, 22, 8
        .word 292, 31, 32, 8
        .word 292, 108, 33, 8
        .word 310, 132, 66, 8
        .word 236, 125, 32, 8
        .word 192, 88, 19, 8
        .word 300, 8, 25, 8
        .word 212, 6, 19, 8
        .word 192, 145, 80, 8
        .word 229, 151, 26, 8
        
        // Fila de abajo
        
        .word 249, 197, 56, 8
        .word 212, 247, 53, 8    
        .word 233, 264, 53, 8
        .word 263, 207, 66, 8
        .word 252, 297, 60, 8
        .word 272, 247, 46, 8
        .word 276, 284, 26, 8
        .word 273, 327, 53, 8
        .word 207, 290, 47, 8
        .word 272, 197, 22, 8
        .word 292, 222, 32, 8
        .word 303, 300, 33, 8
        .word 310, 324, 66, 8
        .word 236, 327, 20, 8
        .word 192, 270, 20, 8
        .word 300, 200, 19, 8
        .word 212, 198, 12, 8
        .word 202, 337, 80, 8
        .word 219, 353, 26, 8
        // gotas cuadraditas
        .word 203, 385, 8, 8
        .word 223, 398, 8, 8
        .word 237, 385, 8, 8
        .word 250, 382, 8, 8
        .word 264, 385, 8, 8
        .word 277, 398, 8, 8
        .word 291, 385, 8, 8
        
        // Cuarta columna
        
        .word 336, 0, 62, 8
        .word 377, 1, 56, 8
        .word 363, 35, 53, 8
        .word 374, 72, 53, 8
        .word 394, 15, 66, 8
        .word 394, 115, 60, 8
        .word 414, 55, 46, 8
        .word 407, 97, 36, 8
        .word 414, 135, 53, 8
        .word 357, 98, 47, 8
        .word 424, 5, 41, 8
        .word 443, 31, 32, 8
        .word 434, 108, 33, 8
        .word 441, 132, 66, 8
        .word 377, 135, 25, 8
        .word 332, 88, 30, 8
        .word 441, 8, 23, 8
        .word 352, 6, 20, 8
        .word 342, 145, 80, 8
        .word 360, 162, 26, 8
        
        // Fila de abajo
        
        .word 380, 197, 56, 8
        .word 352, 247, 53, 8    
        .word 374, 264, 53, 8
        .word 404, 197, 66, 8
        .word 394, 307, 60, 8
        .word 424, 237, 46, 8
        .word 417, 284, 26, 8
        .word 413, 327, 53, 8
        .word 357, 290, 47, 8
        .word 414, 187, 22, 8
        .word 444, 223, 32, 8
        .word 444, 290, 33, 8
        .word 450, 324, 66, 8
        .word 375, 317, 20, 8
        .word 333, 270, 20, 8
        .word 450, 190, 19, 8
        .word 356, 188, 14, 8
        .word 333, 347, 80, 8
        .word 360, 344, 30, 8
        // gotas cuadraditas
        .word 337, 385, 8, 8
        .word 354, 398, 8, 8
        .word 366, 385, 8, 8
        .word 381, 382, 8, 8
        .word 395, 385, 8, 8
        .word 407, 398, 8, 8
        
         // Quinta columna
         
        .word 475, 0, 62, 8
        .word 502, 1, 56, 8
        .word 480, 45, 53, 8
        .word 501, 72, 53, 8
        .word 531, 2, 66, 8
        .word 521, 114, 60, 8
        .word 541, 45, 46, 8
        .word 534, 102, 26, 8
        .word 541, 125, 53, 8
        .word 484, 108, 47, 8
        .word 541, 1, 22, 8
        .word 561, 41, 32, 8
        .word 570, 98, 33, 8
        .word 568, 142, 66, 8
        .word 494, 125, 20, 8
        .word 470, 78, 25, 8
        .word 568, 8, 19, 8
        .word 480, 6, 18, 8
        .word 470, 145, 80, 8
        .word 497, 152, 26, 8
        
        // Fila de abajo
        
        .word 517, 187, 56, 8
        .word 480, 247, 53, 8    
        .word 501, 274, 53, 8
        .word 521, 207, 66, 8
        .word 531, 307, 60, 8
        .word 541, 237, 46, 8
        .word 534, 284, 26, 8
        .word 550, 327, 53, 8
        .word 484, 291, 47, 8
        .word 550, 197, 22, 8
        .word 561, 233, 32, 8
        .word 561, 290, 33, 8
        .word 578, 324, 66, 8
        .word 493, 327, 20, 8
        .word 460, 280, 20, 8
        .word 568, 200, 19, 8
        .word 473, 198, 12, 8
        .word 470, 337, 80, 8
        .word 497, 344, 30, 8
        
         // Sexta columna
        
        .word 605, 0, 96, 8       
        .word 616, 99, 46, 8     
        .word 582, 148, 101, 8     
        .word 6, 28, 53, 8
        .word 622, 219, 46, 8
        .word 606, 259, 60, 8
        .word 626, 276, 40, 8
        .word 622, 343, 40, 8
        .word 633, 343, 40, 8
        .word 596, 333, 40, 8
        .word 626, 169, 46, 8
        .word 609, 216, 30, 8
        // gotas cuadraditas
        .word 604, 385, 8, 8
        .word 617, 398, 8, 8
        .word 627, 385, 8, 8
        
  	// Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret

.endif
