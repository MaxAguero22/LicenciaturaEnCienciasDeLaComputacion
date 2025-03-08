#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "string.h"

int main(void) {

    const char *word1 = "hola";
    const char *word2 = "zorro";
    string new_word1 = string_create(word1);
    string new_word2 = string_create(word2);
    
    if(string_less(new_word1, new_word2)){
        printf("La palabra ");
        string_dump(new_word1,stdout);
        printf(" va antes alfabeticamente que ");
        string_dump(new_word2, stdout);
    }
    else{
        printf("La palabra ");
        string_dump(new_word2,stdout);
        printf(" va antes alfabeticamente que ");
        string_dump(new_word1, stdout);
    }

    if(string_eq(new_word1, new_word2)){
        printf("\nSon iguales\n");
    }
    else{
        printf("\nNo son iguales\n");
    }
    
    new_word1 = string_destroy(new_word1);
    new_word2 = string_destroy(new_word2);

    return (EXIT_SUCCESS);
}
