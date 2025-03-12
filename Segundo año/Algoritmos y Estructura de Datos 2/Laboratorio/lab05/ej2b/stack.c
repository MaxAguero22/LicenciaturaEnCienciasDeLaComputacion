#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#include "stack.h"
 
typedef struct _s_stack{
    struct s_node *top;
    unsigned int size;
} _s_stack;

struct s_node {
    stack_elem elem;
    struct s_node *next;
};

stack stack_empty(){
    stack new_stack = NULL;
    return new_stack;
}

bool stack_is_empty(stack s){
    return s == NULL;
}

/* Orden constante, nos agrega un elemento al tope del stack */
stack stack_push(stack s, stack_elem e){
    struct s_node *q = NULL;
    q = malloc(sizeof(struct s_node));
    q->elem = e;
    if(s != NULL){
        q->next = s->top;
        s->top = q;
        s->size = (s == NULL) ? 1 : s->size + 1;
    }
    else{
        stack new_stack = malloc(sizeof(_s_stack));
        new_stack->top = q;
        new_stack->size = 1;
        s = new_stack;
    }
    return s;
}


/* Esto es de orden constante, elimina el tope */
stack stack_pop(stack s){
    if(!stack_empty(s)){
        if(s->top->next == NULL){
            free(s->top);
            free(s);
            s = NULL;
            return s;
        }
        else{
            struct s_node *q = NULL;
            q = s->top;
            s->top = s->top->next;
            s->size--;
            free(q);
            q = NULL;
        }
    }
    return s;
}

/* Orden constante nos da el largo del stack */
unsigned int stack_size(stack s){
    unsigned int len = 0;
    if(s != NULL){
        len = s->size;
    }
    return len;
}

/* de orden constante, el tope de la lista es el primer elemento */
stack_elem stack_top(stack s){
    assert(s != NULL);
    return s->top->elem;
}

/* orden secuencial recorre cada elemento y lo guarda en un arreglo */
stack_elem *stack_to_array(stack s){
    stack_elem *array = NULL;
    if(!stack_is_empty(s)){
        unsigned int size = stack_size(s);
        array = (stack_elem *)calloc(size, sizeof(stack_elem)); 
        struct s_node *q = s->top;
        unsigned int i = size - 1u;
        while(q != NULL){
            array[i] = q->elem;
            q = q->next;
            i--;
        }
    }
    return array;
}

stack stack_destroy(stack s){
    if(s != NULL){
    struct s_node *actual_node = s->top;
    struct s_node *next_node;
    while(actual_node != NULL){
        next_node = actual_node->next;
        free(actual_node);
        actual_node = next_node;
    }
    free(s);
    s = NULL;
    }
    return s;
}
