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
	.include "rain2.s"
	.include "rainvalues2.s"
	.include "rainvalues.s"

	.globl main
main:

	mov x20, x0 
	// Dibujar fondo y objetos estáticos
	
    	bl draw_background
	bl draw_house
	bl draw_trees
	bl draw_moon
	bl draw_base
	
// Bucle infinito para la animación 
InfLoop:

        
    	movz x5, 0x2c, lsl 16		// Color de las gotas
    	movk x5, 0x394e, lsl 00
    	bl draw_rain
    	

    	// Dibujar elementos que deben estar encima de la lluvia
    	bl draw_windowv
    	bl draw_base
    	bl draw_girl
    	bl draw_books
	
    	// Retardo
    	bl delay
    	
	movz x5, 0x20, lsl 16		// Color de las gotas
    	movk x5, 0x2c3f, lsl 00
    	bl draw_rain
	bl draw_background
	bl draw_house
	bl draw_trees
	bl draw_moon
	bl draw_base
	
	movz x5, 0x2c, lsl 16		// Color de las gotas
    	movk x5, 0x394e, lsl 00
    	bl draw_rain2
    	
	
    	// Dibujar elementos que deben estar encima de la lluvia
    	bl draw_windowv
    	bl draw_base
    	bl draw_girl
    	bl draw_books

    	// Retardo
    	bl delay
	
	movz x5, 0x20, lsl 16		// Color de las gotas
    	movk x5, 0x2c3f, lsl 00
    	bl draw_rain2
    	bl draw_background
	bl draw_house
	bl draw_trees
	bl draw_moon
	bl draw_base

    	b InfLoop

// Subrutina de retardo
delay:
    	movz x15, 0x4FFF, lsl 16
delay_loop:
    	sub x15, x15, 1
    	cbnz x15, delay_loop
    	ret

