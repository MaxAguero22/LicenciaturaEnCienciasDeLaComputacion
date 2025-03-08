#include <stdbool.h>
#include <assert.h>

#include "fixstring.h"


unsigned int fstring_length(fixstring s) {
    unsigned int length = 0u;
    int i = 0;
    while(s[i] != '\0'){
        length = length + 1u;
        i++;
}
return length;
}

bool fstring_eq(fixstring s1, fixstring s2) {
     int i = 0;
    bool equals = true;
    while(s1[i] != '\0' || s2[i] != '\0'){
        if (s1[i] != s2[i]){
            equals = false;
            return equals;
        }
        i++;
    }
return equals;
}

bool fstring_less_eq(fixstring s1, fixstring s2) {
   bool less_equal = true;
    int word_pos = 0;
    while(s1[word_pos] == s2[word_pos] && word_pos < FIXSTRING_MAX){
        word_pos++;
    }
    if(s1[word_pos] > s2[word_pos]){
        less_equal = false;
        return less_equal;
    }
    return less_equal;
}

void fstring_set(fixstring s1, const fixstring s2) {
    int i=0;
    while (i<FIXSTRING_MAX && s2[i]!='\0') {
        s1[i] = s2[i];
        i++;
    }
    s1[i] = '\0';
}

void fstring_swap(fixstring s1,  fixstring s2) {
    fixstring aux;
    fstring_set(aux,s1);
    fstring_set(s1,s2);
    fstring_set(s2,aux);   
}


