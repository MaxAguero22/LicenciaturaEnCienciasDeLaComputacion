#include<stdio.h>
#include<limits.h>
#include<stdbool.h>
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
bool existe_par(int tam, int a[]){
    int i = 0;
    bool x = false;
    while(i < tam){
        if(a[i] % 2 == 0){
            x = true;
            i = i + 1;
        }
        else{
            x = x;
            i = i + 1;
        }
    }
    return x;
}
bool existe_impar(int tam, int a[]){
    int i = 0;
    bool x = false;
    while(i < tam){
        if(a[i] % 2 != 0){
            x = true;
            i = i + 1;
        }
        else{
            x = x;
            i = i + 1;
        }
    }
    return x;
}

int main(void){
    bool x,y;
    int minpar, minimpar;
    int a[N];
    pedir_arreglo(N,a);
    x = existe_par(N,a);
    y = existe_impar(N,a);
    if (x && y){
    minpar = minimo_pares(N,a);
    minimpar = minimo_impares(N,a);
    printf("el min par es %d y el min impar es %d\n",minpar,minimpar);
    }
    else if (x && !y){
    minpar = minimo_pares(N,a);
    printf("el min par es %d\n",minpar);
    }
    else if (!x && y){
    minimpar = minimo_impares(N,a);
    printf("el min impar es %d\n",minimpar);
    }
    return 0;
}































