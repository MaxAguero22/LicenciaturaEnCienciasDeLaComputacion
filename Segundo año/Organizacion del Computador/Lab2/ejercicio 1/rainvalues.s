.ifndef RAINVALUES_S

RAINVALUES_S:

 	// Guardar el valor de LR en la pila
    	stp x29, x30, [sp, #-16]!
    	mov x29, sp
	
	.section .data

raindrops:

	// Primer columna de gotas	
	
	.word 22, 1, 96, 8       // (x1, y1, height1, width1)
        .word 36, 104, 46, 8     // (x2, y2, height2, width2)
        .word 2, 143, 101, 8     // (x3, y3, height3, width3)
        .word 49, 23, 53, 8
        .word 42, 224, 46, 8
        .word 16, 264, 60, 8
        .word 36, 271, 40, 8
        .word 42, 338, 40, 8
        .word 42, 338, 40, 8
        .word 16, 338, 40, 8
        .word 36, 164, 46, 8
        .word 29, 211, 26, 8
        // gotas cuadraditas
        .word 16, 391, 8, 8
        .word 29, 385, 8, 8
        .word 42, 391, 8, 8
        
        // Segunda columna
        
        .word 67, 0, 62, 8               
        .word 116, 0, 56, 8              
        .word 89, 50, 53, 8
        .word 110, 77, 53, 8
        .word 130, 10, 66, 8
        .word 130, 110, 60, 8
        .word 150, 50, 46, 8
        .word 143, 97, 26, 8
        .word 150, 130, 53, 8
        .word 83, 103, 47, 8
        .word 150, 0, 22, 8
        .word 170, 36, 32, 8
        .word 170, 103, 33, 8
        .word 177, 137, 66, 8
        .word 103, 130, 20, 8
        .word 69, 83, 20, 8
        .word 177, 3, 19, 8
        .word 89, 1, 9, 8
        .word 69, 150, 80, 8
        .word 96, 157, 26, 8
        
        // Fila de abajo
        
        .word 116, 192, 56, 8
        .word 89, 242, 53, 8    
        .word 110, 269, 53, 8
        .word 130, 202, 66, 8
        .word 130, 302, 60, 8
        .word 150, 242, 46, 8
        .word 143, 289, 26, 8
        .word 150, 322, 53, 8
        .word 83, 295, 47, 8
        .word 150, 192, 22, 8
        .word 170, 228, 32, 8
        .word 170, 295, 33, 8
        .word 177, 329, 66, 8
        .word 103, 322, 20, 8
        .word 69, 275, 20, 8
        .word 177, 195, 19, 8
        .word 89, 193, 9, 8
        .word 69, 342, 80, 8
        .word 96, 349, 26, 8
        // gotas cuadraditas
        .word 76, 398, 8, 8
        .word 89, 398, 8, 8
        .word 103, 385, 8, 8
        .word 116, 398, 8, 8
        .word 130, 392, 8, 8
        .word 143, 398, 8, 8
        .word 156, 385, 8, 8
        .word 177, 399, 8, 8
        
        // Tercer columna
        
        .word 195, 0, 62, 8
        .word 244, 0, 56, 8
        .word 217, 50, 53, 8
        .word 238, 77, 53, 8
        .word 258, 10, 66, 8
        .word 258, 110, 60, 8
        .word 278, 50, 46, 8
        .word 271, 97, 26, 8
        .word 278, 130, 53, 8
        .word 211, 103, 47, 8
        .word 278, 0, 22, 8
        .word 298, 36, 32, 8
        .word 298, 103, 33, 8
        .word 305, 137, 66, 8
        .word 231, 130, 20, 8
        .word 197, 83, 20, 8
        .word 305, 3, 19, 8
        .word 217, 1, 9, 8
        .word 197, 150, 80, 8
        .word 224, 157, 26, 8
        
        // Fila de abajo
        
        .word 244, 192, 56, 8
        .word 217, 242, 53, 8    
        .word 238, 269, 53, 8
        .word 258, 202, 66, 8
        .word 258, 302, 60, 8
        .word 278, 242, 46, 8
        .word 271, 289, 26, 8
        .word 278, 322, 53, 8
        .word 211, 295, 47, 8
        .word 278, 192, 22, 8
        .word 298, 228, 32, 8
        .word 298, 295, 33, 8
        .word 305, 329, 66, 8
        .word 231, 322, 20, 8
        .word 197, 275, 20, 8
        .word 305, 195, 19, 8
        .word 217, 193, 9, 8
        .word 197, 342, 80, 8
        .word 224, 349, 26, 8
        // gotas cuadraditas
        .word 203, 398, 8, 8
        .word 223, 385, 8, 8
        .word 237, 398, 8, 8
        .word 250, 392, 8, 8
        .word 264, 398, 8, 8
        .word 277, 385, 8, 8
        .word 291, 398, 8, 8
        
        // Cuarta columna
        
        .word 336, 0, 62, 8
        .word 385, 0, 56, 8
        .word 358, 50, 53, 8
        .word 379, 77, 53, 8
        .word 399, 10, 66, 8
        .word 399, 110, 60, 8
        .word 419, 50, 46, 8
        .word 412, 97, 26, 8
        .word 419, 130, 53, 8
        .word 352, 103, 47, 8
        .word 419, 0, 22, 8
        .word 439, 36, 32, 8
        .word 439, 103, 33, 8
        .word 446, 137, 66, 8
        .word 372, 130, 20, 8
        .word 338, 83, 20, 8
        .word 446, 3, 19, 8
        .word 358, 1, 9, 8
        .word 338, 150, 80, 8
        .word 365, 157, 26, 8
        
        // Fila de abajo
        
        .word 385, 192, 56, 8
        .word 358, 242, 53, 8    
        .word 379, 269, 53, 8
        .word 399, 202, 66, 8
        .word 399, 302, 60, 8
        .word 419, 242, 46, 8
        .word 412, 289, 26, 8
        .word 418, 322, 53, 8
        .word 352, 295, 47, 8
        .word 419, 192, 22, 8
        .word 439, 228, 32, 8
        .word 439, 295, 33, 8
        .word 446, 329, 66, 8
        .word 372, 322, 20, 8
        .word 338, 275, 20, 8
        .word 446, 195, 19, 8
        .word 351, 193, 9, 8
        .word 338, 342, 80, 8
        .word 365, 349, 26, 8
        // gotas cuadraditas
        .word 337, 398, 8, 8
        .word 354, 385, 8, 8
        .word 366, 398, 8, 8
        .word 381, 392, 8, 8
        .word 395, 398, 8, 8
        .word 407, 385, 8, 8
        
         // Quinta columna
         
        .word 463, 0, 62, 8
        .word 512, 0, 56, 8
        .word 485, 50, 53, 8
        .word 506, 77, 53, 8
        .word 526, 10, 66, 8
        .word 526, 110, 60, 8
        .word 546, 50, 46, 8
        .word 539, 97, 26, 8
        .word 546, 130, 53, 8
        .word 479, 103, 47, 8
        .word 546, 0, 22, 8
        .word 566, 36, 32, 8
        .word 566, 103, 33, 8
        .word 573, 137, 66, 8
        .word 499, 130, 20, 8
        .word 465, 83, 20, 8
        .word 573, 3, 19, 8
        .word 485, 1, 9, 8
        .word 465, 150, 80, 8
        .word 492, 157, 26, 8
        
        // Fila de abajo
        
        .word 512, 192, 56, 8
        .word 485, 242, 53, 8    
        .word 506, 269, 53, 8
        .word 526, 202, 66, 8
        .word 526, 302, 60, 8
        .word 546, 242, 46, 8
        .word 539, 289, 26, 8
        .word 545, 322, 53, 8
        .word 479, 295, 47, 8
        .word 546, 192, 22, 8
        .word 566, 228, 32, 8
        .word 566, 295, 33, 8
        .word 573, 329, 66, 8
        .word 499, 322, 20, 8
        .word 456, 275, 20, 8
        .word 573, 195, 19, 8
        .word 478, 193, 9, 8
        .word 465, 342, 80, 8
        .word 492, 349, 26, 8
        
         // Sexta columna
        
        .word 607, 1, 96, 8       
        .word 621, 104, 46, 8     
        .word 587, 143, 101, 8     
        .word 635, 23, 53, 8
        .word 627, 224, 46, 8
        .word 601, 264, 60, 8
        .word 621, 271, 40, 8
        .word 627, 338, 40, 8
        .word 627, 338, 40, 8
        .word 601, 338, 40, 8
        .word 621, 164, 46, 8
        .word 614, 211, 26, 8
        // gotas cuadraditas
        .word 604, 398, 8, 8
        .word 617, 385, 8, 8
        .word 627, 398, 8, 8
        

         // Restaurar el valor de LR desde la pila
    	ldp x29, x30, [sp], #16
    	ret

.endif
