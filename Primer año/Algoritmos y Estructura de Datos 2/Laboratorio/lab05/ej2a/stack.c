#include <stdlib.h>
#include <assert.h>
#include "stack.h"
 
typedef struct _s_stack{
    stack_elem elem;
    stack next;
} _s_stack;


stack stack_empty(){
    stack new_stack = NULL;
    return new_stack;
}

bool stack_is_empty(stack s){
    return s == NULL;
}

stack stack_push(stack s, stack_elem e){
    stack q = NULL;
    q = malloc(sizeof(_s_stack));
    q->elem = e;
    q->next = s;
    return q;
}

stack stack_pop(stack s){
    if(s->next == NULL){
        free(s);
        s = NULL;
    }
    else{
    stack q;
    q = s;
    s = s->next;
    free(q);
    q = NULL;
    }
    return s;
}

unsigned int stack_size(stack s){
    unsigned int len = 0;
    if(s != NULL){
        stack q = s;
        while(q != NULL){
            q = q->next;
            len = len + 1;
        }
    }
    return len;
}

stack_elem stack_top(stack s){
    assert(s != NULL);
    return s->elem;
}

stack_elem *stack_to_array(stack s){
    stack_elem *array = NULL;
    if(!stack_is_empty(s)){
        unsigned int size = stack_size(s);
        array = (stack_elem *)calloc(size, sizeof(stack_elem)); 
        stack q = s;
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
    if(!stack_is_empty(s)){
       stack_destroy(s->next);
       free(s);
    }
    s = NULL;
    return s;
}

























