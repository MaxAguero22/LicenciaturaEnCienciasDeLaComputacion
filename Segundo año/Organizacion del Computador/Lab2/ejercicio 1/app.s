	.include "house.s"
	.include "constants.s"
	.include "background.s"
	.include "base.s"
	.include "trees.s"
	.include "moon.s"
	.include "circle.s"
    	.include "codlinea.s"
    	.include "window.s"
    	.include "girl.s"
    	.include "books.s"
    	.include "rain.s"

	.globl main
main:

   	// x0 contiene la dirección base del framebuffer
   	// Guarda la dirección base del framebuffer en x20
   	mov x20, x0                  
        
        bl draw_background
        
        bl draw_house
        
        bl draw_trees
        
        bl draw_moon
        
        bl draw_rain
        
        bl draw_base
        
        bl draw_windowv
        
        bl draw_girl
        
        bl draw_books
   	
InfLoop:

    b InfLoop
