#include<stdio.h>
#define N 5

void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i++;
    }
}
int suma_cuadrados_pares(int a[], int tam){
    int result = 0;
    int i = 0;
    while(i < tam){
        if(a[i] % 2 == 0){
            result = result + (a[i] * a[i]);
        }
        i++;    
    }
return result;
}

int main(void){
    int result = 0;
    int a[N];
    pedir_arreglo(a,N);
    result = suma_cuadrados_pares(a,N);
    printf("El resultado es %d\n",result);
return 0;
}
