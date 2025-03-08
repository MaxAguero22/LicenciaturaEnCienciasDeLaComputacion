#include<stdio.h>
#include<stdbool.h>
#include<assert.h>
#include<glib.h>

#include "command.h"
#include "strextra.h"

/* =========== SIMPLE COMMAND ===========
 *
 * Struct example : ([char*],char*,char*) 
 *
 * implement with :
 *
 *     struct GSList {
 *         gpointer data;
 *         GSList* next;
 *     }
 */

struct scommand_s {
    GSList *cmd_args;
    char *redir_in;
    char *redir_out;
};

scommand scommand_new(void){
    scommand result = malloc(sizeof(struct scommand_s));
    assert(result != NULL);
    result->cmd_args = NULL;
    result->redir_in = NULL;
    result->redir_out = NULL;
    
    // Post:
    assert(scommand_is_empty(result));
    assert(scommand_get_redir_in(result) == NULL &&
    scommand_get_redir_out(result) == NULL);
    
    return result;
}

scommand scommand_destroy(scommand self){
    assert(self != NULL);
    
    // free each list elems:
    while(self->cmd_args != NULL){
        scommand_pop_front(self);
    }
    
    // free redir_in and redir_out:
    if(self->redir_in != NULL){
        free(self->redir_in);
    }
    if(self->redir_out != NULL){
        free(self->redir_out);
    }
    free(self);
    self = NULL;
    assert(self == NULL);
    return self;
}

void scommand_push_back(scommand self, char * argument){
    // Pre:
    assert(self != NULL && argument != NULL);
    
    self->cmd_args = g_slist_append(self->cmd_args, (void*)argument);

    // Post:
    assert(!scommand_is_empty(self));
}

void scommand_pop_front(scommand self){
    assert(self != NULL && !scommand_is_empty(self));

    // Se libera el contenido del nodo
    char *first_elem = (char *)g_slist_nth_data(self->cmd_args, 0);
    free(first_elem);
    
    // Se elimina el nodo y se libera su memoria
    self->cmd_args = g_slist_delete_link(self->cmd_args, self->cmd_args);
}

void scommand_set_redir_in(scommand self, char * filename){
    assert(self != NULL);
    
    // Si ya tiene una dirección, libero memoria.
    if(self->redir_in != NULL){
        free(self->redir_in);
        self->redir_in = NULL;
    }
    self->redir_in = filename;
}

void scommand_set_redir_out(scommand self, char * filename){
    assert(self != NULL);
    // Si ya tiene una dirección, libero memoria.
    if(self->redir_out != NULL){
        free(self->redir_out);
        self->redir_out = NULL;
    }
    self->redir_out = filename;
}

bool scommand_is_empty(const scommand self){
    assert(self != NULL);
    return g_slist_length(self->cmd_args) == 0;
}

unsigned int scommand_length(const scommand self){
    assert(self != NULL);
    unsigned int length = g_slist_length(self->cmd_args);
    if(length == 0){
        assert(scommand_is_empty(self));
    }
    return length;
}

char * scommand_front(const scommand self){
    assert(self != NULL && !scommand_is_empty(self));
    char *result = NULL;
    
    // Se obtiene la dirección del primer elemento
    result = (char *)g_slist_nth_data(self->cmd_args, 0);
    
    assert(result != NULL);
    return result;
}

char * scommand_get_redir_in(const scommand self){
    assert(self != NULL);
    char *result = self->redir_in;
    return result;
}

char * scommand_get_redir_out(const scommand self){
    assert(self != NULL);
    char *result = self->redir_out;
    return result;
}

