#include<stdio.h>
#include<limits.h>
#define N 5
void pedir_arreglo(int tam, int a[]){
    int i = 0;
    printf("ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i = i + 1;
    }
}
int minimo_pares(int tam, int a[]){
    int i = 0;
    int r = INT_MAX;
    while(i < tam){
        if(a[i] % 2 == 0 && a[i] < r){
            r = a[i];
            }
        i = i + 1;
    }
    return r;
}
int minimo_impares(int tam, int a[]){
    int i = 0;
    int r = INT_MAX;
    while(i < tam){
        if(a[i] % 2 != 0 && a[i] < r){
            r = a[i];
            }
        i = i + 1;
    }
    return r;
}
int main(void){
    int minpar, minimpar;
    int a[N];
    pedir_arreglo(N,a);
    minpar = minimo_pares(N,a);
    minimpar = minimo_impares(N,a);
    printf("el minimo elemento par es %d y el minimo elemento impar es %d\n",minpar,minimpar);
    if(minpar <= minimpar){
        printf("Luego el minimo del arreglo es %d\n",minpar);
    }
    else{
        printf("Luego el minimo del arreglo es %d\n",minimpar);
    }
    return 0;
}

