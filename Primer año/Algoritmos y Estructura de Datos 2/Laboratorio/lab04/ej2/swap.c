#include<stdlib.h>
#include<stdio.h>

void swap(int *a,int *b){
    int aux = *a;
    *a = *b;
    *b = aux;
}

void print(int x, int y){
    printf("Los valores son %d y %d\n",x,y);
}

int main(void){
    int x, y, r;
    x = 6;
    y = 4;
    print(x, y);
    swap(&x, &y);
    print(x, y);
    r = 0;

    return r;
}

