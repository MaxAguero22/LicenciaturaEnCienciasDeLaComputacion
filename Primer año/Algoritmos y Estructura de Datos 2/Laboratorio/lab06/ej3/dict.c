#include <assert.h>
#include "dict.h"
#include "key_value.h"
#include <stdlib.h>
#include <stdbool.h>

struct _node_t {
    dict_t left;
    dict_t right;
    key_t key;
    value_t value;
};

static bool invrep(dict_t d) {
    if (d == NULL) {
        return true;
    }
    bool result = true;
    // si hay subarbol izquierdo, su palabra es menor a la raiz
    if (d->left != NULL) {
        result = result && key_less(d->left->key, d->key);
    }
    // si hay subarbol derecho, la raiz es menor a este
    if (d->right != NULL) {
        result = result && key_less(d->key, d->right->key);
    }
    // verificamos el resto del arbol
    result = result && invrep(d->left) && invrep(d->right);
    return result;
}

dict_t dict_empty(void) {
    dict_t dict = NULL;
    assert(invrep(dict) && dict_length(dict) == 0);
    return dict;
}

dict_t dict_add(dict_t dict, key_t word, value_t def) {
    assert(invrep(dict));
    // si es vacio creamos el nodo
    if(dict == NULL) {
        dict = malloc(sizeof(struct _node_t));
        assert(dict != NULL);
        dict->key = word;
        dict->value = def;
        dict->left = NULL;
        dict->right = NULL;
    } 
    // si dict es no vacio
    else{
        // la palabra no existe
        if(!dict_exists(dict, word)) {
            // la palabra es menor a la raiz
            if(key_less(word, dict->key)) {
                dict->left = dict_add(dict->left, word, def);
            } 
            // la palabra es mayor a la raiz
            else{
                dict->right = dict_add(dict->right, word, def);
            }
        }
        // la palabra si existe
      	else{
            dict_t aux = dict;
            while(!key_eq(word, aux->key)){
                if(key_less(word, aux->key)){
                    aux = aux->left;
                } 
                else{
                    aux = aux->right;
                }
            }
            aux->value = value_destroy(aux->value);
            aux->value = def;
            // No se si debo liberar memoria para word ya que no se usa
        }
    }
    
    assert(invrep(dict) && dict_exists(dict, word));
    return dict;
}

value_t dict_search(dict_t dict, key_t word) {
    value_t def = NULL;
    if (dict_exists(dict, word)) {
        dict_t aux = dict;
        while (!key_eq(word, aux->key)) {
            if (key_less(word, aux->key)) {
                aux = aux->left;
            } else {
                aux = aux->right;
            }
        }
        def = aux->value;
    }
    return def;
}

bool dict_exists(dict_t dict, key_t word) {
    bool result = false;
    if(dict != NULL){
        if (key_eq(word, dict->key)) {
            result = true;
        } else if (key_less(word, dict->key)) {
            result = result || dict_exists(dict->left, word);
        } else {
            result = result || dict_exists(dict->right, word);
        }
    }
    return result;
}

unsigned int dict_length(dict_t dict) {
    unsigned int length = 0u;
    assert(invrep(dict));
    if (dict != NULL) {
        length = 1 + dict_length(dict->left) + dict_length(dict->right);
    }
    return length;
}

dict_t dict_remove(dict_t dict, key_t word) {
    assert(invrep(dict));
    // Diccionario vacio
    if (dict == NULL || !dict_exists(dict, word)) {
        if(dict == NULL){
            printf("El diccionario es vacio\n");
        }
        else if(!dict_exists(dict, word)){
            printf("La palabra que queres eliminar no existe\n");
        }
        return dict;
    }
    // No es vacio y si existe
    else if(dict != NULL && dict_exists(dict, word)){
        if (key_eq(word, dict->key)){
            // Es una hoja
            if (dict->left == NULL && dict->right == NULL) {
                printf("Es una hoja\n");
                dict->value = value_destroy(dict->value);
                dict->key = key_destroy(dict->key);
                free(dict);
                dict = NULL;
            }
            // Tiene un solo hijo derecho
            else if (dict->left == NULL) {
                printf("Tiene un solo hijo izquierdo\n");
                dict_t temp = dict;
                dict = dict->right;
                temp->value = value_destroy(temp->value);
                temp->key = key_destroy(temp->key);
                free(temp);
                temp = NULL;
            }
            // Tiene un solo hijo izquierdo
            else if (dict->right == NULL) {
                printf("Tiene un solo hijo derecho\n");
                dict_t temp = dict;
                dict = dict->left;
                temp->value = value_destroy(temp->value);
                temp->key = key_destroy(temp->key);
                free(temp);
                temp = NULL;
            }
            // Tiene dos hijos
            else {
                printf("Tiene dos hijos\n");
                // Buscamos el minimo derecho
                dict_t temp = dict->right;
                while (temp->left != NULL) {
                    temp = temp->left;
                }
                dict->key = key_destroy(dict->key);
                dict->value = value_destroy(dict->value);
                if(dict->right == temp){
                    temp->left = dict->left;
                    dict = temp;
                }
                else{
                    temp->right = dict->right;
                    temp->left = dict->left;
                    dict = temp;     
                }  
            }    
        }
        else if (key_less(word, dict->key)) {
            dict->left = dict_remove(dict->left, word);
            printf("No es igual, busco por la izquierda\n");
        }
        else{
            printf("No es igual, busco por la derecha\n");
            dict->right = dict_remove(dict->right, word);
        }
    }
    assert(!dict_exists(dict, word));
    assert(invrep(dict));
    return dict;
}

dict_t dict_remove_all(dict_t dict) {
    assert(invrep(dict));
    
    dict = dict_destroy(dict);
    assert(dict == NULL);

    dict = dict_empty();  

    assert(dict_length(dict) == 0);  
    assert(invrep(dict));
    return dict;
}

void dict_dump(dict_t dict, FILE *file) {
    if (file != NULL) {
        if (dict != NULL) {
            dict_dump(dict->left, file);
            key_dump(dict->key, file);
            fprintf(file, ": ");
            value_dump(dict->value, file);
            fprintf(file, "\n");;
            dict_dump(dict->right, file);
        }
    } else {
        printf("Invalid file\n");
    }
}

dict_t dict_destroy(dict_t dict) {
    assert(invrep(dict));
    if(dict != NULL){
        
        dict_destroy(dict->left);
        dict_destroy(dict->right);
        dict->key = key_destroy(dict->key);
        dict->value = value_destroy(dict->value);
        
        free(dict);
        dict = NULL;
    }
    assert(dict == NULL);
    return dict;
}
