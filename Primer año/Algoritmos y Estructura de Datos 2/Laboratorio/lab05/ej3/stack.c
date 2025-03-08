#include <stdlib.h>
#include <assert.h>
#include <stdio.h>
#include "stack.h"

struct _s_stack {
    stack_elem *elems;      // Arreglo de elementos
    unsigned int size;      // Cantidad de elementos en la pila
    unsigned int capacity;  // Capacidad actual del arreglo elems
};

static bool invrep(stack s){
    bool result = true;
    if(s != NULL){
        if(s->size > s->capacity){
            result = false;
        } 
    }
    return result;
}



stack stack_empty(){
    stack new_stack = malloc(sizeof(struct _s_stack));
    if (new_stack == NULL) {
        perror("Error creating stack");
        exit(EXIT_FAILURE);
    }
    new_stack->elems = calloc(MAX_CAPACITY, sizeof(stack_elem));
    if(new_stack->elems == NULL){
        printf("Error allocating stack elements\n");
        free(new_stack);
        exit(EXIT_FAILURE);
    }
    new_stack->size = 0;
    new_stack->capacity = MAX_CAPACITY;
    return new_stack;
}

//agrega un elemento al stack
stack stack_push(stack s, stack_elem e){
    assert(invrep(s));
    if(s->size == s->capacity){
     	stack_elem *new_elems = realloc(s->elems, s->capacity * 2 * sizeof(stack_elem));
     	if(new_elems == NULL){
     	    printf("Error in realloc\n");
     	    exit(EXIT_FAILURE);
     	}   
        s->elems = new_elems;
        s->capacity = s->capacity * 2;
    }  
    s->elems[s->size] = e;
    s->size++;
    return s;
}

//elimina el tope del stack
stack stack_pop(stack s){
  assert(invrep(s));
  stack result = s;
  if(!stack_is_empty(s)){
      result->size = result->size - 1u;
  }
  return result;
}

//largo del stack
unsigned int stack_size(stack s){
  assert(invrep(s));
  unsigned int len = 0;
  if(!stack_is_empty(s)){
      len = s->size;
  }
  return len;
}

//nos da el tope del stack
stack_elem stack_top(stack s){
    assert(invrep(s));
    assert(s != NULL);
    stack_elem result;
    result = s->elems[s->size-1u];
    return result;
}

bool stack_is_empty(stack s){
   assert(invrep(s));
   bool b = false;
   if(s != NULL){
       b = s->size == 0;
   }
   return b;
}

/* orden secuencial recorre cada elemento y lo guarda en un arreglo */
stack_elem *stack_to_array(stack s){
    assert(invrep(s));
    stack_elem *array = NULL;
    if(!stack_is_empty(s)){
        array = calloc(s->size, sizeof(stack_elem)); 
        unsigned int i = 0;
        while(i < s->size){
            array[i] = s->elems[i];
            i++;
        }
    }
    return array;
}

stack stack_destroy(stack s){
    assert(invrep(s));
    if(s != NULL){
        free(s->elems);
        free(s);
    }
    s = NULL;
    return s;
}
