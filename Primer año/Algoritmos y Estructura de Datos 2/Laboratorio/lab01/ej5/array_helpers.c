#include "array_helpers.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "mybool.h"

unsigned int array_from_file(int array[],
                             unsigned int max_size,
                             const char *filepath) {
    FILE *fp;
    unsigned int size;
    fp = fopen(filepath,"r");
    if(fp != NULL){
        fscanf(fp,"%u",&size);
        if(size < max_size){
            for(unsigned int i = 0; i < size; i++){
                fscanf(fp,"%d",&array[i]);
            }
            fclose(fp);
            return size;
        }
        else{
            printf("El tamaño del arreglo no es valido\n");
            return 0;
        }
    }
    else{
        printf("El archivo no existe\n");
        return 0;
    }   
}

void array_dump(int a[], unsigned int length) {

    for(unsigned int i = 0; i < length; i++){
        if(i != (length - 1)){
            printf("%d,",a[i]);
        }
        else{
            printf("%d\n",a[i]);
        }
    }
}

mybool array_is_sorted(int a[], unsigned int length){
    mybool orden = true;
    for(unsigned int i = 0; (i < length - 1) && orden; i++){
        if(a[i] > a[i+1]){
            orden = false;
        }
    }
    return orden;
}
