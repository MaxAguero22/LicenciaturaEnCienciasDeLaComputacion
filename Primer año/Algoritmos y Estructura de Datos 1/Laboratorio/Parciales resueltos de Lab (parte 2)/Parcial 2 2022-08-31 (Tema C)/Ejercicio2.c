#include<stdio.h>
#define N 5
#include<limits.h>
void pedir_arreglo(int a[], int tam){
    int i = 0;
    printf("Ingrese un arreglo de %d elementos\n",tam);
    while(i < tam){
        scanf("%d",&a[i]);
        i++;
    }
}

int indice_maximo_par(int a[], int tam){
    int max = INT_MIN;
    int indice = -1;
    int i = 0;
    while(i < tam){
        if(a[i] % 2 == 0 && i > max){
           indice = i; 
        }
        i++;
    }
return indice;
}

int main(void){
    int indice;
    int a[N];
    pedir_arreglo(a,N);
    indice = indice_maximo_par(a,N);
    printf("El maximo indice con un elemento par es %d\n",indice);

return 0;
}
