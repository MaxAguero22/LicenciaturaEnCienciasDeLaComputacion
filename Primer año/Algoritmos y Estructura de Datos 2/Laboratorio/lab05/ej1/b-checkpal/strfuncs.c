#include "strfuncs.h"
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>


size_t string_length(const char *str){
    size_t length = 0;
    int i = 0;
    while(str[i] != '\0'){
      length = length + 1u;
        i++;
    }
return length;
}


char *string_filter(const char *str, char c){

    int length = 0;
    const char *ptr = str;
    while (*ptr != '\0') {
        if (*ptr != c) {
            length++;
        }
        ptr++;
    }

    char *result = malloc((length + 1) * sizeof(char));
    if (result == NULL) {
        fprintf(stderr, "Error: No se pudo asignar memoria\n");
        exit(EXIT_FAILURE);
    }

    char *result_ptr = result;
    ptr = str;
    while (*ptr != '\0') {
        if (*ptr != c) {
            *result_ptr = *ptr;
            result_ptr++;
        }
        ptr++;
    }
    *result_ptr = '\0';
    
    return result;
}

bool string_is_symmetric(const char *str){
    bool result = true;
    unsigned int length = string_length(str);
    length = length - 1u;
    unsigned int i = 0;
    
    while(i < length){
        if(str[i] != str[length]){
            result = false;
            return result;
        }
        i++;
        length--;
    }
return result;
}
