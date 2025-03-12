#include <stdlib.h>
#include <assert.h>
#include "stack.h"
#include <stdio.h>


int main(void) {

    stack s = stack_empty();
    s = stack_push(s, 2);
    printf("agregamos 1 elemento al stack\n");
    s = stack_pop(s);
    printf("Quitamos el tope del stack (el cual es de un elemento)\n");
    if(s == NULL){
        printf("Luego del stack_pop a un stack de un elemento, s apunta a null\n");
    } 
    else{
        printf("Luego del push, s no apunta a null\n");
    }
    s = stack_push(s, 3);
    if(s != NULL){
        printf("Pudimos volver agregar un elemento luego de que s quedara vacio\n");
    }
    
    
    stack q = stack_empty();
    q = stack_push(q,1);
    q = stack_push(q,2);
    q = stack_push(q,3);
    q = stack_push(q,4);
    q = stack_push(q,5);
    stack_elem* array = stack_to_array(q);

    unsigned int i = 0;
    unsigned int len = stack_size(q);
    printf("Los elementos del arreglo son: \n");
    while(i < len){
        printf("%d\n", array[i]);
        i++;
    }
    printf("Valores esperados: 1,2,3,4,5\n");
    
    stack p = stack_empty();
    stack_elem* a = stack_to_array(p);
    if(a == NULL){
        printf("Finalmente, stack_to_array() devuelve NULL para una pila vacia\n");
    }


    
    q = stack_destroy(q);
    s = stack_destroy(s);
    p = stack_destroy(p);
    free(array);
    free(a);
    
    return EXIT_SUCCESS; 
}

/*
    ¿Funciona bien stack_pop() para pilas de tamaño 1?
      No, me da una violacion de segmento. Puse un condicional para cubrir ese caso.

    Si la pila queda vacía, ¿puedo volver a insertar elementos?
      Si, se puede. Ya que ahora el stack_pop() si el stack tiene un elemento, lo quita y deja en null el stack. Equivale a estack vacio.

    ¿La función stack_to_array() devuelve NULL para una pila vacía? ¿Devuelve los elementos en el orden correcto?
       Devuelve los elementos en el orden correcto y ademas si la pila es vacia stack_to_array() devuelve NULL. 
 
*/

























