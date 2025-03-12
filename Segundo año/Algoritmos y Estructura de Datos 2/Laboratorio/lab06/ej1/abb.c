#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <assert.h>
#include "abb.h"

struct _s_abb {
    abb_elem elem;
    struct _s_abb *left;
    struct _s_abb *right;
};

static bool elem_eq(abb_elem a, abb_elem b) {
    return a == b;
}

static bool elem_less(abb_elem a, abb_elem b) {
    return a < b;
}

static bool invrep(abb tree) {
    
    bool result = true;
    
    // Significa que es vacio
    if(tree == NULL){
        return result;
    }
    else{
        if(tree->left != NULL){
            result = result && elem_less(tree->left->elem, tree->elem);
        }
        if(tree->right != NULL){
            result = result && elem_less(tree->elem, tree->right->elem);
        }
        result = result && invrep(tree->left) && invrep(tree->right);
    }
    return result;
}

abb abb_empty(void) {
    abb tree;
    tree = NULL;
    assert(invrep(tree) && abb_is_empty(tree));
    return tree;
}

abb abb_add(abb tree, abb_elem e) {
    assert(invrep(tree));
    if(abb_is_empty(tree)){
        tree = malloc(sizeof(struct _s_abb));
        assert(tree != NULL);
        tree->elem = e;
        tree->left = NULL;
        tree->right = NULL;
    }
    // El arbol no es vacio
    else{
     	// El elemento ya existe, no tiene efecto
    	if(abb_exists(tree,e)){
    	    return tree;
    	}
    	// El elemento no existe, debemos ubicarlo
    	else{
    	    if(e > tree->elem){
    	        tree->right = abb_add(tree->right, e);
    	    }
    	    else{
    	        tree->left = abb_add(tree->left, e);
    	    }
    	}
    }
    assert(invrep(tree) && abb_exists(tree, e));
    return tree;
}

bool abb_is_empty(abb tree) {
    bool is_empty=false;
    is_empty = tree == NULL;
    assert(invrep(tree));
    return is_empty;
}

bool abb_exists(abb tree, abb_elem e) {
    bool exists=false;
    assert(invrep(tree));
    if(abb_is_empty(tree)){
        return exists;
    }
    else{
        if(elem_eq(tree->elem,e)){
            exists = true;
        }
        else if(elem_less(tree->elem, e)){
            exists = abb_exists(tree->right, e);
        }
        else{
            exists = abb_exists(tree->left, e);
        }
    }
    // assert(abb_length(tree)!=0 || !exists); No tiene mucho sentido
    return exists;
}

unsigned int abb_length(abb tree) {
    unsigned int length=0;
    assert(invrep(tree));
    if(!abb_is_empty(tree)){
        length = 1 + abb_length(tree->left) + abb_length(tree->right);
    } 
    assert(invrep(tree) && (abb_is_empty(tree) || length > 0));
    return length;
}

abb abb_remove(abb tree, abb_elem e) {
    assert(invrep(tree));
    if(abb_is_empty(tree) || !abb_exists(tree,e)){
        return tree;
    }
    if(e < tree->elem){
        tree->left = abb_remove(tree->left,e);
    }
    else if(e > tree->elem){
        tree->right = abb_remove(tree->right,e);
    }
    else{
    	// El nodo no tiene hijos (es una hoja)
        if(tree->left == NULL && tree->right == NULL){
            tree = abb_destroy(tree);
        }
        // El nodo tiene un solo hijo
        else if(tree->left == NULL){
            abb temp = tree;
            tree = tree->right;
            free(temp);
            temp = NULL;
            //temp = abb_destroy(temp);
        }
        else if(tree->right == NULL){
            abb temp = tree;
            tree = tree->left;
            free(temp);
            temp = NULL;
            //temp = abb_destroy(temp);
        }
        // El nodo tiene dos hijos
        else{
            // Buscamos el minimo sub arbol en la derecha
            abb temp = tree->right;
            while(temp->left != NULL){
                temp = temp->left;
            }
            // Reemplazamos el elemento
            tree->elem = temp->elem;
            // Eliminamos el minimo encontrado
            tree->right = abb_remove(tree->right, temp->elem);
        }
    }
    assert(invrep(tree) && !abb_exists(tree, e));
    return tree;
}

abb_elem abb_root(abb tree) {
    abb_elem root;
    assert(invrep(tree) && !abb_is_empty(tree));
    root = tree->elem;
    assert(abb_exists(tree, root));
    return root;
}

abb_elem abb_max(abb tree) {
    abb_elem max_e;
    assert(invrep(tree) && !abb_is_empty(tree));
    abb temp = tree;
    while(temp->right != NULL){
        temp = temp->right;
    }
    max_e = temp->elem;
    assert(invrep(tree) && abb_exists(tree, max_e));
    return max_e;
}

abb_elem abb_min(abb tree) {
    abb_elem min_e;
    assert(invrep(tree) && !abb_is_empty(tree));
    abb temp = tree;
    while(temp->left != NULL){
        temp = temp->left;
    }
    min_e = temp->elem;
    assert(invrep(tree) && abb_exists(tree, min_e));
    return min_e;
}

void abb_dump(abb tree, abb_ordtype ord) {
    assert(invrep(tree) && (ord==ABB_IN_ORDER  || 
                            ord==ABB_PRE_ORDER ||
                            ord==ABB_POST_ORDER));

    if (tree != NULL && ord == ABB_IN_ORDER) {
        abb_dump(tree->left, ord);
        printf("%d ", tree->elem);
        abb_dump(tree->right, ord);
    }
    else if(tree != NULL && ord == ABB_PRE_ORDER){
        printf("%d ", tree->elem);
        abb_dump(tree->left, ord);
        abb_dump(tree->right, ord);
    }
    else if(tree != NULL && ord == ABB_POST_ORDER){
        abb_dump(tree->left, ord);
        abb_dump(tree->right, ord);
        printf("%d ", tree->elem);
    }
}

abb abb_destroy(abb tree) {
    assert(invrep(tree));
    if(!abb_is_empty(tree)){
        tree->left = abb_destroy(tree->left);
        tree->right = abb_destroy(tree->right);
        free(tree);    
    }
    tree = NULL;
    assert(tree == NULL);
    return tree;
}
