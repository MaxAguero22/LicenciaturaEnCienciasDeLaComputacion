#include <stdlib.h>
#include <assert.h>
#include "list.h"
#include <stdbool.h>

typedef struct Node {
    list_elem elem;
    struct Node *next;
} Node;


/* Constructors */

    /* crea una lista vacía. */
    list empty(void){
        list l;
        l = NULL;
        return l;
    }
    
    /* agrega el elemento e al comienzo de la lista l. */
    list addl(list_elem e, list l){
        Node* p = NULL;
        p = malloc(sizeof(Node));
        p->elem = e;
        p->next = l;
        l = p;
        return l;
    }
    
    
/* Destroy */
    
    /* Libera memoria en caso que sea necesario. */
    list destroy(list l){
        if(!is_empty(l)){
            destroy(l->next);
            free(l);
        }
        l = NULL;
        return l;
    }

/* Operations */

    /* Devuelve True si l es vacía. */
    bool is_empty(list l){
        bool b = l == NULL;
        return b;
    }
    
    /* Devuelve el primer elemento de la lista l. */
    /* PRE: not is_empty(l) */
    list_elem head(list l){
        assert(!is_empty(l));
        list_elem elem = l->elem;
        return elem;
    }
    
    /* Elimina el primer elemento de la lista l. */
    /* PRE: not is_empty(l) */
    list tail(list l){
        Node* p = NULL;
        p = l;
        l = l->next;
        free(p); 
        return l;
    }
    
    /* Agrega el elemento e al final de la lista l. */
    list addr(list l, list_elem e){
        Node* p;
        Node* q;
        q = malloc(sizeof(Node));
        q->elem = e;
        q->next = NULL;
        if(!is_empty(l)){
            p = l;
            while(p->next != NULL){
                p = p->next;
            }
            p->next = q;
        }
        else{
            l = q;
        }
    return l;
    }
    
    /* Devuelve la cantidad de elementos de la lista l. */
    int length(list l){
        int lgth = 0;
        if(!is_empty(l)){
            Node* p = l;
            while(p != NULL){
                lgth = lgth + 1;
                p = p->next;
            }
        }
        return lgth;
    }
    
    /* Agrega al final de l todos los elementos de l0 
    en el mismo orden. */
    list concat(list l, list l2){
        Node* p;
        if(l == NULL && l2 != NULL){
            l = l2;
        }
        else{
            p = l;
            while(p->next != NULL){
                p = p->next;
            }
            p->next = l2;
        }
    return l;
    }
    
    /* Devuelve el n-ésimo elemento de la lista l. */
    /* PRE: length(l) > n */
    list_elem index(list l, int n){
        assert(length(l) > n);
        list_elem e;
        Node* p;
        p = l;
        for(int i = 0; i < n; i++){
            p = p->next;
        }
        e = p->elem;
        
        return e;
    }
    
    /* Deja en l sólo los primeros n
    elementos, eliminando el resto. */
    list take(list l, int n){
       Node* p = l;
       int i = 0;
       while(!is_empty(l) && i < n){
           p = p->next;
           i = i + 1;
       }
       destroy(p);
       free(p);
       
       return l;
   }
    
    /* Elimina los primeros n elementos de l. */
    list drop(list l, int n){
        int i = 0;
        while(!is_empty(l) && i < n){
            tail(l);
            i = i + 1;
        }
        return l; 
    }
    
    /* Copia todos los elementos de l1 en la nueva lista l2. */
    list copy_list(list l){
        Node* p;
        list l2 = NULL;
        int n = length(l);
        if (l == NULL){
            l2 = empty();
        }
        else{
            p = l;
            list temp = NULL;
            l2 = malloc(sizeof(Node));
            for(int i = 0; i < n; i++){
                Node* newnode = malloc(sizeof(Node));
                newnode->elem = p->elem;
                newnode->next = NULL;
            
                if (temp == NULL){
                    l2 = newnode;
                    temp = l2;
                }
                else{
                    temp->next = newnode;
                    temp = temp->next;
                }
                p = p->next;  
            }
        }
    return l2;
    }
    

