#include <assert.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

#include "array_helpers.h"
#include "sort_helpers.h"
#include "sort.h"
#include "fixstring.h"


static unsigned int partition(fixstring a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = izq;
    unsigned int i = izq + 1u;
    unsigned int j = der;
    while(i <= j){
    if(goes_before(a[i],a[ppiv])){
        i = i + 1u;
    }
    else if(goes_before(a[ppiv],a[j])){
        j = j - 1u;
    }
    else if(goes_before(a[ppiv],a[i]) && goes_before(a[j],a[ppiv])){
        swap(a,i,j);
        i = i + 1u;
        j = j - 1u;
    }
    
    }
    swap(a,ppiv,j);
    ppiv = j;
    return ppiv;
}

static void quick_sort_rec(fixstring a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv;
    if (der > izq){
        ppiv = partition(a,izq,der);
        quick_sort_rec(a,izq, (ppiv == 0u) ? 0u : ppiv - 1u);
        quick_sort_rec(a,ppiv+1u,der);
    }
}

void quick_sort(fixstring a[], unsigned int length) {
    quick_sort_rec(a, 0, (length == 0) ? 0 : length - 1);
}


static unsigned int partition_2(fixstring a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv = izq;
    unsigned int i = izq + 1u;
    unsigned int j = der;
    while(i <= j){
    if(fstring_length(a[i]) <= fstring_length(a[ppiv])){
        i = i + 1u;
    }
    else if(fstring_length(a[ppiv]) <= fstring_length(a[j])){
        j = j - 1u;
    }
    else if(fstring_length(a[ppiv]) < fstring_length(a[i]) && fstring_length(a[j]) < fstring_length(a[ppiv])){
        swap(a,i,j);
        i = i + 1u;
        j = j - 1u;
    }
    
    }
    swap(a,ppiv,j);
    ppiv = j;
    return ppiv;
}

static void quick_sort_rec_2(fixstring a[], unsigned int izq, unsigned int der) {
    unsigned int ppiv;
    if (der > izq){
        ppiv = partition_2(a,izq,der);
        quick_sort_rec_2(a,izq, (ppiv == 0u) ? 0u : ppiv - 1u);
        quick_sort_rec_2(a,ppiv+1u,der);
    }
}

void quick_sort_2(fixstring a[], unsigned int length) {
    quick_sort_rec_2(a, 0, (length == 0) ? 0 : length - 1);
}