char * scommand_to_string(const scommand self){
    assert(self != NULL);

    // Inicializamos la cadena resultante:
    char *result = malloc(1);
    strcpy(result, "");
    
    // Copiamos cada elemento de la lista y lo concatenamos al resultado
    guint length = g_slist_length(self->cmd_args);
    char *current = NULL;
    for(guint i = 0; i < length; i++){
        // Obtengo la dirección del i-esimo elemento
        current = (char *)g_slist_nth_data(self->cmd_args, i);
        
        // Concatenar
        char *new_result = strmerge(result, current);
        free(result); 
        result = new_result;
        
        new_result = strmerge(result, " ");
        free(result); 
        result = new_result;
    }

    if (scommand_get_redir_in(self) != NULL) {
        char *new_result = strmerge(result, "< ");
        free(result); 
        result = new_result;
        
        new_result = strmerge(result, scommand_get_redir_in(self));
        free(result); 
        result = new_result;
        
        new_result = strmerge(result, " ");
        free(result); 
        result = new_result;
    }

    if (scommand_get_redir_out(self) != NULL) {
        char *new_result = strmerge(result, "> ");
        free(result); 
        result = new_result;
        
        new_result = strmerge(result, scommand_get_redir_out(self));
        free(result); 
        result = new_result;
        
        new_result = strmerge(result, " ");
        free(result); 
        result = new_result;
    }
    
    assert(scommand_is_empty(self) || scommand_get_redir_in(self) == NULL ||
    scommand_get_redir_out(self) == NULL || strlen(result) > 0);
    return result;
}

/* =========== PIPELINE ===========
 *
 * Struct example : ([scommand], bool)
 *
 */

struct pipeline_s {
    GSList *commands;
    bool wait;
};

pipeline pipeline_new(void){
    pipeline result = NULL;
    result = malloc(sizeof(struct pipeline_s));
    assert(result != NULL);
    
    result->commands = NULL;
    result->wait = true;
    
    assert(result != NULL);
    assert(pipeline_is_empty(result));
    assert(pipeline_get_wait(result) == result->wait);
    return result;
}

pipeline pipeline_destroy(pipeline self){
    assert(self != NULL);
    while(self->commands != NULL){
        pipeline_pop_front(self);
    }
    free(self);
    self = NULL;
    assert(self == NULL);    
    return self;
}

void pipeline_push_back(pipeline self, scommand sc){
    assert(self != NULL);
    assert(sc != NULL);  
    
    self->commands = g_slist_append(self->commands, (void*)sc);

    assert(!pipeline_is_empty(self));
}

void pipeline_pop_front(pipeline self){
    assert(self != NULL);
    assert(!pipeline_is_empty(self));
    
    // Se libera el contenido del nodo
    scommand first_elem = (scommand)g_slist_nth_data(self->commands, 0);
    scommand_destroy(first_elem);
    
    // Se elimina el nodo y se libera su memoria
    self->commands = g_slist_delete_link(self->commands, self->commands);
}

void pipeline_set_wait(pipeline self, const bool w){
    assert(self != NULL);
    self->wait = w;
}

bool pipeline_is_empty(const pipeline self){
    assert(self != NULL);
    return g_slist_length(self->commands) == 0;
}

unsigned int pipeline_length(const pipeline self){
    assert(self != NULL);
    unsigned int length = g_slist_length(self->commands);
    if(length == 0){
        assert(pipeline_is_empty(self));
    }
    return length;
}

scommand pipeline_front(const pipeline self){
    assert(self != NULL);
    assert(!pipeline_is_empty(self));
    scommand result = NULL;
    
    result = (scommand)g_slist_nth_data(self->commands, 0);
    
    assert(result != NULL);
    return result;
}

bool pipeline_get_wait(const pipeline self){
    assert(self != NULL);
    return self->wait;
}

char * pipeline_to_string(const pipeline self){
    assert(self != NULL);
    
    char *result = malloc(1);
    strcpy(result, "");
    
    unsigned int length =  pipeline_length(self);
    char *current_str = NULL;
    for(unsigned int i = 0; i < length; i++){
        // Obtengo la dirección del i-esimo elemento
        scommand current = (scommand)g_slist_nth_data(self->commands, i);

        // Convierto el i-esimo scommand a string 
        current_str = scommand_to_string(current);
       
        // Concatenar ambos
        char *new_result = strmerge(result, current_str);
        free(result);
        result = new_result;
        
        // Libero la memoria asignada por scommand_to_string antes de reutilizarla
        free(current_str);
        current_str = NULL;
        
        if(i == length - 1u){
            if(!pipeline_get_wait(self)){
                char *new_result = strmerge(result, "& ");
                free(result);
                result = new_result;
            }
        }
        else{
            char *new_result = strmerge(result, "| ");
            free(result);
            result = new_result;
        }    
    }
    assert(pipeline_is_empty(self) || pipeline_get_wait(self) || strlen(result) > 0);
    return result;
}
